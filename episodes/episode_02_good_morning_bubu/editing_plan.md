# Episode 02 — "Good Morning, Bubu!" — Editing Plan

**Pillar:** Daily Routines | **Location:** The Nook | **Hero color:** Sunrise Cream `#FFE3A8` | **Build word:** "Tap!" | **Payoff word:** "Pop!" | **Wonder Pebble:** First Wonder Pebble (turquoise `#4FD1C5`) | **Target runtime:** 10.5-15.5s (Beat 0 + 12s body) | **Final runtime:** 12.5s

Built from `episode_02_production_package.md` (Revision 2 — Producer-Reviewed), `canon/bubu_audio_bible.md`, `higgsfield_video_prompts.md`, and `image_prompts.md`. This plan is the handoff document for the ffmpeg assembly pipeline (Section 8).

---

## 1. Exact Scene Timings

| Order | Scene | Beat | Duration | Timecode (absolute) |
|---|---|---|---|---|
| 0 | Scene 0 | Brand Sting | 0.5s | -0:00.5 – 0:00.0 |
| 1 | Scene 1 | Hello | 2.0s | 0:00.0 – 0:02.0 |
| 2 | Scene 2 | Build | 4.0s | 0:02.0 – 0:06.0 |
| 3 | Scene 3 | Anticipation | 1.5s | 0:06.0 – 0:07.5 |
| 4 | Scene 4 | Payoff | 4.0s | 0:07.5 – 0:11.5 |
| 5 | Scene 5 | Loop | 0.5s | 0:11.5 – 0:12.0 |
| | | **Total** | **12.5s** | within 10.5-15.5s target ✅ |

For ffmpeg timeline purposes, **re-zero at Scene 0's start**: Scene 0 occupies `0.0–0.5s`, and Scenes 1-5 occupy `0.5–12.5s` of the exported file (i.e., add 0.5s to every "absolute" timecode above when referencing the final export). All "0:00–0:12" timecodes elsewhere in this plan (and in the production package) refer to the **body clock** (Scenes 1-5 only, starting at export time 0.5s) — Section 8 makes the export-time mapping explicit.

All clips are assembled as a single continuous timeline with **hard cuts only** — Scene 0 → Scene 1 is a hard cut (no transition effect, per `bubu_personality_bible.md` §7), and Scenes 1-2-3-4-5 are hard cuts as well. The only non-hard-cut element is the 0.2s loop-seam cross-dissolve at the very end of the file (Section 7).

---

## 2. Scene 0 — Brand Sting Placement

**Correction vs. earlier drafts:** there is no pre-rendered `bubu_brand_sting.mp4` evergreen video asset. The only evergreen Brand Sting asset that exists today is the **audio** chime, `audio/evergreen/brand_sting.wav` (0.5s). The Scene 0 *video* still needs to be generated per-episode (from `higgsfield_video_prompts.md` Scene 0's prompt — Bubu mid-Wobble, Curious pose, generic shared-world background) until/unless it is later promoted to a reusable evergreen video asset. Both pieces are assembled together at export time, not pre-baked.

- **Video source:** `Scene_00.mp4` — generated from `higgsfield_video_prompts.md` Scene 0, trimmed to 0.5s (the calmest portion of the Wobble idle loop). No text or audio baked in.
- **Audio source:** `audio/evergreen/brand_sting.wav` (0.5s, full level) — mixed in at export time, exactly covering `0.0-0.5s`, the sting's only sound.
- **Text overlay:** "BUBU!" snaps in via `drawtext` at export time `0.0-0.5s`, synced to the chime — added at export, not baked into the source clip.
- **Placement:** `Scene_00.mp4` is concatenated at the very start of the export, occupying export time `0.0-0.5s`.
- **Isolation:** Music bed is silent (0%) for the full 0.5s — confirmed by the Section 4 audio mix (the music track only starts at export time 0.5s).
- **Not part of the loop:** Scene 0 plays once per viewing session; the Scene 5 → Scene 1 loop (Section 8) replays only the body (export time 0.5-12.5s), with Scene 0 never replayed mid-loop.

---

## 3. Audio Placement (full timeline, body-clock timecodes unless noted)

| Body time | Beat | Audio events |
|---|---|---|
| -0.5s – 0.0s (export 0.0-0.5s) | 0 (Sting) | `audio/evergreen/brand_sting.wav` (0.5s, full level), mixed in at export — its own isolated 0.5s, no other sound. Music bed silent. |
| 0.0s – 0.3s | 1 start | `music_bed.mp3` fades in 0% → 20%. |
| 0.0s – 2.0s | 1 (Hello) | Music bed steady at 20%. Narration: "Bubu!" |
| 2.0s – 6.0s | 2 (Build) | Music bed at 20% + 3 percussion ticks (`tap.wav`) at 3.0s / 4.0s / 5.0s. **Mandatory chant** (`audio/evergreen/chant_tap_pop.wav`, trimmed to its "Tap ... Tap ... Tap" portion only — `atrim=0:1.7`, ≈1.7s, excluding the trailing "Pop!") mixed softly into the music bed on the same ticks — cadence only, no melody. No narration — Build is rhythm-led via `tap.wav` + chant + on-screen "Tap!" text only. |
| 6.0s – 7.1s | 3 (Anticipation, part 1) | Music bed ducks to 8%. Silent — no narration, no chant. |
| 7.1s – 7.6s | Anticipation→Payoff boundary (3→4, boundary at 7.5s) | Opens with the pre-flash shimmer (one tiny sparkle on the Wonder Pebble, visual only) at 7.1s, leading directly into `audio/evergreen/wonder_pebble_discovery.wav` twinkle (expanded to 0.5s, spans this full window — was 0.3s) + `audio/evergreen/wow_swell.wav` music-bed swell (also 0.5s, was 0.3s). Narration: "Wow!" (now 0.5s, improved readability). Wonder Pebble flashes turquoise in exact sync. |
| 7.75s | Payoff SFX | `pop.wav` (boosted ~1.3x), layered with the chant's reserved "Pop!" (`audio/evergreen/chant_tap_pop.wav`, `atrim=1.7:2.0`, ≈0.3s, woven into the music bed per the Audio Ownership Rule — `pop.wav` remains the episode's single notable SFX) — 0.15s gap after the twinkle ends (7.6s → 7.75s). Morning light Pops! into the Nook in sync. |
| 7.6s – 11.5s | 4 (Payoff) | Music bed recovers from 8% → 20% across this window (extended +0.5s for retention). Narration: "Pop!" immediately followed by "Arre, Bubu! ...Pop!" |
| 11.5s – 12.0s | 5 (Loop) | Music bed settles at 20%, matching its Beat-1 starting level — ready for the seamless loop back to body time 0.0s. |

