#!/usr/bin/env bash
# Episode 02 — "Good Morning, Bubu!" — FINAL ffmpeg assembly pipeline
#
# Implements editing_plan.md Section 12 (Final Assembly Specification):
#   - All 6 source clips (videos/scene_0N.mp4, 1176x784 @ 24fps) are
#     converted to 1080x1920 @ 30fps via a blurred-canvas reframe (sharp
#     ~1080x720 foreground centered over a blurred scale-to-cover background)
#     — no naive scale/distortion.
#   - Clip 4 (Payoff) gets a freeze-frame hold of its final frame
#     (tpad stop_duration=0.958333) to pad its 3.0417s render to the 4.0s
#     trim target — no re-render.
#   - Hard cuts throughout, except a single 0.2s cross-dissolve loop seam
#     at export 12.3-12.5 into a freeze-frame of clip01's opening frame.
#   - 8-layer audio mix per Section 12.3 (brand sting, music bed, build
#     ticks, chant Tap/Pop split, discovery twinkle, wow swell, pop.wav).
#   - Text overlays per Section 9.4.
#
# Output:
#   final/bubu_ep02_good_morning_bubu_final.mp4 (1080x1920, 30fps, H.264+AAC, 12.5s)

set -euo pipefail

EP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$EP_DIR/../.." && pwd)"
VIDEO_DIR="$EP_DIR/videos"
AUDIO_DIR="$PROJECT_ROOT/audio/evergreen"
TMP_DIR="$EP_DIR/final/tmp"
FINAL_DIR="$EP_DIR/final"
FINAL_OUT="$FINAL_DIR/bubu_ep02_good_morning_bubu_final.mp4"
FONT="$TMP_DIR/arialbd.ttf"

mkdir -p "$TMP_DIR" "$FINAL_DIR"
cd "$EP_DIR"

if [ ! -f "$FONT" ]; then
  cp /c/Windows/Fonts/arialbd.ttf "$FONT"
fi

# fontfile= is embedded inside a -vf filter-graph string, where MSYS does not
# rewrite /c/... paths for native exes. Use a path relative to $EP_DIR (cwd)
# instead, which ffmpeg.exe resolves correctly via Win32.
FONT_REL="final/tmp/arialbd.ttf"

# This ffmpeg build is --enable-fontconfig but no fonts.conf exists in this
# environment, which makes drawtext segfault on FcInit(). Provide a minimal
# config (forward slashes avoid escaping issues for both the env var and XML).
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

# ---------------------------------------------------------------------------
# Blurred-canvas reframe chain (Section 9.1): 1176x784 (3:2) -> 1080x1920 (9:16)
#   bg: scale-to-cover (increase) + center-crop to 1080x1920 + heavy blur
#   fg: scale-to-fit (decrease) -> ~1080x720, centered over bg
# ---------------------------------------------------------------------------
REFRAME="split=2[bg][fg];[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=20[bg2];[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg2];[bg2][fg2]overlay=(W-w)/2:(H-h)/2,fps=30,setsar=1,format=yuv420p"

# ---------------------------------------------------------------------------
# 1. Per-clip trim + freeze-hold (clip4) + blurred-canvas reframe
# ---------------------------------------------------------------------------
# Order | Source         | Trim (in -> out)                    | Duration | Export
#   0   | scene_00.mp4   | 2.5 -> 3.0 (calmest Wobble phase)    | 0.5s     | 0.0-0.5
#   1   | scene_01.mp4   | 0.0 -> 2.0                           | 2.0s     | 0.5-2.5
#   2   | scene_02.mp4   | 0.0 -> 4.0                           | 4.0s     | 2.5-6.5
#   3   | scene_03.mp4   | 0.0 -> 1.5                           | 1.5s     | 6.5-8.0
#   4   | scene_04.mp4   | full 3.0417 + tpad hold +0.9583      | 4.0s     | 8.0-12.0
#   5   | scene_05.mp4   | 2.5417 -> 3.0417 (final 0.5s)        | 0.5s     | 12.0-12.5

echo "[1] Building clips 0-5 (blurred-canvas reframe)..."

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_00.mp4" -ss 2.5 -t 0.5 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip00.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_01.mp4" -ss 0.0 -t 2.0 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip01.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_02.mp4" -ss 0.0 -t 4.0 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip02.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_03.mp4" -ss 0.0 -t 1.5 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip03.mp4"

