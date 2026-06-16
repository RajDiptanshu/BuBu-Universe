#!/usr/bin/env bash
# Episode 02 — "Good Morning, Bubu!" — PUBLISH CANDIDATE assembly
#
# Delta from assemble_episode02_recut.sh (two changes only):
#   1. Scene 05 trim: ss=0.3417 → ss=1.8  (skips peak-celebration frames;
#      enters source clip after energy has visibly started settling)
#   2. Loop-seam dissolve: duration=0.2:offset=13.8 → duration=0.4:offset=12.16
#      (longer dissolve softens the warm-golden→dark-green palette gap at seam)
#
# Timeline result:
#   clip_s0s1_seamed  2.8s
#   clip02            2.8s
#   clip03            2.3s
#   clip04            3.42s  (3.0417 live + 0.38 freeze)
#   clip05            1.24s  (ss=1.8 → 3.0417-1.8=1.2417, capped at 1.24)
#   Total before xfade        12.56s
#   Loop-seam xfade (-0.4)    → 12.56s final duration
#
# Output: final/bubu_ep02_good_morning_bubu_publish_candidate.mp4

set -euo pipefail

EP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$EP_DIR/../.." && pwd)"
VIDEO_DIR="$EP_DIR/videos"
AUDIO_DIR="$PROJECT_ROOT/audio/evergreen"
TMP_DIR="$EP_DIR/final/tmp_publish"
FINAL_DIR="$EP_DIR/final"
FINAL_OUT="$FINAL_DIR/bubu_ep02_good_morning_bubu_publish_candidate.mp4"
FONT="$TMP_DIR/arialbd.ttf"

mkdir -p "$TMP_DIR" "$FINAL_DIR"
cd "$EP_DIR"

if [ ! -f "$FONT" ]; then
  cp /c/Windows/Fonts/arialbd.ttf "$FONT"
fi

FONT_REL="final/tmp_publish/arialbd.ttf"

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
# 1. Per-clip trim + reframe  (clips 00-04 unchanged from recut)
# ---------------------------------------------------------------------------

echo "[1] Building clips 0-5..."

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_00.mp4" -ss 2.5 -t 0.5 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip00.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_01.mp4" -ss 0.0 -t 2.7 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip01.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_02.mp4" -ss 0.0 -t 2.8 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip02.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_03.mp4" -ss 0.0 -t 2.3 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip03.mp4"

ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_04.mp4" \
  -vf "tpad=stop_mode=clone:stop_duration=0.38,$REFRAME" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 -t 3.42 "$TMP_DIR/clip04.mp4"

# CHANGE 1: Scene 05 enters at ss=1.8 — past the peak-celebration frames.
# At ss=1.8 the source shows Bubu with eyes beginning to close, arms settling,
# and rays visibly softer than Scene 04's flood. Reads as calm warm afterglow.
ffmpeg -y -loglevel error -i "$VIDEO_DIR/scene_05.mp4" -ss 1.8 -t 1.24 \
  -vf "$REFRAME" -an -c:v libx264 -pix_fmt yuv420p -crf 18 "$TMP_DIR/clip05.mp4"

# ---------------------------------------------------------------------------
# 2. Scene0→1 cross-dissolve  (unchanged: 0.4s, offset=0.1)
# ---------------------------------------------------------------------------

echo "[2] Building Scene0→1 cross-dissolve..."

ffmpeg -y -loglevel error \
  -i "$TMP_DIR/clip00.mp4" \
  -i "$TMP_DIR/clip01.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=0.4:offset=0.1,format=yuv420p" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/clip_s0s1_seamed.mp4"

# ---------------------------------------------------------------------------
# 3. Concatenate  (12.56s total)
# ---------------------------------------------------------------------------

echo "[3] Concatenating clips (12.56s total)..."

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
# 4. Loop-seam  (CHANGE 2: duration=0.4, offset=12.16)
#    Offset = 12.56 - 0.4 = 12.16; output = 12.16 + 0.4 = 12.56s
# ---------------------------------------------------------------------------

echo "[4] Building loop-seam cross-dissolve (0.4s, offset=12.16)..."

ffmpeg -y -loglevel error -i "$TMP_DIR/clip01.mp4" -frames:v 1 "$TMP_DIR/loop_target.png"

ffmpeg -y -loglevel error -loop 1 -i "$TMP_DIR/loop_target.png" -t 0.4 \
  -vf "fps=30,format=yuv420p" \
  -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/loop_target.mp4"

ffmpeg -y -loglevel error \
  -i "$TMP_DIR/assembled_video.mp4" \
  -i "$TMP_DIR/loop_target.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=0.4:offset=12.16,format=yuv420p" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/assembled_video_seamed.mp4"

# ---------------------------------------------------------------------------
# 5. Text overlays  (unchanged from recut)
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
# 6. Audio mix  (unchanged from recut — -shortest trims to 12.56s)
# ---------------------------------------------------------------------------

echo "[6] Building audio mix..."

AFMT="aformat=sample_rates=44100:channel_layouts=stereo"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/brand_sting.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.6,apad=whole_dur=14.0" \
  "$TMP_DIR/a1_brand.wav"

VOL_EXPR="if(lt(t,0.3),0.20*(t/0.3),if(lt(t,5.1),0.20,if(lt(t,5.6),0.20+(0.08-0.20)*((t-5.1)/0.5),if(lt(t,6.9),0.08,if(lt(t,7.4),0.08+(0.20-0.08)*((t-6.9)/0.5),0.20)))))"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/music_bed.mp3" \
  -af "atrim=0:13.5,${AFMT},volume=eval=frame:volume='${VOL_EXPR}',adelay=500:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a2_music.wav"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/tap.wav" -filter_complex "
  [0:a]${AFMT}[a0];
  [a0]asplit=3[t1][t2][t3];
  [t1]adelay=2800:all=1[d1];
  [t2]adelay=3700:all=1[d2];
  [t3]adelay=4600:all=1[d3];
  [d1][d2][d3]amix=inputs=3:duration=longest:dropout_transition=0:normalize=0,apad=whole_dur=14.0[out]
" -map "[out]" "$TMP_DIR/a3_taps.wav"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/chant_tap_pop.wav" \
  -af "atrim=0:1.7,${AFMT},volume=0.5,adelay=2800:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a4_chant_tap.wav"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/wonder_pebble_discovery.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.8,adelay=7900:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a5_discovery.wav"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/wow_swell.wav" \
  -af "atrim=0:0.5,${AFMT},volume=0.7,adelay=7900:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a6_swell.wav"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/pop.wav" \
  -af "${AFMT},volume=1.3,adelay=8400:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a7_pop.wav"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/chant_tap_pop.wav" \
  -af "atrim=1.7:2.0,${AFMT},volume=0.5,adelay=8400:all=1,apad=whole_dur=14.0" \
  "$TMP_DIR/a8_chant_pop.wav"

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
# 7. Final mux  (-shortest trims audio to video length ~12.56s)
# ---------------------------------------------------------------------------

echo "[7] Muxing publish candidate..."

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
