#!/usr/bin/env bash
# Episode 02 — "Good Morning, Bubu!" — RECUT assembly
# Applies all changes from episode_02_recut_proposal.md §§3–5:
#   - New clip trim windows (01: 0→2.7, 02: 0→2.8, 03: 0→2.3, 05: 0.3417→end)
#   - Scene0→1 0.4s cross-dissolve (replaces hard cut)
#   - Scene4 freeze reduced: tpad 0.9583s → 0.38s
#   - Loop-seam offset: 12.3 → 13.8 (new 14.0s total)
#   - Text overlay windows retimed per §4
#   - Audio: brand_sting 1.0→0.6, tap.wav ×3 at 2.8/3.7/4.6s,
#     music duck 5.6–7.9, discovery/wow at 7.9, pop/chant at 8.4,
#     alimiter 0.95→0.85
#
# Output: final/bubu_ep02_good_morning_bubu_recut.mp4 (1080x1920, 30fps, 14.0s)

set -euo pipefail

EP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$EP_DIR/../.." && pwd)"
VIDEO_DIR="$EP_DIR/videos"
AUDIO_DIR="$PROJECT_ROOT/audio/evergreen"
TMP_DIR="$EP_DIR/final/tmp_recut"
FINAL_DIR="$EP_DIR/final"
FINAL_OUT="$FINAL_DIR/bubu_ep02_good_morning_bubu_recut.mp4"
FONT="$TMP_DIR/arialbd.ttf"

mkdir -p "$TMP_DIR" "$FINAL_DIR"
cd "$EP_DIR"

if [ ! -f "$FONT" ]; then
  cp /c/Windows/Fonts/arialbd.ttf "$FONT"
fi

FONT_REL="final/tmp_recut/arialbd.ttf"

WIN_TMP="C:$(echo "$TMP_DIR" | sed 's#^/c##')"
mkdir -p "$TMP_DIR/fontconfig-cache"
cat > "$TMP_DIR/fonts.conf" <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <dir>C:/Windows/Fonts</dir>
  <cachedir>${WIN_TMP}/fontconfig-cache</cachedir>
</fontconfig>
EOF
export FONTCONFIG_FILE="${WIN_TMP}/fonts.conf"

REFRAME="split=2[bg][fg];[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=20[bg2];[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg2];[bg2][fg2]overlay=(W-w)/2:(H-h)/2,fps=30,setsar=1,format=yuv420p"

# ---------------------------------------------------------------------------
# 1. Per-clip trim + freeze-hold (clip4) + blurred-canvas reframe
# ---------------------------------------------------------------------------
# # | Source       | Trim (ss → t)               | Duration | Export window
# 0 | scene_00.mp4 | 2.5 → 0.5                   | 0.5s     | 0.0–0.5  (S0→S1 dissolve start)
# 1 | scene_01.mp4 | 0.0 → 2.7                   | 2.7s     | 0.1–2.8  (S0→S1 dissolve end)
# 2 | scene_02.mp4 | 0.0 → 2.8                   | 2.8s     | 2.8–5.6
# 3 | scene_03.mp4 | 0.0 → 2.3                   | 2.3s     | 5.6–7.9
# 4 | scene_04.mp4 | full 3.0417 + tpad 0.38      | ~3.42s   | 7.9–11.3
# 5 | scene_05.mp4 | 0.3417 → end (final 2.7s)   | 2.7s     | 11.3–14.0 (final 0.2s = loop seam)

echo "[1] Building clips 0-5 (blurred-canvas reframe)..."

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_00.mp4" -ss 2.5 -t 0.5 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip00.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_01.mp4" -ss 0.0 -t 2.7 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip01.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_02.mp4" -ss 0.0 -t 2.8 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip02.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_03.mp4" -ss 0.0 -t 2.3 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip03.mp4"

# Clip 4: freeze-frame hold reduced to 0.38s (was 0.9583s), full live footage used
ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_04.mp4" \
  -vf "tpad=stop_mode=clone:stop_duration=0.38,$REFRAME" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 -t 3.42 "$TMP_DIR/clip04.mp4"

# Clip 5: final 2.7s — preserves the closing frame the loop-seam targets
ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_05.mp4" -ss 0.3417 -t 2.7 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip05.mp4"