# Clip 4: freeze-frame hold of the final frame (+0.9583s) BEFORE reframing,
# capped at exactly 4.0s output.
ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_04.mp4" \
  -vf "tpad=stop_mode=clone:stop_duration=0.958333,$REFRAME" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 -t 4.0 "$TMP_DIR/clip04.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_05.mp4" -ss 2.5417 -t 0.5 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip05.mp4"

# ---------------------------------------------------------------------------
# 2. Concatenate with hard cuts only (no transitions) -> 12.5s
# ---------------------------------------------------------------------------

echo "[2] Concatenating clips (hard cuts, 12.5s total)..."

cat > "$TMP_DIR/concat_list.txt" <<EOF
file 'clip00.mp4'
file 'clip01.mp4'
file 'clip02.mp4'
file 'clip03.mp4'
file 'clip04.mp4'
file 'clip05.mp4'
EOF

ffmpeg -y -loglevel error -f concat -safe 0 -i "$TMP_DIR/concat_list.txt" \
  -c copy "$TMP_DIR/assembled_video.mp4"

# ---------------------------------------------------------------------------
# 2b. Loop-seam: 0.2s cross-dissolve at the tail (offset=12.3) into a
#     freeze-frame of clip01's opening frame (Scene 1's opening pose).
# ---------------------------------------------------------------------------

echo "[2b] Building loop-seam cross-dissolve..."

ffmpeg -y -loglevel error -i "$TMP_DIR/clip01.mp4" -frames:v 1 "$TMP_DIR/loop_target.png"

ffmpeg -y -loglevel error -loop 1 -i "$TMP_DIR/loop_target.png" -t 0.2 \
  -vf "fps=30,format=yuv420p" \
  -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/loop_target.mp4"

ffmpeg -y -loglevel error \
  -i "$TMP_DIR/assembled_video.mp4" \
  -i "$TMP_DIR/loop_target.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=0.2:offset=12.3,format=yuv420p" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/assembled_video_seamed.mp4"

# ---------------------------------------------------------------------------
# 3. On-screen text overlays (Section 9.4, export-time offsets)
# ---------------------------------------------------------------------------

echo "[3] Adding text overlays..."

DRAWTEXT_COMMON="fontfile=${FONT_REL}:fontcolor=white:bordercolor=black:borderw=8:x=(w-text_w)/2"

VF_TEXT="drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='BUBU\!':y=h*0.10:enable='between(t,0.0,0.5)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='Bubu\!':y=h*0.10:enable='between(t,0.5,2.5)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=100:text='Tap\!':y=h*0.10:enable='between(t,3.5,4.5)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=120:text='Tap\!':y=h*0.10:enable='between(t,4.5,5.5)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=140:text='Tap\!':y=h*0.10:enable='between(t,5.5,6.5)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=90:text='Wow\!':y=h*0.08:enable='between(t,7.6,8.1)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=95:text='Arre, Bubu\!  ...Pop\!':y=h*0.08:enable='between(t,8.1,12.0)'"

ffmpeg -y -loglevel error -i "$TMP_DIR/assembled_video_seamed.mp4" \
  -vf "$VF_TEXT" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/video_with_text.mp4"

# ---------------------------------------------------------------------------
# 4. Audio mix (Section 12.3, 8 layers, export-time offsets)
#    1. brand_sting.wav   atrim 0:0.5            export 0.0     full
#    2. music_bed.mp3     atrim 0:12, shaped     export 0.5     0.08-0.20
#    3. tap.wav x3                               export 3.5/4.5/5.5  full
#    4. chant_tap_pop     atrim 0:1.7            export 3.5     soft (0.5)
#    5. wonder_pebble_discovery atrim 0:0.5      export 7.6     0.8
#    6. wow_swell         atrim 0:0.5            export 7.6     0.7
#    7. pop.wav                                  export 8.25    boosted 1.3
#    8. chant_tap_pop     atrim 1.7:2.0          export 8.25    soft (0.5)
# ---------------------------------------------------------------------------

echo "[4] Building audio mix..."

AFMT="aformat=sample_rates=44100:channel_layouts=stereo"