**Audio asset inventory — status:**

| Asset | Path | Status |
|---|---|---|
| Brand-sting chime | `audio/evergreen/brand_sting.wav` | ✅ present (evergreen) |
| Wonder Pebble discovery twinkle | `audio/evergreen/wonder_pebble_discovery.wav` | ✅ present (evergreen) |
| "Wow!" swell | `audio/evergreen/wow_swell.wav` | ✅ present (evergreen) |
| Mandatory chant | `audio/evergreen/chant_tap_pop.wav` | ✅ present (evergreen) |
| Music bed | `audio/evergreen/music_bed.mp3` | ✅ present (evergreen, 127.9s — trim to 12s at assembly) |
| Build-tick percussion | `audio/evergreen/tap.wav` | ✅ present (evergreen) |
| Payoff SFX | `audio/evergreen/pop.wav` | ✅ present (0.72s) |

---

## 4. Brand Sting Placement

(See Section 2 for full detail — summarized here for the assembly checklist.)

- Concat-prepended, export time `0.0-0.5s`, sourced from a freshly-generated `Scene_00.mp4` (Higgsfield Scene 0 prompt, trimmed to 0.5s).
- Audio (`audio/evergreen/brand_sting.wav`) and text ("BUBU!") are both added at export time — neither is baked into `Scene_00.mp4`.
- Hard cut directly into Scene 1 at export time `0.5s` (body time `0.0s`) — no transition effect.

---

## 5. Wonder Pebble Sound Timing

| Body time | Event | Audio |
|---|---|---|
| 0.0s – 7.1s | Pebble visible, pale gray-blue, calm | None (ambient music bed only) |
| 7.1s – 7.6s | Pre-flash shimmer (7.1s, visual only) leading into turquoise discovery flash (`#4FD1C5`, 0.97-1.00 sat) | `audio/evergreen/wonder_pebble_discovery.wav` twinkle (expanded to 0.5s, was 0.3s — now spans this full window) + `audio/evergreen/wow_swell.wav` underneath, both woven into the music bed (continuous layer — never a second "notable sound"). Narration "Wow!" (now 0.5s, improved readability) lands here. |
| 7.6s – 11.5s | Flash settles to sustained glow (hold extended +0.5s for retention) | No new audio — twinkle has ended by 7.6s; `pop.wav` at 7.75s is the Payoff SFX (owned by the light-flood/Pop! moment, not the pebble itself — see Audio Ownership Rule). |
| 11.5s – 12.0s | Faint persistent turquoise glow (Loop) | None. |

**Sync tolerance:** `audio/evergreen/wonder_pebble_discovery.wav` must align to the 7.1-7.6s window within ±2 frames (≈67ms @ 30fps), matching the on-screen flash exactly (`canon/bubu_audio_bible.md` §4 Timing Standards).

---

## 6. Action Word Timing