# ---------------------------------------------------------------------------
# 2. Scene0→1 cross-dissolve (NEW — fixes gold-card → garden hard cut)
#    xfade duration=0.4s, offset=0.1 (clip00_dur - xfade_dur = 0.5 - 0.4)
#    output: clip_s0s1_seamed.mp4 = 0.5 + 2.7 - 0.4 = 2.8s
# ---------------------------------------------------------------------------

echo "[2] Building Scene0→1 cross-dissolve (0.4s)..."

ffmpeg -y -loglevel error \
  -i "$TMP_DIR/clip00.mp4" \
  -i "$TMP_DIR/clip01.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=0.4:offset=0.1,format=yuv420p" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/clip_s0s1_seamed.mp4"

# ---------------------------------------------------------------------------
# 3. Concatenate: seamed_S0S1 + clips 2–5 (hard cuts) -> ~14.0s
# ---------------------------------------------------------------------------

echo "[3] Concatenating clips (~14.0s total)..."

cat > "$TMP_DIR/concat_list.txt" <<EOF
file 'clip_s0s1_seamed.mp4'
file 'clip02.mp4'
file 'clip03.mp4'
file 'clip04.mp4'
file 'clip05.mp4'
EOF

ffmpeg -y -loglevel error -f concat -safe 0 -i "$TMP_DIR/concat_list.txt" \
  -c copy "$TMP_DIR/assembled_video.mp4"

# ---------------------------------------------------------------------------
# 4. Loop-seam: 0.2s cross-dissolve at tail into clip01's frame-1
#    offset=13.8 (new total ~14.0 − 0.2)
# ---------------------------------------------------------------------------

echo "[4] Building loop-seam cross-dissolve (offset=13.8)..."

ffmpeg -y -loglevel error -i "$TMP_DIR/clip01.mp4" -frames:v 1 "$TMP_DIR/loop_target.png"

ffmpeg -y -loglevel error -loop 1 -i "$TMP_DIR/loop_target.png" -t 0.2 \
  -vf "fps=30,format=yuv420p" \
  -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/loop_target.mp4"

ffmpeg -y -loglevel error \
  -i "$TMP_DIR/assembled_video.mp4" \
  -i "$TMP_DIR/loop_target.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=0.2:offset=13.8,format=yuv420p" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/assembled_video_seamed.mp4"

# ---------------------------------------------------------------------------
# 5. Text overlays (retimed per §4 of recut proposal)
#    Bubu! window extended to 2.8; Tap! ×3 at 2.8/3.7/4.6;
#    breather 5.5–7.9 (text-free); Wow! 7.9–8.4; Arre 8.4–11.5
# ---------------------------------------------------------------------------

echo "[5] Adding text overlays..."

DRAWTEXT_COMMON="fontfile=${FONT_REL}:fontcolor=white:bordercolor=black:borderw=8:x=(w-text_w)/2"

VF_TEXT="drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='BUBU\!':y=h*0.10:enable='between(t,0.0,0.5)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='Bubu\!':y=h*0.10:enable='between(t,0.5,2.8)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=100:text='Tap\!':y=h*0.10:enable='between(t,2.8,3.7)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=120:text='Tap\!':y=h*0.10:enable='between(t,3.7,4.6)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=140:text='Tap\!':y=h*0.10:enable='between(t,4.6,5.5)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=90:text='Wow\!':y=h*0.08:enable='between(t,7.9,8.4)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=95:text='Arre, Bubu\!  ...Pop\!':y=h*0.08:enable='between(t,8.4,11.5)'"

ffmpeg -y -loglevel error -i "$TMP_DIR/assembled_video_seamed.mp4" \
  -vf "$VF_TEXT" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/video_with_text.mp4"

# ---------------------------------------------------------------------------
# 6. Audio mix (§4, 8 layers, retimed + level changes)
#    brand_sting 1.0→0.6; taps at 2800/3700/4600ms; chant_tap at 2800ms;
#    music duck export 5.6–7.9 (audio-stream 5.1–7.4); discovery/wow at 7900ms;
#    pop/chant at 8400ms; alimiter 0.95→0.85; all apad→14.0s
# ---------------------------------------------------------------------------

echo "[6] Building audio mix..."

AFMT="aformat=sample_rates=44100:channel_layouts=stereo"

# 6.1 Brand sting: pulled back from 1.0 to 0.6 (no longer the loudest peak in the mix)
ffmpeg -y -loglevel error -i "$AUDIO_DIR/brand_sting.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.6,apad=whole_dur=14.0" \
  "$TMP_DIR/a1_brand.wav"

