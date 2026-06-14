#!/usr/bin/env bash
# Episode 01 — "Bubu's Splash" — ffmpeg assembly pipeline
# Implements editing_plan.md sections 1, 3, 4, 5, 7 against the 5 generated
# clips in video/Scene_01.mp4 - Scene_05.mp4.
#
# Usage:
#   bash assemble_episode01.sh
#
# Audio inputs (placeholders generated automatically on first run if missing):
#   audio/music_bed.mp3  - background music bed, trimmed to 12s, ~20% level,
#                          ducks to ~8% across 0:06-0:09 (anticipation + splash)
#   audio/tap.wav        - percussion "tick" one-shot, used x3 at 0:03/0:04/0:05
#   audio/splash.wav     - the episode's single SFX, trimmed to 4.0s, played at
#                          0:08.0, boosted as the loudest moment
#   audio/pop.wav        - not used in Episode 01 (reserved for future episodes:
#                          bubble/balloon/magic-surprise payoffs)
#
# Replace files in audio/ with real assets (same filenames) and re-run this
# script at any time — nothing else needs to change.
#
# Output:
#   final/bubu_ep01_waterplay_splash_v2.mp4  (1080x1920, 30fps, H.264 + AAC, 12.0s)

set -euo pipefail

EP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIDEO_DIR="$EP_DIR/video"
AUDIO_DIR="$EP_DIR/audio"
TMP_DIR="$EP_DIR/final/tmp"
FINAL_DIR="$EP_DIR/final"
FINAL_OUT="$FINAL_DIR/bubu_ep01_waterplay_splash_v2.mp4"

FONT="final/tmp/arialbd.ttf"

mkdir -p "$AUDIO_DIR" "$TMP_DIR" "$FINAL_DIR"
cd "$EP_DIR"

# Copy a bold font locally (relative path) to avoid drive-letter ':' escaping
# issues with ffmpeg's drawtext filter on Windows.
if [ ! -f "$FONT" ]; then
  cp /c/Windows/Fonts/arialbd.ttf "$FONT"
fi

# ---------------------------------------------------------------------------
# 0. Placeholder audio (skipped if real files are already in place)
# ---------------------------------------------------------------------------

if [ ! -f "$AUDIO_DIR/music_bed.mp3" ]; then
  echo "[0] Generating placeholder music_bed.mp3 (12s soft two-tone pad)..."
  ffmpeg -y -loglevel error \
    -f lavfi -i "sine=frequency=261.63:duration=12" \
    -f lavfi -i "sine=frequency=329.63:duration=12" \
    -filter_complex "[0:a][1:a]amix=inputs=2:duration=longest,volume=0.25" \
    -c:a libmp3lame -b:a 128k "$AUDIO_DIR/music_bed.mp3"
fi

if [ ! -f "$AUDIO_DIR/tap.wav" ]; then
  echo "[0] Generating placeholder tap.wav (short percussion tick)..."
  ffmpeg -y -loglevel error \
    -f lavfi -i "sine=frequency=1200:duration=0.15" \
    -af "afade=t=out:st=0.05:d=0.1,volume=0.6" \
    -c:a pcm_s16le "$AUDIO_DIR/tap.wav"
fi

if [ ! -f "$AUDIO_DIR/splash.wav" ]; then
  echo "[0] Generating placeholder splash.wav (bright short splash)..."
  ffmpeg -y -loglevel error \
    -f lavfi -i "sine=frequency=1800:duration=0.4" \
    -af "afade=t=out:st=0.05:d=0.35,volume=0.8" \
    -c:a pcm_s16le "$AUDIO_DIR/splash.wav"
fi