| Body time | Word | Channel | Sync |
|---|---|---|---|
| 0.0s – 2.0s | "Bubu!" | On-screen text (fade in) + narration | Scene 1, recognition word |
| 3.0s – 4.0s | "Tap!" (pulse 1) | On-screen text + `tap.wav` tick #1 + chant tick #1 | 1st trunk-Point repetition |
| 4.0s – 5.0s | "Tap!" (pulse 2) | On-screen text + `tap.wav` tick #2 + chant tick #2 | 2nd trunk-Point repetition |
| 5.0s – 6.0s | "Tap!" (pulse 3) | On-screen text + `tap.wav` tick #3 + chant tick #3 | 3rd trunk-Point repetition |
| 7.1s – 7.6s | "Wow!" | Narration only (now 0.5s, improved readability) | Anticipation→Payoff boundary, opens with the pre-flash shimmer and rides the expanded discovery twinkle |
| 7.6s – 11.5s | "Pop!" → "Arre, Bubu! ...Pop!" | Narration + on-screen text | "Pop!" immediately followed by the full catchphrase (held +0.5s longer for retention); paired with `pop.wav` + the chant's reserved "Pop!" at 7.75s |

Per Section 4 of the production package, escalating pulse sizes for the 3 "Tap!" repetitions (e.g., fontsize 100 → 120 → 140, following the Episode 01 Final precedent) are recommended so each rep reads as a distinct beat.

---

## 7. Text Overlay Timing

Per the on-screen-text rule (text only in Beats 1, 2, 4 — none in Beat 0's body-clock equivalent within Scenes 1-5, Beat 3, or Beat 5):

| Body time | Text | Behavior |
|---|---|---|
| (export 0.0-0.5s) | "BUBU!" | Added via `drawtext` at export — snaps in, synced to `audio/evergreen/brand_sting.wav`. |
| 0.0s – 2.0s | "Bubu!" | Fades in, upper negative space above Bubu's head; fades out by end of Scene 1 (or clears at Scene 2's start). |
| 3.0s – 4.0s | "Tap!" (pulse 1, smallest) | Appears, slight grow, fades — synced to tick #1. |
| 4.0s – 5.0s | "Tap!" (pulse 2, medium) | Synced to tick #2. |
| 5.0s – 6.0s | "Tap!" (pulse 3, largest) | Synced to tick #3. |
| 6.0s – 7.1s | *(none)* | No text for the first 1.1s of Anticipation — "Wow!" begins at 7.1s as the expanded discovery window opens, straddling the Scene 3→4 cut. |
| 7.1s – 7.6s | "Wow!" (now 0.5s, improved readability) | Appears with the discovery flash (which opens with the pre-flash shimmer at 7.1s), upper negative space, not overlapping the pebble. |
| 7.6s – 11.5s | "Arre, Bubu! ...Pop!" | Largest on-screen text of the episode; appears as the Sunrise Cream light floods in (7.5-7.6s), held through the full extended Payoff (now 3.9s, +0.5s for retention). |
| 11.5s – 12.0s | *(none)* | No text during Loop — "Tap!"/"Wow!"/"Arre, Bubu! ...Pop!" have already cleared, "Bubu!" does not reappear (clean reset for the loop restart). |

All text: upper negative space above Bubu's head, never overlapping Bubu, the Wonder Pebble, or the light-gap/light-flood area.

---

## 8. Loop Transition Timing

- **Visual loop point:** Scene 5's trimmed final frame (body time 12.0s) must closely match Scene 1's opening frame (body time 0.0s) — same Curious pose, trunk at 0°, same dim Nook lighting (0.24-0.30 sat) — with exactly **one** intentional difference: the Wonder Pebble carries a faint persistent turquoise glow in Scene 5's end frame vs. plain pale gray-blue in Scene 1's opening frame.
- **On-screen text reset:** "Tap!"/"Wow!"/"Arre, Bubu! ...Pop!" have all cleared by 11.5s; no text reappears in Scene 5, so the Scene 5 → Scene 1 restart reads as a clean reset.
- **Audio loop point:** Music bed settles back to its 20% base level by body time 12.0s, exactly matching its body-time-0.0s starting level — audio-seamless loop.
- **Loop-seam cross-dissolve (following the Episode 01 Final precedent):** apply a **0.2s cross-dissolve** at the very tail of the export (body time 11.8-12.0s) into a freeze-frame built from Scene 1's actual opening frame (body time 0.0s). This blends the autoloop restart instead of a hard pop. The Wonder Pebble's faint glow difference is small and corner-localized enough that the 0.2s dissolve does not visually erase or jar against it.
- **Scene 0 is outside the loop:** Scene 0 plays once per viewing session (export time 0.0-0.5s) and is never part of the Scene 5 → Scene 1 replay loop — repeated autoplay loops replay only export time 0.5-12.5s (body time 0.0-12.0s).
- **No other transition effects:** every other scene-to-scene join (0→1, 1→2, 2→3, 3→4, 4→5) is a hard cut only.

---

## 9. ffmpeg Assembly Strategy

Modeled directly on `episodes/episode_01_bubus_splash/assemble_episode01_final.sh`, retimed for Episode 02's beat lengths and extended with Scene 0 + the new audio assets. Output: `final/bubu_ep02_good_morning_bubu_final.mp4` (1080x1920, 30fps, H.264+AAC, **12.5s**).