# 4.1 Brand sting chime, export 0.0-0.5, full level
ffmpeg -y -loglevel error -i "$AUDIO_DIR/brand_sting.wav" \
  -af "atrim=0:0.5,${AFMT},volume=1.0,apad=whole_dur=12.5" \
  "$TMP_DIR/a1_brand.wav"

# 4.2 Music bed: trim to 12s (body clock), piecewise volume, shift +0.5s
VOL_EXPR="if(lt(t,0.3),0.20*(t/0.3),if(lt(t,6.0),0.20,if(lt(t,7.1),0.20+(0.08-0.20)*(t-6.0)/1.1,if(lt(t,7.6),0.08,if(lt(t,11.5),0.08+(0.20-0.08)*(t-7.6)/3.9,0.20)))))"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/music_bed.mp3" \
  -af "atrim=0:12,${AFMT},volume=eval=frame:volume='${VOL_EXPR}',adelay=500:all=1,apad=whole_dur=12.5" \
  "$TMP_DIR/a2_music.wav"

# 4.3 Build ticks: tap.wav x3 at export 3.5/4.5/5.5, full level
ffmpeg -y -loglevel error -i "$AUDIO_DIR/tap.wav" -filter_complex "
  [0:a]${AFMT}[a0];
  [a0]asplit=3[t1][t2][t3];
  [t1]adelay=3500:all=1[d1];
  [t2]adelay=4500:all=1[d2];
  [t3]adelay=5500:all=1[d3];
  [d1][d2][d3]amix=inputs=3:duration=longest:dropout_transition=0:normalize=0,apad=whole_dur=12.5[out]
" -map "[out]" "$TMP_DIR/a3_taps.wav"

# 4.4 Chant "Tap...Tap...Tap" portion, woven into music bed, soft, export 3.5
ffmpeg -y -loglevel error -i "$AUDIO_DIR/chant_tap_pop.wav" \
  -af "atrim=0:1.7,${AFMT},volume=0.5,adelay=3500:all=1,apad=whole_dur=12.5" \
  "$TMP_DIR/a4_chant_tap.wav"

# 4.5 Wonder Pebble discovery twinkle, woven into music bed, export 7.6
ffmpeg -y -loglevel error -i "$AUDIO_DIR/wonder_pebble_discovery.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.8,adelay=7600:all=1,apad=whole_dur=12.5" \
  "$TMP_DIR/a5_discovery.wav"

# 4.6 Wow swell, woven into music bed, export 7.6
ffmpeg -y -loglevel error -i "$AUDIO_DIR/wow_swell.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.7,adelay=7600:all=1,apad=whole_dur=12.5" \
  "$TMP_DIR/a6_swell.wav"

# 4.7 Payoff SFX: pop.wav, boosted 1.3x, export 8.25 - the loudest element
ffmpeg -y -loglevel error -i "$AUDIO_DIR/pop.wav" \
  -af "${AFMT},volume=1.3,adelay=8250:all=1,apad=whole_dur=12.5" \
  "$TMP_DIR/a7_pop.wav"

# 4.8 Chant reserved "Pop!" portion, woven into music bed, export 8.25
ffmpeg -y -loglevel error -i "$AUDIO_DIR/chant_tap_pop.wav" \
  -af "atrim=1.7:2.0,${AFMT},volume=0.5,adelay=8250:all=1,apad=whole_dur=12.5" \
  "$TMP_DIR/a8_chant_pop.wav"

# Combine all 8 layers, then limit to avoid clipping
ffmpeg -y -loglevel error \
  -i "$TMP_DIR/a1_brand.wav" \
  -i "$TMP_DIR/a2_music.wav" \
  -i "$TMP_DIR/a3_taps.wav" \
  -i "$TMP_DIR/a4_chant_tap.wav" \
  -i "$TMP_DIR/a5_discovery.wav" \
  -i "$TMP_DIR/a6_swell.wav" \
  -i "$TMP_DIR/a7_pop.wav" \
  -i "$TMP_DIR/a8_chant_pop.wav" \
  -filter_complex "amix=inputs=8:duration=longest:dropout_transition=0:normalize=0,alimiter=limit=0.95" \
  -t 12.5 "$TMP_DIR/audio_mix.wav"

# ---------------------------------------------------------------------------
# 5. Final mux: video + text overlays + audio mix -> final export
# ---------------------------------------------------------------------------

echo "[5] Muxing final video..."

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