# 6.2 Music bed: duck during Anticipation (export 5.6–7.9 = audio-stream 5.1–7.4)
# t in this expression is audio-stream time (export time minus the 500ms delay)
VOL_EXPR="if(lt(t,0.3),0.20*(t/0.3),if(lt(t,5.1),0.20,if(lt(t,5.6),0.20+(0.08-0.20)*((t-5.1)/0.5),if(lt(t,6.9),0.08,if(lt(t,7.4),0.08+(0.20-0.08)*((t-6.9)/0.5),0.20)))))"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/music_bed.mp3" \
  -af "atrim=0:13.5,${AFMT},volume=eval=frame:volume='${VOL_EXPR}',adelay=500:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a2_music.wav"

# 6.3 Build ticks: tap.wav ×3 at 2800/3700/4600ms (0.9s spacing across the 2.8s Build)
ffmpeg -y -loglevel error -i "$AUDIO_DIR/tap.wav" -filter_complex "
  [0:a]${AFMT}[a0];
  [a0]asplit=3[t1][t2][t3];
  [t1]adelay=2800:all=1[d1];
  [t2]adelay=3700:all=1[d2];
  [t3]adelay=4600:all=1[d3];
  [d1][d2][d3]amix=inputs=3:duration=longest:dropout_transition=0:normalize=0,apad=whole_dur=14.0[out]
" -map "[out]" "$TMP_DIR/a3_taps.wav"

# 6.4 Chant "Tap...Tap...Tap": aligned with tap #1 at 2800ms
ffmpeg -y -loglevel error -i "$AUDIO_DIR/chant_tap_pop.wav" \
  -af "atrim=0:1.7,${AFMT},volume=0.5,adelay=2800:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a4_chant_tap.wav"

# 6.5 Wonder Pebble discovery twinkle: moved to Scene4 start (export 7.9)
ffmpeg -y -loglevel error -i "$AUDIO_DIR/wonder_pebble_discovery.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.8,adelay=7900:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a5_discovery.wav"

# 6.6 Wow swell: coincides with discovery at Scene4 start
ffmpeg -y -loglevel error -i "$AUDIO_DIR/wow_swell.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.7,adelay=7900:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a6_swell.wav"

# 6.7 Pop SFX: retimed to 8400ms to land exactly when "Pop!" text appears
ffmpeg -y -loglevel error -i "$AUDIO_DIR/pop.wav" \
  -af "${AFMT},volume=1.3,adelay=8400:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a7_pop.wav"

# 6.8 Chant "Pop!" portion: paired with pop.wav
ffmpeg -y -loglevel error -i "$AUDIO_DIR/chant_tap_pop.wav" \
  -af "atrim=1.7:2.0,${AFMT},volume=0.5,adelay=8400:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a8_chant_pop.wav"

# Combine 8 layers; tighter limiter (0.85) gives the climax clean headroom
ffmpeg -y -loglevel error \
  -i "$TMP_DIR/a1_brand.wav" \
  -i "$TMP_DIR/a2_music.wav" \
  -i "$TMP_DIR/a3_taps.wav" \
  -i "$TMP_DIR/a4_chant_tap.wav" \
  -i "$TMP_DIR/a5_discovery.wav" \
  -i "$TMP_DIR/a6_swell.wav" \
  -i "$TMP_DIR/a7_pop.wav" \
  -i "$TMP_DIR/a8_chant_pop.wav" \
  -filter_complex "amix=inputs=8:duration=longest:dropout_transition=0:normalize=0,alimiter=limit=0.85" \
  -t 14.0 "$TMP_DIR/audio_mix.wav"

# ---------------------------------------------------------------------------
# 7. Final mux
# ---------------------------------------------------------------------------

echo "[7] Muxing final video..."

ffmpeg -y -loglevel error \
  -i "$TMP_DIR/video_with_text.mp4" \
  -i "$TMP_DIR/audio_mix.wav" \
  -map 0:v -map 1:a \
  -c:v libx264 -pix_fmt yuv420p -crf 18 \
  -c:a aac -b:a 192k \
  -shortest \
  "$FINAL_OUT"

echo "[done] Exported: $FINAL_OUT"
ffprobe -v error -show_entries format=duration -show_entries stream=width,height,r_frame_rate,codec_name \
  -of default=noprint_wrappers=0 "$FINAL_OUT"