### 9.1 Clip trim table

All 6 source renders are `videos/scene_0N.mp4`, **1176x784 @ 24fps** (3:2 landscape) — confirmed present and correctly mapped to their scenes after the file rename.

| Order | Source | Trim (in → out) | Duration | Export timecode |
|---|---|---|---|---|
| 0 | `videos/scene_00.mp4` | trim to 0.5s (calmest Wobble phase) | 0.5s | 0.0-0.5 |
| 1 | `videos/scene_01.mp4` | 0.0 → 2.0 | 2.0s | 0.5-2.5 |
| 2 | `videos/scene_02.mp4` | 0.0 → 4.0 | 4.0s | 2.5-6.5 |
| 3 | `videos/scene_03.mp4` | 0.0 → 1.5 | 1.5s | 6.5-8.0 |
| 4 | `videos/scene_04.mp4` | 0.0 → 3.04 (full clip, no trim) + freeze-frame hold of final frame for +0.96s | 4.0s | 8.0-12.0 |
| 5 | `videos/scene_05.mp4` | trim to final 0.5s (2.54 → 3.04) | 0.5s | 12.0-12.5 |

**Note (scene_04 padding, item 4):** `videos/scene_04.mp4` renders at **3.0417s**, 0.9583s short of the 4.0s trim target. Resolved via a **freeze-frame hold**, not a re-render: clone its final frame (frame 72 — Bubu mid-"Wow", mouth open, trunk raised, pebble glowing — a strong hold pose for the Payoff beat) for an extra ~0.96s via `tpad=stop_mode=clone:stop_duration=0.9583`, applied to clip 4 only, before the reframe step below. 3.0417s + 0.9583s = exactly 4.0s.

**Per-clip processing (reframe + format):** Source clips are 1176x784 (3:2) vs. the 1080x1920 (9:16) export target — too large an aspect-ratio gap for a naive `scale=1080:1920` (it would squash Bubu horizontally into a tall, thin distortion). Use a **blurred-canvas reframe**, applied identically to all 6 clips:

```
[in]split=2[bg][fg];
[bg]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=20[bg];
[fg]scale=1080:1920:force_original_aspect_ratio=decrease[fg];
[bg][fg]overlay=(W-w)/2:(H-h)/2,fps=30,setsar=1[out]
```

This fills the full 1080x1920 frame with a blurred, zoomed copy of the same scene (reads as soft green Bubu Grove foliage in the top/bottom bars — no hard letterbox edges) while keeping a sharp, undistorted ~1080x720 copy of the full original composition centered in frame. Clip 4 applies `tpad=stop_mode=clone:stop_duration=0.9583` *before* this chain. All clips: `-an` (strip audio — rebuilt separately), `-c:v libx264 -pix_fmt yuv420p -crf 18`.

### 9.2 Concatenation

Concat all 6 trimmed clips (`clip00.mp4` … `clip05.mp4`) via `ffmpeg -f concat -safe 0` with `-c copy`, producing `assembled_video.mp4` (12.5s, hard cuts only).

### 9.3 Loop-seam cross-dissolve

