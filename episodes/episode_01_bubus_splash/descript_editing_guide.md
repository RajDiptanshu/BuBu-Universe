# Episode 01 — "Bubu's Splash" — Descript Editing Guide

**Source clips:** `video/Scene_01.mp4`, `video/Scene_02.mp4`, `video/Scene_03.mp4`, `video/Scene_04.mp4`, `video/Scene_05.mp4`
**Export target:** `final/bubu_ep01_waterplay_splash.mp4` — 9:16, ≥1080×1920, MP4 (H.264), 30fps, 12s total
**Based on:** `editing_plan.md` (this is the Descript-specific execution of that plan — equivalent to `capcut_editing_guide.md`, written for Descript's timeline/track model)

> ⚠️ **Raw clip lengths vs. target lengths differ.** The 5 generated clips are 3s / 4s / 3s / 3s / 3s (16s total raw). The target timeline is 2s / 4s / 2s / 3s / 1s (12s total). Section 1 gives exact trim points — trim each clip on the timeline **before** the next clip starts, so your sequence timecodes match Section 1 directly.

---

## 0. Project Setup

1. Create a new Descript project (File → New Project), set the canvas/aspect ratio to **9:16 (1080×1920)** in Project Settings.
2. Import all 5 source files: `video/Scene_01.mp4` through `Scene_05.mp4` into the Descript **Media** panel (drag-and-drop or "Add Media").
3. Descript auto-generates a transcript track for each clip on import — since these clips have no dialogue, you can ignore/hide the transcript track for the video clips, or delete the auto-captions it creates for them (Settings → uncheck "Auto-transcribe" for future imports if it gets noisy).
4. Create the following tracks on the timeline, top to bottom: **Video** (clips), **Text/Overlay** (Descript "Add Text" layers), **Music**, **Ticks** (percussion one-shots), **SFX**, **Narration**.

---

## 1. Clip Order, Trims, and Durations

Drag each clip from the Media panel onto the **Video** track, in order, then trim using Descript's clip handles (drag the left/right edge of the clip on the timeline) or by selecting the clip and using the **Trim** controls in the right-side panel.

| Order | Source File | Raw Length | Trim (In → Out) | Trimmed Length | Timeline Position |
|---|---|---|---|---|---|
| 1 | `Scene_01.mp4` | 3s | **1.0s → 3.0s** (drop the first 1s of idle sway; keep the final 2s ending on the forward lean into Scene 2) | 2s | 0:00–0:02 |
| 2 | `Scene_02.mp4` | 4s | **0.0s → 4.0s** (full clip, no trim) | 4s | 0:02–0:06 |
| 3 | `Scene_03.mp4` | 3s | **0.0s → 2.0s** (drop the final 1s; keep the opening 2s of the near-freeze pose) | 2s | 0:06–0:08 |
| 4 | `Scene_04.mp4` | 3s | **0.0s → 3.0s** (full clip, no trim) | 3s | 0:08–0:11 |
| 5 | `Scene_05.mp4` | 3s | **2.0s → 3.0s** (drop the first 2s; keep the final 1s — closest to the calm "Curious" resting pose, per `editing_plan.md` §2) | 1s | 0:11–0:12 |

**Total timeline: 12s.**

### Descript steps for each clip
1. Drag the clip onto the Video track at the correct position (clips will auto-ripple/snap to the previous clip's end if "Ripple" mode is on — recommended, so trims don't leave gaps).
2. Click the clip, then drag its left edge inward to set the In point, and right edge inward to set the Out point, per the table above. Use the zoom slider (bottom-right of the timeline) to zoom in for frame-accurate trimming.
3. Confirm the clip's displayed duration matches the "Trimmed Length" column.
4. **Do not apply any transition** between clips — in Descript, simply leave clips butted directly against each other (no crossfade/dissolve added). If you accidentally double-click the seam and a transition picker appears, choose "None" / press Escape.

### Loop-point check (Scene 5 → Scene 1)
Scrub to 0:11.5–0:12.0 and then 0:00.0–0:00.5 using frame-step (arrow keys step one frame at a time in Descript's player). Bubu's pose and the puddle's pale blue-gray color should closely match across the cut. If it reads as a jump, nudge Scene 5's in-point by 2-3 frames within its final ~1s window — don't extend past ~1s, or the 12s total breaks.

---

## 2. Text Overlays

Per `editing_plan.md` §5 — text appears only in Beats 1, 2, and 4. Use Descript's **"Add Text"** tool (Text panel → drag a text layer onto the Text/Overlay track). Style: large rounded friendly font, high-contrast color, positioned in the upper negative space (above Bubu, never overlapping the puddle/object zone).

| Add Text At | Text | Clears By | Descript Notes |
|---|---|---|---|
| 0:00.0 | **"Bubu!"** | 0:02.0 | Add a text clip on the Text track, start at 0:00.0, length ~2s. Apply a "Fade In" animation preset (~0.2s) from the animation dropdown on the text layer. |
| 0:02.0 | **"Tap!"** (pulse 1) | 0:03.3 | New text clip, start 0:02.0, length ~1.3s. Apply a "Pop"/scale-in animation. |
| 0:03.3 | **"Tap!"** (pulse 2) | 0:04.6 | Same as above, start 0:03.3. |
| 0:04.6 | **"Tap!"** (pulse 3) | 0:06.0 | Same as above, start 0:04.6 — should end exactly at the Scene 2→3 cut. |
| 0:06.0–0:08.0 | *(none)* | — | Leave the Text track empty here. |
| 0:08.0 | **"Splash!"** | 0:11.0 | Largest text element in the episode. Start at 0:08.0, length 3s. Use a stronger "Bounce In" entrance animation, timed to land exactly on the splash-impact frame; no exit animation needed since the next clip cuts in cleanly at 0:11.0. |
| 0:11.0–0:12.0 | *(none)* | — | Leave the Text track empty here. |

**Practical tip:** create each "Tap!" as its own separate text clip on the Text track (three short clips at 0:02.0 / 0:03.3 / 0:04.6) rather than one clip with keyframed visibility — this makes it easy to nudge each one against the corresponding percussion tick in Section 3 by eye on the waveform.

---

## 3. "Tap" Sound — Music Percussion Ticks (NOT a separate SFX)

Per the **single-SFX rule** (`editing_plan.md` §3), the 3 taps in Scene 2 are carried by percussion hits **inside the music bed**, not a standalone SFX. Add 3 short percussion one-shots (soft xylophone/wood-block/marimba "plink", ≤0.3s each) on the dedicated **Ticks** track, then either keep them as a separate track that's bounced together with Music on export, or merge them into your music stem before importing — the goal is that the final mix reads as "one music element + one SFX," not "music + 3 extra SFX + 1 SFX."

| Tick | Timecode | Sync Target |
|---|---|---|
| Tick 1 | 0:02.0 | Trunk's 1st downward tap (Scene 2 start) + "Tap!" text/narration pulse 1 |
| Tick 2 | 0:03.3 | Trunk's 2nd tap + "Tap!" pulse 2 |
| Tick 3 | 0:04.6 | Trunk's 3rd tap + "Tap!" pulse 3 |

**Descript steps:**
1. Import your 3 percussion one-shot files into the Media panel (or one file you'll duplicate 3×).
2. Zoom the timeline in on Scene 2 (0:02–0:06) until you can see the trunk-tap frames clearly in the video preview.
3. Drag a percussion clip onto the **Ticks** track, snap its start to the frame of the 1st tap (~0:02.0). Repeat for ticks 2 and 3 at ~0:03.3 and ~0:04.6.
4. Play back with the Music track muted to confirm the 3 ticks land cleanly on the visual taps, then unmute Music and check the overall balance (ticks should sit "inside" the music, not as a jarring separate layer).
5. If your final music bed already includes ticks at roughly these intervals, skip this section entirely and just verify the existing ticks line up — don't add a second layer of ticks on top.

---

## 4. Splash SFX Timing (the episode's single SFX)

| Timecode | SFX | Placement Notes |
|---|---|---|
| **0:08.0** (exact) | **"Splash"** — short (≤0.5s), bright, "plinky" water splash | Place on the **SFX** track. The clip's first frame/waveform onset should land exactly at 0:08.0, the Scene 3→4 cut point where the trunk strikes the puddle. |

**Descript steps:**
1. Import the splash SFX audio file into the Media panel.
2. Drag it onto the SFX track. Zoom in on the waveform and align the SFX's transient (the sharp onset spike in the waveform) to 0:08.0.
3. Use the player's frame-step to verify the SFX onset and the splash-impact video frame are within ~1-2 frames of each other (per the Red Flag tolerance in `quality_checklist.md`).
4. **Scan every audio track for any other SFX clips** — the SFX track should contain only this one clip, and no other track (Music, Ticks, Narration) should have a second percussive/impact sound anywhere else in the timeline.

---

## 5. Music Timing

One continuous music bed runs 0:00–0:12 on the **Music** track, looping seamlessly back to 0:00 on auto-replay.

| Timecode | Music Behavior | Descript Notes |
|---|---|---|
| 0:00–0:02 | Steady, warm, gentle opening phrase | Place the music clip starting at 0:00.0, full length covering all 12s. |
| 0:02–0:06 | Same steady bed, plus the 3 ticks from Section 3 | Ticks live on their own track over this region. |
| 0:06–0:08 | **Quiet dip** — lower volume / hold a sustained quiet note, creating the "held breath" feel | Use Descript's volume automation: click the Music clip, enable the volume line on the clip, add a keyframe (point) at 0:06.0 at 100%, another at ~0:06.3 dropping to ~45%, hold flat to ~0:07.7. |
| **0:08.0** | **Swell** — music brightens/peaks here, synced with the Splash SFX and "Splash!" text | Add a volume keyframe ramping from ~0:07.7 (45%) back up to 100%+ at 0:08.0. |
| 0:08–0:11 | Sustained swell/brightness through the Payoff | Hold the elevated level through 0:11.0. |
| 0:11–0:12 | **Resolve** — ease back toward the 0:00 opening level so the loop is musically seamless | Add a final keyframe easing back to the 0:00 starting volume/character by 0:12.0. |

**Descript steps for volume automation:**
1. Select the Music clip → open its audio properties → enable the volume keyframe/automation line (appears as a draggable line over the waveform).
2. Click to add points at: 0:06.0 (100%), 0:06.3 (~45%), 0:07.7 (~45%), 0:08.0 (100%+), 0:12.0 (back to 0:00's level).
3. Play through the dip → swell → resolve and confirm the swell at 0:08.0 feels simultaneous with the splash visual and SFX, not early or late.

---

## 6. Narration Timing

Place/trim the narration recording on the **Narration** track per `editing_plan.md` §6. If recording fresh in Descript, use its built-in recorder (or Overdub if you have a voice model trained) and then trim each line to these windows:

| Timecode | Narration |
|---|---|
| 0:00–0:02 | "Bubu!" |
| 0:02–0:06 | "Tap! Tap! Tap!" (one word per tick, at 0:02.0 / 0:03.3 / 0:04.6) |
| 0:06–0:08 | *(silence)* |
| 0:08–0:11 | "Splash!" (starts at 0:08.0, with the SFX and music swell) |
| 0:11–0:12 | *(optional, very quiet wordless hum)* |

If Descript's auto-transcript creates word-level clips for the narration, you can drag each word to align precisely with its timecode using the transcript-based editing view — this is one of Descript's strengths over CapCut for this step.

---

## 7. Final Assembly Checklist

- [ ] 5 clips trimmed per Section 1, placed back-to-back on the Video track with **no transitions**.
- [ ] Total timeline length = **12.0s** exactly.
- [ ] Scene 5's end frame (0:12.0) visually matches Scene 1's start frame (0:00.0) for a clean loop.
- [ ] Text overlays placed exactly per Section 2 — "Bubu!" (0:00–0:02), "Tap!" ×3 (0:02.0/0:03.3/0:04.6), "Splash!" (0:08.0–0:11.0), nothing during 0:06–0:08 or 0:11–0:12.
- [ ] Music bed covers 0:00–0:12 with: steady open → 3 ticks under Scene 2 → quiet dip in Scene 3 → swell at 0:08.0 → resolve by 0:12.0.
- [ ] **Exactly one** SFX clip in the whole project: "Splash" at 0:08.0.
- [ ] Narration synced per Section 6, including the silent gap in Scene 3.
- [ ] Export (Descript: File → Export → Video): 9:16, ≥1080×1920, MP4 (H.264), 30fps → save to `final/bubu_ep01_waterplay_splash.mp4`.
