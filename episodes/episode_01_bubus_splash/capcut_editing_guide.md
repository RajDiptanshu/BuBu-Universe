# Episode 01 — "Bubu's Splash" — CapCut Editing Guide

**Source clips:** `video/Scene_01.mp4`, `video/Scene_02.mp4`, `video/Scene_03.mp4`, `video/Scene_04.mp4`, `video/Scene_05.mp4`
**Export target:** `final/bubu_ep01_waterplay_splash.mp4` — 9:16, ≥1080×1920, MP4 (H.264), 30fps, 12s total
**Based on:** `editing_plan.md` (this guide is the CapCut-specific step-by-step execution of that plan)

> ⚠️ **Raw clip lengths vs. target lengths differ.** The 5 generated clips are 3s / 4s / 3s / 3s / 3s (16s total raw). The episode's target timeline is 2s / 4s / 2s / 3s / 1s (12s total). Section 1 below gives exact trim points for each clip — **trim before placing on the timeline**, so your final sequence timecodes match Section 1's table directly.

---

## 1. Clip Order, Trims, and Durations

Work top-to-bottom. For each clip: import → trim to the in/out points below → drag onto the main video track in order, with **hard cuts only** (no transitions — in CapCut, leave the transition icon between clips on "None"/no transition).

| Order | Source File | Raw Length | Trim (In → Out) | Trimmed Length | Timeline Position |
|---|---|---|---|---|---|
| 1 | `Scene_01.mp4` | 3s | **1.0s → 3.0s** (cut the first 1s of idle sway, keep the final 2s which ends on the forward-lean into Scene 2) | 2s | 0:00–0:02 |
| 2 | `Scene_02.mp4` | 4s | **0.0s → 4.0s** (no trim — full clip) | 4s | 0:02–0:06 |
| 3 | `Scene_03.mp4` | 3s | **0.0s → 2.0s** (cut the final 1s, keep the opening 2s — near-freeze pose is consistent throughout, so keep the portion that flows most directly into Scene 4's raised-trunk start) | 2s | 0:06–0:08 |
| 4 | `Scene_04.mp4` | 3s | **0.0s → 3.0s** (no trim — full clip) | 3s | 0:08–0:11 |
| 5 | `Scene_05.mp4` | 3s | **2.0s → 3.0s** (cut the first 2s, keep the **final 1s** — the portion closest to the calm "Curious" resting pose, per the Scene 5 Trim Note in `editing_plan.md` §2) | 1s | 0:11–0:12 |

**Total timeline: 12s.**

### CapCut steps for each clip
1. Drag the clip to the timeline.
2. Tap the clip → **Trim** (or drag the clip's edge handles directly on the timeline) to the In/Out points above.
3. Confirm the clip's duration in the toolbar matches the "Trimmed Length" column.
4. Snap the next clip's start directly against the previous clip's end (CapCut auto-snaps) — do **not** add a transition (if CapCut inserts a default transition icon between clips, tap it and select "None").

### Loop-point check (Scene 5 → Scene 1)
After placing all 5 clips, scrub to 0:11.5–0:12.0 (end of Scene 5) and 0:00.0–0:00.5 (start of Scene 1) side by side (use CapCut's frame-by-frame scrub). Bubu's pose and the puddle's pale blue-gray color should closely match. If the cut still reads as a jump, nudge Scene 5's in-point by 2-3 frames (stay within the final ~1s window) until the match improves — do not extend Scene 5 past ~1s, as that breaks the 12s total.

---

## 2. Text Overlays

Per `editing_plan.md` §5 — text appears only in Beats 1, 2, and 4. Use CapCut's **Text** tool, large rounded friendly font, high-contrast color, positioned in the upper negative space (above Bubu, not overlapping the puddle/object zone).

| Add Text At | Text | Out (fade/clear by) | CapCut Notes |
|---|---|---|---|
| 0:00.0 | **"Bubu!"** | 0:02.0 (fade out, or clear at Scene 2's start) | Fade-in animation (CapCut "Fade In", ~0.2s). Center-upper, above Bubu's head. |
| 0:02.0 | **"Tap!"** (pulse 1) | 0:03.3 | "Loop"/"Bounce" text animation or simple scale-up-then-fade, ~0.5s duration. |
| 0:03.3 | **"Tap!"** (pulse 2) | 0:04.6 | Same animation, re-triggered. Slightly larger scale than pulse 1 is acceptable but not required. |
| 0:04.6 | **"Tap!"** (pulse 3) | 0:06.0 | Same animation, re-triggered; clears exactly at the Scene 2→3 cut. |
| 0:06.0–0:08.0 | *(none)* | — | No text layer during Anticipation — leave this region of the text track empty. |
| 0:08.0 | **"Splash!"** | 0:11.0 | Largest text element of the episode. Use a stronger entrance animation ("Pop"/"Bounce In") timed to land exactly on the splash impact frame. Hold static (no exit animation) until 0:11.0, then cut/fade quickly as Scene 5 begins. |
| 0:11.0–0:12.0 | *(none)* | — | No text during the Loop beat. |

**Practical CapCut tip:** create each "Tap!" instance as a separate text clip (don't reuse one clip with keyframed opacity) — three short (~0.5s–1.3s) text clips placed back-to-back at 0:02.0, 0:03.3, and 0:04.6 is easier to align precisely with the music ticks in Section 4.

---

## 3. "Tap" Sound — Music Percussion Ticks (NOT a separate SFX)

Per the **single-SFX rule** (`editing_plan.md` §3), Bubu's 3 taps in Scene 2 are **not** their own sound-effect layer — they're carried by percussion hits inside the music bed. If your music track doesn't already have audible ticks at these points, add 3 short percussion one-shots (soft xylophone/wood-block/marimba "plink", ≤0.3s each) **on the music track** (or a sub-track that gets merged/exported as part of the music stem) — not as a separate "SFX" clip in CapCut's SFX library, to avoid it reading as a second SFX during QA.

| Tick | Timecode | Sync Target |
|---|---|---|
| Tick 1 | 0:02.0 | Trunk's 1st downward tap (Scene 2 start) + "Tap!" text/narration pulse 1 |
| Tick 2 | 0:03.3 | Trunk's 2nd tap + "Tap!" pulse 2 |
| Tick 3 | 0:04.6 | Trunk's 3rd tap + "Tap!" pulse 3 |

**CapCut steps:** zoom in on the timeline (pinch or use the zoom slider) until 1 second ≈ several centimeters, scrub to find the exact frame of each trunk-tap in `Scene_02.mp4`, then place each percussion one-shot's start at that frame on the audio track directly below the music bed. If your music bed is a single pre-mixed file without ticks, you'll need to either (a) source a music bed that already includes 3 ticks at roughly these intervals, or (b) layer the 3 one-shots and bounce/export the music+ticks together as a single mixed stem before re-importing — so the final timeline still has only one "music" audio element plus the one Payoff SFX.

---

## 4. Splash SFX Timing (the episode's single SFX)

| Timecode | SFX | Placement Notes |
|---|---|---|
| **0:08.0** (exact) | **"Splash"** — short (≤0.5s), bright, "plinky" water splash | Place on a dedicated SFX audio track. Start the clip's first frame exactly at 0:08.0, which is the cut point into Scene 4 and the frame where the trunk strikes the puddle / puddle turns turquoise. |

**CapCut steps:**
1. Import the splash SFX file (CapCut's built-in SFX library has "water splash" / "splash" options — preview a few and pick a short, cheerful, non-startling one; avoid anything with a long drip/reverb tail).
2. Add it to a new audio track, positioned so its **start** aligns with 0:08.0 — this should be the exact frame where Scene 4 begins.
3. Zoom in to confirm there's no gap or overlap — the SFX should start within ~1 frame (≤2 frames per the Red Flag tolerance in `quality_checklist.md`) of the splash-impact visual.
4. **Double-check the whole timeline has no other SFX clips** — search every audio track for additional sound effects (a common CapCut mistake is leaving a default "whoosh" on a transition — there should be no transitions at all, so there should be no such clip).

---

## 5. Music Timing

One continuous music bed runs 0:00–0:12, looping seamlessly back to 0:00 when the platform auto-replays.

| Timecode | Music Behavior | CapCut Notes |
|---|---|---|
| 0:00–0:02 | Steady, warm, gentle opening phrase (establishes the loop's "home" state) | Place the music clip starting at 0:00.0, full length covering 0:00–0:12. |
| 0:02–0:06 | Same steady bed, **plus the 3 percussion ticks** from Section 3 at 0:02.0 / 0:03.3 / 0:04.6 | If ticks are a separate layer, keep them on their own track above/below the main music clip. |
| 0:06–0:08 | **Quiet dip** — lower the music volume (or let it hold a single sustained quiet note/drone) to create the "held breath" anticipation feel | Use CapCut's volume keyframes: add a keyframe at 0:06.0 at normal volume, then a keyframe at ~0:06.3 dropping to ~40-50% volume, hold until ~0:07.7. |
| **0:08.0** | **Swell** — music brightens/peaks exactly here, in sync with the Splash SFX and the "Splash!" text | Add a volume keyframe ramping back to 100% (or briefly above, if your mix allows headroom) starting at ~0:07.7 and peaking at 0:08.0, synced with the SFX placed in Section 4. |
| 0:08–0:11 | Sustained swell/brightness through the Payoff beat | Hold the elevated volume/energy through 0:11.0. |
| 0:11–0:12 | **Resolve** — ease back toward the opening phrase's volume/character so the loop point is musically seamless | Add a final volume keyframe easing back to the 0:00 starting level by 0:12.0 (the loop point). |

**CapCut steps for the volume keyframes:**
1. Select the music clip, open the audio panel, enable keyframes.
2. Place keyframes at: 0:06.0 (100%), 0:06.3 (~45%), 0:07.7 (~45%), 0:08.0 (100%+), 0:12.0 (back to 0:00's level).
3. Preview the dip-and-swell against the video — the swell at 0:08.0 should feel simultaneous with the splash visual and SFX, not slightly before or after.

---

## 6. Narration Timing (reference — sync against existing narration track if present)

Per `editing_plan.md` §6, narration should already exist as a recorded track; place/trim it as follows:

| Timecode | Narration |
|---|---|
| 0:00–0:02 | "Bubu!" |
| 0:02–0:06 | "Tap! Tap! Tap!" (one word per tick, at 0:02.0 / 0:03.3 / 0:04.6) |
| 0:06–0:08 | *(silence)* |
| 0:08–0:11 | "Splash!" (starts at 0:08.0, with the SFX and music swell) |
| 0:11–0:12 | *(optional, very quiet wordless hum)* |

---

## 7. Final Assembly Checklist

- [ ] 5 clips trimmed per Section 1 and placed with **no transitions** (verify every inter-clip transition icon is set to "None").
- [ ] Total timeline length = **12.0s** exactly.
- [ ] Scene 5's end frame (0:12.0) visually matches Scene 1's start frame (0:00.0) for a clean loop.
- [ ] Text overlays placed exactly per Section 2 — "Bubu!" (0:00–0:02), "Tap!" ×3 (0:02.0/0:03.3/0:04.6), "Splash!" (0:08.0–0:11.0), nothing during 0:06–0:08 or 0:11–0:12.
- [ ] Music bed covers 0:00–0:12 with: steady open → 3 ticks under Scene 2 → quiet dip in Scene 3 → swell at 0:08.0 → resolve by 0:12.0.
- [ ] **Exactly one** SFX clip in the whole project: "Splash" at 0:08.0.
- [ ] Narration synced per Section 6, including the silent gap in Scene 3.
- [ ] Export: 9:16, ≥1080×1920, MP4 (H.264), 30fps → save to `final/bubu_ep01_waterplay_splash.mp4`.