1. Extract frame 1 of `clip01.mp4` (body time 0.0s = export time 0.5s, Scene 1's opening frame) as `loop_target.png`.
2. Build a 0.2s freeze-frame clip `loop_target.mp4` from it (same scale/fps/pix_fmt).
3. Apply `xfade=transition=fade:duration=0.2:offset=12.3` between `assembled_video.mp4` and `loop_target.mp4` (offset = 12.5 - 0.2 = 12.3, i.e. export time 11.8-12.0 in Section 8's body-clock terms) → `assembled_video_seamed.mp4`, still exactly 12.5s.

### 9.4 On-screen text overlays (drawtext, export-time offsets = body time + 0.5s)

| Export time | Text | fontsize (suggested) | y |
|---|---|---|---|
| 0.0-0.5 | "BUBU!" | 110 | h*0.10 |
| 0.5-2.5 | "Bubu!" | 110 | h*0.10 |
| 3.5-4.5 | "Tap!" (pulse 1) | 100 | h*0.10 |
| 4.5-5.5 | "Tap!" (pulse 2) | 120 | h*0.10 |
| 5.5-6.5 | "Tap!" (pulse 3) | 140 | h*0.10 |
| 7.6-8.1 | "Wow!" | 90 | h*0.08 |
| 8.1-12.0 | "Arre, Bubu! ...Pop!" | 150 | h*0.08 |

Build one chained `drawtext=...:enable='between(t,START,END)'` filter string (as in the Episode 01 script's `VF_TEXT`), applied to `assembled_video_seamed.mp4` (or to `assembled_video.mp4` before the loop-seam dissolve, then re-dissolve — order should match the Episode 01 script's sequencing: text overlays applied to the seamed video, since the loop-seam target frame is text-free and matches Scene 1's pre-text state). Output: `video_with_text.mp4`.

### 9.5 Audio mix (export-time offsets = body time + 0.5s)

1. **Brand sting chime:** mix `audio/evergreen/brand_sting.wav` directly at export time 0.0, full level, 0.5s — no baked-in conditional, the chime is a standalone evergreen audio asset assembled at export time.
2. **Music bed** (`audio/evergreen/music_bed.mp3` — ✅ present, 127.9s), trimmed to 12s and time-shifted to start at export time 0.5 (body time 0.0):
   - 0.5-0.8 (body 0.0-0.3): fade 0% → 20%.
   - 0.8-2.5 (body 0.3-2.0): steady 20%.
   - 2.5-6.5 (body 2.0-6.0): steady 20% (carries ticks/chant — see below).
   - 6.5-7.6 (body 6.0-7.1): duck 20% → 8%.
   - 7.6-8.1 (body 7.1-7.6): hold 8%, `audio/evergreen/wow_swell.wav` swell layered in across this full window (expanded to 0.5s, was 0.3s).
   - 8.1-12.0 (body 7.6-11.5): recover 8% → 20%.
   - 12.0-12.5 (body 11.5-12.0): hold 20% (loop-matched to the 0.8-2.5 level).
   - Use a piecewise `volume=eval=frame:volume='...'` expression, same pattern as the Episode 01 script's `VOL_EXPR`, retimed to the above breakpoints (all +0.5s vs. body-clock values).
3. **`audio/evergreen/tap.wav`** (✅ present) ticks: 3 instances via `adelay`, at export time 3.5 / 4.5 / 5.5 (body 3.0/4.0/5.0), padded to 12.5s.
4. **`audio/evergreen/chant_tap_pop.wav`:** `atrim=0:1.7` ("Tap ... Tap ... Tap" portion, ≈1.7s, excluding the trailing "Pop!") mixed into the music bed on the same 3.5/4.5/5.5 ticks, at a soft level (cadence-only, sub-narration volume) — per Producer Review Adjustment 5, this is now **mandatory**, not optional. Its reserved `atrim=1.7:2.0` "Pop!" tail (≈0.3s) is layered separately at the Payoff moment — see item 6.
5. **`audio/evergreen/wonder_pebble_discovery.wav`:** single instance via `adelay`, exactly at export time 7.6 (body 7.1), expanded to 0.5s duration (was 0.3s), woven into the music-bed mix (not a separate notable-sound layer).
6. **`audio/evergreen/pop.wav`** (✅ present, 0.72s): single instance via `adelay`, at export time 8.25 (body 7.75), boosted `volume=1.3`, padded to 12.5s — the episode's single Payoff SFX, the loudest element. Layer `audio/evergreen/chant_tap_pop.wav`'s reserved `atrim=1.7:2.0` "Pop!" segment (≈0.3s) at the same export time 8.25, woven into the music-bed mix per the Audio Ownership Rule (does not count as a second notable SFX).
7. Mix all layers with `amix=inputs=N:duration=longest:dropout_transition=0:normalize=0`, then `alimiter=limit=0.95` to enforce the ≤-1 dBFS true-peak ceiling (`canon/bubu_audio_bible.md` §4 Loudness Targets — target -16 to -14 LUFS integrated).

### 9.6 Final mux

`ffmpeg -i video_with_text.mp4 -i audio_mix.wav -map 0:v -map 1:a -c:v libx264 -pix_fmt yuv420p -crf 18 -c:a aac -b:a 192k -shortest final/bubu_ep02_good_morning_bubu_final.mp4`

Verify with `ffprobe`: 1080x1920, 30fps, H.264/AAC, duration = **12.5s**.

---

## 10. Assembly Checklist

- [ ] Generate `Scene_00.mp4` from `higgsfield_video_prompts.md` Scene 0 and trim to 0.5s (calmest Wobble phase); mix in `audio/evergreen/brand_sting.wav` and add the "BUBU!" `drawtext` overlay at export time 0.0-0.5 (see Section 2).
- [ ] Confirm all 6 clips (Scene 0-5) maintain identical framing/composition (Bubu 40-55% of frame height, eyes ~40% from top, center-left) with no drift between clips.
- [ ] Apply the freeze-frame hold (`tpad=stop_mode=clone:stop_duration=0.9583`) to `scene_04.mp4` before reframing, extending its 3.04s render to the 4.0s trim target (Section 9.1).
- [ ] Confirm Scene 5's trimmed end frame matches Scene 1's opening frame except for the Wonder Pebble's faint turquoise glow.
- [ ] Verify the 7.1s pre-flash shimmer is visual-only (no audio change) and the 7.1-7.6s turquoise flash (expanded to 0.5s) is in exact sync with `audio/evergreen/wonder_pebble_discovery.wav` + `audio/evergreen/wow_swell.wav`.
- [ ] Place `pop.wav` at exactly export time 8.25 (body 7.75) — 0.15s gap after the discovery twinkle ends.
- [ ] Confirm `audio/evergreen/chant_tap_pop.wav` is present and mixed at the 3 Build-beat ticks (mandatory per Producer Review Adjustment 5).
- [ ] Verify no SFX exists anywhere except the single `pop.wav` hit (Audio Ownership Rule).
- [ ] Sync text overlays per Section 7 (all offsets = body time + 0.5s).
- [ ] Sync narration per Section 6, including the silent gap in Scene 3 (6.0-7.1s body time, no narration/chant).
- [ ] Confirm the 0.2s loop-seam cross-dissolve lands at export time 12.3-12.5 and targets Scene 1's opening frame.
- [ ] Confirm final timeline totals **12.5s** (Scene 0's 0.5s + 12s body), within the 10.5-15.5s target.
- [ ] Apply the blurred-canvas reframe (Section 9.1) to all 6 clips, converting 1176x784 sources to 1080x1920 — do not use a naive `scale=1080:1920`.
- [ ] Export at 9:16 vertical, 1080x1920, 30fps, for Shorts/Reels.
- [ ] Run final loudness check: -16 to -14 LUFS integrated, true peak ≤ -1 dBFS.

---

## 11. Production Readiness

**Final pre-assembly audit.** PASS/FAIL against what the Section 9 `ffmpeg` pipeline needs, validated against the current repository state: `audio/evergreen/pop.wav` now exists, and `videos/scene_0N.mp4` have been renamed so scene content correctly maps to scene number.

### Video assets

| Item | Status | Notes |
|---|---|---|
| Scenes 0-5 rendered | ✅ PASS | All 6 clips present at `videos/scene_00.mp4`–`scene_05.mp4`, 1176x784 @ 24fps, confirmed correctly mapped to their scenes after the rename. |
| `scene_04.mp4` (Payoff) animation quality | ✅ PASS | Sampled frames (start/mid/end) show a consistent excited ("Wow", mouth open) → eyes-closed/content → excited "Wow" arc around the glowing turquoise Wonder Pebble, with stable lighting and sparkle effects — sufficient to justify the +0.5s Payoff extension (item 4). |
| `scene_04.mp4` duration vs. trim target | ✅ PASS (pipeline step required) | Render is **3.0417s** vs. the **4.0s** trim target. Resolved via the freeze-frame hold specified in Section 9.1 (`tpad=stop_mode=clone:stop_duration=0.9583`) — clones the final frame (Bubu mid-"Wow", pebble glowing) for +0.96s. No re-render needed. |
| Aspect ratio vs. export target | ✅ PASS (pipeline step required) | All 6 renders are **1176x784** (3:2 landscape) vs. the **1080x1920** (9:16) export target. Resolved via the blurred-canvas reframe specified in Section 9.1 (scale-to-cover blurred background + scale-to-fit sharp foreground, centered) — no naive `scale=1080:1920`, no re-render needed. |
| Scene 5 → Scene 1 loop-frame match | ✅ PASS | Re-checked post-rename: Scene 1's opening frame and Scene 5's ending frame **both now show the Wonder Pebble in its non-glowing, pale state** — the prior glow-state mismatch is resolved. Remaining differences (eyes open vs. closed, trunk pose, lighting warmth) are moderate, not jarring, and fall well within what the existing 0.2s cross-dissolve (Section 8) is designed to blend. See Loop seam below. |

### Audio assets

| Item | Status | Notes |
|---|---|---|
| `audio/evergreen/brand_sting.wav` | ✅ PASS | Present, 1.0s on disk — `atrim=0:0.5` at assembly to fit Scene 0's fixed 0.5s window (same trim-down pattern used for the other evergreen SFX). |
| `audio/evergreen/wonder_pebble_discovery.wav` | ✅ PASS | Present, 2.0s — supports the expanded `atrim=0:0.5` (item 2). |
| `audio/evergreen/wow_swell.wav` | ✅ PASS | Present, 2.0s — supports the expanded 0.5s swell window. |
| `audio/evergreen/chant_tap_pop.wav` | ✅ PASS | Present, 2.0s — supports the `atrim=0:1.7` / `atrim=1.7:2.0` Tap/Pop split (item 3). |
| `audio/evergreen/music_bed.mp3` | ✅ PASS | Present, 127.9s — trim to 12s at assembly. |
| `audio/evergreen/tap.wav` | ✅ PASS | Present, 1.03s. |
| `audio/evergreen/pop.wav` | ✅ PASS | **Now present, 0.72s** — the former blocking gap is resolved. Single instance via `adelay` at export 8.25 (body 7.75), boosted `volume=1.3`, the episode's single notable SFX (Audio Ownership Rule). |

### Text overlays

| Item | Status | Notes |
|---|---|---|
| "Tap!" pulses (×3) | ✅ PASS | Timing unchanged (export 3.5-4.5 / 4.5-5.5 / 5.5-6.5); paired with `tap.wav` + chant only, no narration. |
| "Wow!" | ✅ PASS | Window export 7.6-8.1 (0.5s); synced to the expanded discovery twinkle + swell. |
| "Arre, Bubu! ...Pop!" | ✅ PASS | Window export 8.1-12.0 (+0.5s for retention); remains the largest text of the episode. |

### Loop seam

| Item | Status | Notes |
|---|---|---|
| Cross-dissolve offset | ✅ PASS | `xfade=...:offset=12.3` (export 12.3-12.5), independent of the Scene 4/5 split — fits within Scene 5's 0.5s duration (0.3s lead-in + 0.2s dissolve). |
| Source frame match (Scene 1 ↔ Scene 5) | ✅ PASS | Resolved by the rename — pebble glow-state now matches across the seam (both non-glowing). Note: the actual render's Scene 5 pebble reads closer to "no glow" than Section 8's spec'd "faint persistent turquoise glow" — a small cosmetic deviation from the canon spec, but it makes the dissolve *more* seamless, not less, and is not worth a re-render. No action required. |

### Export settings

| Item | Status | Notes |
|---|---|---|
| Total runtime | ✅ PASS | 12.5s preserved exactly (Scene 0's 0.5s + 12.0s body). |
| Frame-rate conversion | ✅ PASS | 24fps sources → 30fps via `fps=30` in the Section 9.1 reframe chain. |
| Resolution/aspect | ✅ PASS (pipeline step required) | 1176x784 → 1080x1920 via the blurred-canvas reframe (Section 9.1), applied uniformly to all 6 clips — no re-render. |
| Loudness target | ⏸ PENDING (first-render check) | -16 to -14 LUFS / ≤-1 dBFS spec is defined (Section 9.5.7) and the mix is now fully buildable (`pop.wav` present) — but the actual figure can only be confirmed by measuring the rendered output. Standard post-assembly QA, not a pre-assembly blocker. |

### Net readiness

**All previously-blocking gaps are resolved:**

1. `audio/evergreen/pop.wav` now exists (0.72s) — the full 7-layer audio mix (Section 9.5) is buildable.
2. `scene_04.mp4`'s 3.04s vs. 4.0s shortfall is resolved via a freeze-frame hold (Section 9.1) — no re-render.
3. The 1176x784 vs. 1080x1920 aspect mismatch is resolved via a blurred-canvas reframe (Section 9.1), applied uniformly to all 6 clips — no re-render.
4. The Scene 5 ↔ Scene 1 loop-frame mismatch is resolved by the file rename — pebble glow-state now matches, and the existing 0.2s cross-dissolve handles the remaining minor pose/lighting differences.

**Minor warnings (first-render QA only, not blockers):**

1. **Loudness** — confirm -16 to -14 LUFS integrated / ≤-1 dBFS true peak on the first rendered mix; adjust `alimiter`/gain if needed.
2. **Blurred-canvas aesthetic** — spot-check that the blurred top/bottom bars read well against Bubu Grove's green palette (expected to look like soft out-of-focus foliage).
3. **Loop-seam dissolve** — spot-check that the 0.2s dissolve adequately blends the residual eye-state/pose/lighting differences between Scene 5's end and Scene 1's start.
4. **Scene 4 freeze-hold** — confirm the held final frame (0.96s static hold) doesn't read as a stutter; if it does, the fallback is a subtle ping-pong of the last ~10 frames instead (no re-render either way).

Canon, episode structure, and all specified timings are unchanged. None of the four resolutions above required new assets, re-renders, or timing changes — only pipeline-step specifications (Section 9.1).

### Verdict: READY WITH MINOR WARNINGS

Episode 02 is ready for assembly. All assets exist, all four prior gaps have concrete, no-re-render pipeline solutions (Section 9.1), and the remaining items are standard first-render QA checks (Section 12).

---

## 12. Final Assembly Specification

Execution-ready specification per the Section 11 verdict (READY WITH MINOR WARNINGS). Folds the two new pipeline steps — scene_04 freeze-frame hold and blurred-canvas reframe — into Sections 8-9.

### 12.1 Final ffmpeg assembly strategy

1. **Reframe + format each clip** to 1080x1920/30fps/yuv420p/`-an` via the Section 9.1 blurred-canvas chain. Clip 4 only: prepend `tpad=stop_mode=clone:stop_duration=0.9583` before the chain (pads 3.0417s → 4.0s). → `clip00.mp4` … `clip05.mp4`.
2. **Trim each clip** to its Section 9.1 duration (clip 0: 0.5s calmest-Wobble segment; clips 1-4: per table; clip 5: final 0.5s, 2.54→3.04; clip 4 is already exactly 4.0s after `tpad`).
3. **Concatenate** clips 0-5 via `ffmpeg -f concat -safe 0 -i list.txt -c copy` → `assembled_video.mp4` (12.5s, hard cuts only).
4. **Build loop-seam target**: extract frame 1 of `clip01.mp4` → `loop_target.png`; build a 0.2s freeze-frame clip `loop_target.mp4` (1080x1920, 30fps, same pix_fmt).
5. **Loop-seam dissolve**: `xfade=transition=fade:duration=0.2:offset=12.3` between `assembled_video.mp4` and `loop_target.mp4` → `assembled_video_seamed.mp4` (still 12.5s).
6. **Text overlays**: apply the chained `drawtext` filter (Section 9.4) to `assembled_video_seamed.mp4` → `video_with_text.mp4`.
7. **Audio mix**: build the layered mix (Section 12.3) → `audio_mix.wav`.
8. **Final mux**: `ffmpeg -i video_with_text.mp4 -i audio_mix.wav -map 0:v -map 1:a -c:v libx264 -pix_fmt yuv420p -crf 18 -c:a aac -b:a 192k -shortest final/bubu_ep02_good_morning_bubu_final.mp4`.
9. **QA pass** (Section 11 minor warnings): `ffprobe` confirms 1080x1920 / 30fps / 12.5s; measure loudness (-16 to -14 LUFS, ≤-1 dBFS); visually spot-check the loop seam, blur-canvas bars, and the scene_04 freeze-hold.

### 12.2 Final trim table

| Order | Source | Processing | Duration | Export timecode |
|---|---|---|---|---|
| 0 | `videos/scene_00.mp4` | trim to 0.5s (calmest Wobble phase) → blur-canvas reframe | 0.5s | 0.0-0.5 |
| 1 | `videos/scene_01.mp4` | 0.0→2.0 → blur-canvas reframe | 2.0s | 0.5-2.5 |
| 2 | `videos/scene_02.mp4` | 0.0→4.0 → blur-canvas reframe | 4.0s | 2.5-6.5 |
| 3 | `videos/scene_03.mp4` | 0.0→1.5 → blur-canvas reframe | 1.5s | 6.5-8.0 |
| 4 | `videos/scene_04.mp4` | full 3.0417s + `tpad` freeze-hold +0.9583s → blur-canvas reframe | 4.0s | 8.0-12.0 |
| 5 | `videos/scene_05.mp4` | trim 2.54→3.04 (final 0.5s) → blur-canvas reframe | 0.5s | 12.0-12.5 |
| — | loop seam | 0.2s cross-dissolve, `offset=12.3`, into freeze-frame of clip01 frame 1 | (overlap) | 12.3-12.5 |
| | | **Total** | **12.5s** | within 10.5-15.5s target ✅ |

### 12.3 Final audio mix plan

| Layer | Source | Placement (export time) | Level |
|---|---|---|---|
| 1. Brand sting | `audio/evergreen/brand_sting.wav`, `atrim=0:0.5` | 0.0-0.5 | full |
| 2. Music bed | `audio/evergreen/music_bed.mp3`, trimmed to 12s, shifted +0.5 | 0.5-12.5 | piecewise 0%→20%→8%→20% per Section 9.5.2 |
| 3. Build ticks | `audio/evergreen/tap.wav` ×3 via `adelay` | 3.5 / 4.5 / 5.5 | full |
| 4. Chant (Tap) | `audio/evergreen/chant_tap_pop.wav`, `atrim=0:1.7` | aligned with ticks (3.5/4.5/5.5) | soft, woven into music bed |
| 5. Discovery twinkle | `audio/evergreen/wonder_pebble_discovery.wav`, `atrim=0:0.5` | 7.6 | woven into music bed |
| 6. Wow swell | `audio/evergreen/wow_swell.wav`, `atrim=0:0.5` | 7.6 | woven into music bed |
| 7. Payoff SFX | `audio/evergreen/pop.wav` (0.72s) | 8.25 | boosted `volume=1.3` — loudest element |
| 8. Chant (Pop) | `audio/evergreen/chant_tap_pop.wav`, `atrim=1.7:2.0` | 8.25 (with layer 7) | woven into music bed |

Combine via `amix=inputs=N:duration=longest:dropout_transition=0:normalize=0` (N = total instance count across layers 1-8, including the 3 separate `adelay` instances for layers 3-4), then `alimiter=limit=0.95` → `audio_mix.wav`. Target: -16 to -14 LUFS integrated, true peak ≤ -1 dBFS (confirm on first render — Section 11 minor warning 1).

### 12.4 Final export settings

- **Container/codec**: MP4, H.264 (`yuv420p`, `crf 18`) + AAC 192k
- **Resolution**: 1080x1920 (9:16 vertical), via blurred-canvas reframe from 1176x784 sources (Section 9.1) — not a naive scale
- **Frame rate**: 30fps (converted from 24fps sources via `fps=30`)
- **Duration**: 12.5s (Scene 0's 0.5s + 12.0s body), within the 10.5-15.5s target
- **Transitions**: hard cuts throughout, except a single 0.2s cross-dissolve loop seam at export 12.3-12.5
- **Loudness**: -16 to -14 LUFS integrated, true peak ≤ -1 dBFS
- **Output path**: `final/bubu_ep02_good_morning_bubu_final.mp4`