# ---------------------------------------------------------------------------
# 1. Trim + normalize each clip to 1080x1920 @ 30fps, silent
#    (editing_plan.md / capcut_editing_guide.md Section 1)
# ---------------------------------------------------------------------------
# Order | Source        | Trim (in -> out) | Duration | Timeline
#   1   | Scene_01.mp4  | 1.0 -> 3.0        | 2s       | 0:00-0:02
#   2   | Scene_02.mp4  | 0.0 -> 4.0        | 4s       | 0:02-0:06
#   3   | Scene_03.mp4  | 0.0 -> 2.0        | 2s       | 0:06-0:08
#   4   | Scene_04.mp4  | 0.0 -> 3.0        | 3s       | 0:08-0:11
#   5   | Scene_05.mp4  | 2.0 -> 3.0        | 1s       | 0:11-0:12

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
trim_clip "$VIDEO_DIR/Scene_03.mp4" 0.0 2.0 clip03.mp4
trim_clip "$VIDEO_DIR/Scene_04.mp4" 0.0 3.0 clip04.mp4
trim_clip "$VIDEO_DIR/Scene_05.mp4" 2.0 1.0 clip05.mp4

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
# 3. On-screen text overlays (editing_plan.md Section 5, re-synced to the
#    v2 tap timing at 0:03/0:04/0:05 from Section 4)
#    "Bubu!"   0:00.0-0:02.0
#    "Tap!"    0:03.0-0:04.0  (pulse 1, synced to tap #1)
#    "Tap!"    0:04.0-0:05.0  (pulse 2, synced to tap #2)
#    "Tap!"    0:05.0-0:06.0  (pulse 3, synced to tap #3)
#    "Splash!" 0:08.0-0:11.0  (largest text element)
# ---------------------------------------------------------------------------

echo "[3] Adding text overlays..."

DRAWTEXT_COMMON="fontfile=${FONT}:fontcolor=white:bordercolor=black:borderw=8:x=(w-text_w)/2"

VF_TEXT="drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='Bubu!':y=h*0.10:enable='between(t,0.0,2.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='Tap!':y=h*0.10:enable='between(t,3.0,4.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='Tap!':y=h*0.10:enable='between(t,4.0,5.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=110:text='Tap!':y=h*0.10:enable='between(t,5.0,6.0)'"
VF_TEXT="${VF_TEXT},drawtext=${DRAWTEXT_COMMON}:fontsize=150:text='Splash\!':y=h*0.08:enable='between(t,8.0,11.0)'"

ffmpeg -y -loglevel error -i "$TMP_DIR/assembled_video.mp4" \
  -vf "$VF_TEXT" \
  -an -c:v libx264 -pix_fmt yuv420p -crf 18 \
  "$TMP_DIR/video_with_text.mp4"

# ---------------------------------------------------------------------------
# 4. Audio mix (v2 — real assets + audio ducking)
#    - music_bed: trimmed to 12s, held at ~20% background level, with a
#      dip/duck under the Anticipation + Splash beats (0:06-0:09) so the
#      splash lands with impact, then recovers to 20% by 0:12 for the loop.
#    - 3 percussion ticks at 0:03 / 0:04 / 0:05 (Build-beat taps), at full
#      level — louder than the music bed.
#    - 1 splash SFX at 0:08.0 (the episode's single SFX), trimmed to 4.0s
#      (its natural 4.5s would run past the 12s timeline) and boosted —
#      the loudest moment in the mix.
# ---------------------------------------------------------------------------

echo "[4] Building audio mix..."

# 4a. Music bed: trim to 12s, base level ~20%, duck to ~8% across 0:06-0:09
#     (anticipation dip + splash impact), recover to 20% by 0:12 (loop resolve)
VOL_EXPR="if(lt(t,6.0),0.20,if(lt(t,6.5),0.20+(0.08-0.20)*(t-6.0)/0.5,if(lt(t,9.0),0.08,if(lt(t,12.0),0.08+(0.20-0.08)*(t-9.0)/3.0,0.20))))"

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

# 4c. Single splash SFX at 0:08.0 — trim its natural 4.5s down to 4.0s so it
#     fits the remaining timeline (0:08-0:12), boost it as the loudest moment
ffmpeg -y -loglevel error -i "$AUDIO_DIR/splash.wav" -t 4.0 \
  -af "volume=1.3,adelay=8000|8000,apad=whole_dur=12" \
  "$TMP_DIR/splash_track.wav"

# 4d. Mix music + ticks + splash into one track (no auto-normalize, since each
#     layer's level was already set deliberately above), then limit to avoid clipping
ffmpeg -y -loglevel error \
  -i "$TMP_DIR/music_processed.wav" \
  -i "$TMP_DIR/taps.wav" \
  -i "$TMP_DIR/splash_track.wav" \
  -filter_complex "amix=inputs=3:duration=longest:dropout_transition=0:normalize=0,alimiter=limit=0.95" \
  -t 12 "$TMP_DIR/audio_mix.wav"

# ---------------------------------------------------------------------------
# 5. Final mux: video + text overlays + audio mix -> final export
#    (export spec: 9:16, 1080x1920, H.264, 30fps, 12.0s)
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
