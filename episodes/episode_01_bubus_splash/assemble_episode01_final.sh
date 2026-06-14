#!/usr/bin/env bash
# Episode 01 — "Bubu's Splash" — FINAL ffmpeg assembly pipeline
#
# Builds on assemble_episode01.sh (v2) with three targeted fixes from the
# producer review of v1/v2:
#
#  1. AUDIO — same v2 baseline (real music_bed/tap/splash assets, ducking),
#     just retimed to match the new beat lengths below.
#
#  2. BUILD / ANTICIPATION HOLD — Scene_02 (Build, 0:02-0:06) already has
#     continuous ripple + expression motion every ~0.5s, so it's kept as-is.
#     The flat "static hold" the review actually reacted to is the frozen
#     Anticipation pose (Scene_03), so that beat is trimmed 2.0s -> 1.5s.
#     The 3 "Tap!" text pulses (0:03/0:04/0:05, matching tap.wav) now step
#     up in size (100 -> 120 -> 140) so each of the 3 taps reads as a
#     distinct, escalating beat on top of Scene_02's existing motion.
#     The 0.5s freed from Anticipation is given to the Loop beat.
#
#  3. LOOP SEAM — Loop beat extended 1.0s -> 1.5s (Scene_05 1.5->3.0,
#     ending on a calmer frame closer to Scene_01's opening pose), PLUS a
#     0.2s cross-dissolve at the very end of the file into a freeze-frame
#     of Scene_01's opening frame, so the Scene5->Scene1 autoloop seam
#     blends instead of popping.
#
# Output:
#   final/bubu_ep01_waterplay_splash_final.mp4 (1080x1920, 30fps, H.264+AAC, 12.0s)

set -euo pipefail

EP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIDEO_DIR="$EP_DIR/video"
AUDIO_DIR="$EP_DIR/audio"
TMP_DIR="$EP_DIR/final/tmp"
FINAL_DIR="$EP_DIR/final"
FINAL_OUT="$FINAL_DIR/bubu_ep01_waterplay_splash_final.mp4"

FONT="final/tmp/arialbd.ttf"

mkdir -p "$AUDIO_DIR" "$TMP_DIR" "$FINAL_DIR"
cd "$EP_DIR"

if [ ! -f "$FONT" ]; then
  cp /c/Windows/Fonts/arialbd.ttf "$FONT"
fi

# ---------------------------------------------------------------------------
# 1. Trim + normalize each clip to 1080x1920 @ 30fps, silent
# ---------------------------------------------------------------------------
# Order | Source        | Trim (in -> out) | Duration | Timeline
#   1   | Scene_01.mp4  | 1.0 -> 3.0        | 2.0s     | 0:00.0-0:02.0
#   2   | Scene_02.mp4  | 0.0 -> 4.0        | 4.0s     | 0:02.0-0:06.0
#   3   | Scene_03.mp4  | 0.0 -> 1.5        | 1.5s     | 0:06.0-0:07.5  (was 2.0s)
#   4   | Scene_04.mp4  | 0.0 -> 3.0        | 3.0s     | 0:07.5-0:10.5
#   5   | Scene_05.mp4  | 1.5 -> 3.0        | 1.5s     | 0:10.5-0:12.0  (was 1.0s)

echo "[1] Trimming and normalizing clips..."

trim_clip() {
  local src="$1" start="$2" dur="$3" out="$4"
  ffmpeg -y -loglevel error -i "$src" -ss "$start" -t "$dur" \
    -vf "scale=1080:1920:flags=lanczos,fps=30,setsar=1" \
    -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
    "$TMP_DIR/$out"
}

trim_clip "$VIDEO_DIR/Scene_01.mp4" 1.0 2.0 clip01.mp4
trim_clip "$VIDEO_DIR/Scene_02.mp4" 0.0 4.0 clip02.mp4
trim_clip "$VIDEO_DIR/Scene_03.mp4" 0.0 1.5 clip03.mp4
trim_clip "$VIDEO_DIR/Scene_04.mp4" 0.0 3.0 clip04.mp4
trim_clip "$VIDEO_DIR/Scene_05.mp4" 1.5 1.5 clip05.mp4

# ---------------------------------------------------------------------------
# 2. Concatenate with hard cuts only (no transitions)
# ---------------------------------------------------------------------------

echo "[2] Concatenating clips (hard cuts, 12.0s total)..."

cat > "$TMP_DIR/concat_list.txt" <<EOF
file 'clip01.mp4'
file 'clip02.mp4'
file 'clip03.mp4'
file 'clip04.mp4'
file 'clip05.mp4'
EOF

ffmpeg -y -loglevel error -f concat -safe 0 -i "$TMP_DIR/concat_list.txt" \
  -c copy "$TMP_DIR/assembled_video.mp4"

# ---------------------------------------------------------------------------
# 2b. Loop-seam fix: 0.2s cross-dissolve at the tail of the file into a
#     freeze-frame of clip01's opening frame (Scene_01 source t=1.0,
#     the loop's "home" pose/puddle), so the autoloop restart blends
#     instead of popping.
# ---------------------------------------------------------------------------

echo "[2b] Building loop-seam cross-dissolve..."

ffmpeg -y -loglevel error -i "$TMP_DIR/clip01.mp4" -frames:v 1 "$TMP_DIR/loop_target.png"

ffmpeg -y -loglevel error -loop 1 -i "$TMP_DIR/loop_target.png" -t 0.2 \
  -vf "scale=1080:1920:flags=lanczos,fps=30,setsar=1,format=yuv420p" \
  -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/loop_target.mp4"

# Cross-dissolve the last 0.2s (11.8s-12.0s) of assembled_video into
# loop_target -> output stays exactly 12.0s.
ffmpeg -y -loglevel error \
  -i "$TMP_DIR/assembled_video.mp4" \
  -i "$TMP_DIR/loop_target.mp4" \
  -filter_complex "[0:v][1:v]xfade=transition=fade:duration=0.2:offset=11.8,format=yuv420p" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/assembled_video_seamed.mp4"

# ---------------------------------------------------------------------------
# 3. On-screen text overlays (retimed for the new beat lengths)
#    "Bubu!"   0:00.0-0:02.0
#    "Tap!"    0:03.0-0:04.0  (pulse 1, fontsize 100 - synced to tap #1)
#    "Tap!"    0:04.0-0:05.0  (pulse 2, fontsize 120 - synced to tap #2)
#    "Tap!"    0:05.0-0:06.0  (pulse 3, fontsize 140 - synced to tap #3)
#    "Splash!" 0:07.5-0:10.5  (largest text element, synced to splash SFX)
# ---------------------------------------------------------------------------

echo "[3] Adding text overlays..."

DRAWTEXT_COMMON="fontfile=${FONT}:fontcolor=white:bordercolor=black:borderw=8:x=(w-text_w)/2"

VF_TEXT="drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='Bubu!':y=h*0.10:enable='between(t,0.0,2.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=100:text='Tap!':y=h*0.10:enable='between(t,3.0,4.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=120:text='Tap!':y=h*0.10:enable='between(t,4.0,5.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=140:text='Tap!':y=h*0.10:enable='between(t,5.0,6.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=150:text='Splash\!':y=h*0.08:enable='between(t,7.5,10.5)'"

ffmpeg -y -loglevel error -i "$TMP_DIR/assembled_video_seamed.mp4" \
  -vf "$VF_TEXT" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/video_with_text.mp4"

# ---------------------------------------------------------------------------
# 4. Audio mix (v2 baseline, retimed for the new beat lengths)
#    - music_bed: trimmed to 12s, ~20% level, ducks to ~8% across 0:06-0:07.5
#      (Anticipation hold + Splash impact), recovers to 20% across
#      0:07.5-0:12.0 (Payoff + extended Loop), landing back at 20% for the
#      seamless restart.
#    - 3 percussion ticks at 0:03 / 0:04 / 0:05 (Build-beat taps).
#    - 1 splash SFX at 0:07.5 (the episode's single SFX), now using the
#      asset's full natural 4.5s (0:07.5-0:12.0 is exactly 4.5s) - no
#      trimming needed - boosted as the loudest moment.
# ---------------------------------------------------------------------------

echo "[4] Building audio mix..."

# 4a. Music bed: trim to 12s, base level ~20%, duck to ~8% across 0:06-0:07.5,
#     recover to 20% by 0:12 (loop resolve)
VOL_EXPR="if(lt(t,6.0),0.20,if(lt(t,6.5),0.20+(0.08-0.20)*(t-6.0)/0.5,if(lt(t,7.5),0.08,if(lt(t,12.0),0.08+(0.20-0.08)*(t-7.5)/4.5,0.20))))"

ffmpeg -y -loglevel error -i "$AUDIO_DIR/music_bed.mp3" -t 12 \
  -af "volume=eval=frame:volume='${VOL_EXPR}'" \
  "$TMP_DIR/music_processed.wav"

# 4b. Three percussion ticks at 0:03 / 0:04 / 0:05, padded to 12s
ffmpeg -y -loglevel error -i "$AUDIO_DIR/tap.wav" -filter_complex "
  [0:a]asplit=3[a1][a2][a3];
  [a1]adelay=3000|3000[d1];
  [a2]adelay=4000|4000[d2];
  [a3]adelay=5000|5000[d3];
  [d1][d2][d3]amix=inputs=3:duration=longest:dropout_transition=0:normalize=0[mixed];
  [mixed]apad=whole_dur=12[out]
" -map "[out]" "$TMP_DIR/taps.wav"

# 4c. Single splash SFX at 0:07.5 - full natural 4.5s fills exactly to 0:12.0,
#     boost as the loudest moment
ffmpeg -y -loglevel error -i "$AUDIO_DIR/splash.wav" -t 4.5 \
  -af "volume=1.3,adelay=7500|7500,apad=whole_dur=12" \
  "$TMP_DIR/splash_track.wav"

# 4d. Mix music + ticks + splash into one track (no auto-normalize), then
#     limit to avoid clipping
ffmpeg -y -loglevel error \
  -i "$TMP_DIR/music_processed.wav" \
  -i "$TMP_DIR/taps.wav" \
  -i "$TMP_DIR/splash_track.wav" \
  -filter_complex "amix=inputs=3:duration=longest:dropout_transition=0:normalize=0,alimiter=limit=0.95" \
  -t 12 "$TMP_DIR/audio_mix.wav"

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
