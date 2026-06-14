# Scene_01_v1.mp4 — Brutal Render Review

**File:** `Scene_01_v1.mp4` (8.29 MB, H.264 + AAC, 720×1280, 30fps, **16.2s**)
**Reviewed against:** `editing_plan.md`, `production/production_checklist.md`, `production/quality_checklist.md`, canon (`character_bible.md`, `visual_style_guide.md`)

**Verdict up front:** This is **not an edit of the 5 Higgsfield clips** in `video/`. It's a brand-new, self-contained AI-generated sequence (almost certainly produced by Descript's built-in AI video/storyboard generator), with a different character render, a different structure, and a different runtime than anything in `editing_plan.md`. As a standalone clip it's charming — but it fails most of the project's hard rules and is not ready to be Episode 01.

---

## Timeline as actually rendered

| Time | On-screen text | What's happening | Puddle color |
|---|---|---|---|
| 0:00–0:02 | "Bubu sees a puddle" | Bubu standing, looking down | pale gray |
| 0:02–0:08 | "Tap! Tap!" (held ~6s) | Trunk resting in/near puddle — **almost no visible change across 6 seconds** | pale gray, no ripple |
| 0:08–0:10.5 | "Oh!" | Surprise pose, trunk pulled up/curled | pale gray |
| 0:10.5–0:14 | "Splash!" | Bubu jumps/dances, droplets fly | **turquoise/cyan** |
| 0:14–0:16.2 | "Yay!" | Bubu calm again | back to pale gray |

---

## Critical issues (must fix)

1. **Watermark baked into every frame.** "descript" logo sits bottom-right on all 16.2s — this is the free-tier export watermark. Cannot be published like this; needs a paid Descript export (or a different export path entirely).

2. **Runtime is 16.2s, not 12s — and outside even the broad 10–15s envelope.** `editing_plan.md` and `production_checklist.md` both lock the format at 12s (2/4/2/3/1s). This clip is 35% over target. For a toddler Short, 16s with a 6-second dead zone in the middle (see #4) is a retention killer.

3. **On-screen text violates the 1–2 word rule and the planned word set.** Plan calls for exactly 3 text events: `"Bubu!"` → `"Tap!"` ×3 pulses → `"Splash!"`. The render instead shows **5** captions: `"Bubu sees a puddle"` (4 words — sentence, not label), `"Tap! Tap!"`, `"Oh!"`, `"Splash!"`, `"Yay!"`. Two extra beats/words ("Oh!", "Yay!") exist that aren't in the canon's 5-beat/text design, and the opening caption is a full sentence rather than a 1-2 word label.

4. **The "Tap" beat (0:02–0:08, 6 seconds) is dead air.** Per the contact sheet, frames from 0:03 to 0:07 are nearly identical — trunk parked in the puddle, no visible tap motion, no ripple, no puddle reaction. The plan specifies **3 distinct taps** synced to music ticks and 3 separate "Tap!" pulses; this render has one static "Tap! Tap!" label sitting over a frozen pose for a quarter of the video's runtime.

5. **Splash payoff is ~2.5s late and the Anticipation beat is doubled up.** Plan: Splash hits at exactly **0:08.0**, with 0:06–0:08 as a silent 2s anticipation. Render: an entire extra "Oh!" beat runs 0:08–0:10.5 (2.5s) *before* the splash, pushing the actual payoff to ~0:10.5–0:11.

6. **No silence anywhere in the audio.** `silencedetect` (−30dB / 0.3s) found **zero** silent gaps across all 16.2s. The plan requires a "held breath" silent gap during Anticipation (0:06–0:08) and a single continuous music bed + exactly one SFX. The spectrogram looks like continuous narration/voice for the full duration — there's no evidence of a separate music bed, and no way to confirm a clean single-SFX moment versus narration emphasis.

7. **Resolution is 720×1280.** Export spec (both editing guides + `production_checklist.md` §7.1) requires **minimum 1080×1920**. This is below minimum.

8. **Loop point doesn't match.** End frame (0:16.2, "Yay!" caption, gray puddle) vs. start frame (0:00, "Bubu sees a puddle" caption, gray puddle) — the *poses* are close enough, but the **captions don't match**, so the loop cut will show a visible text pop/jump rather than a seamless replay. Per plan, 0:11–0:12 (and by extension the loop seam) should have **no text** at all.

---

## Secondary issues (worth flagging)

9. **Character render style doesn't match the locked canon.** This Bubu is a glossy, rounded "toy/plaster" 3D render with a curled trunk-tip and different ear/body proportions than the v2 character bible (perfect-circle ears ~40% of head width, single hook-shaped trunk, flat 2.5D toon style, `#6B7C8C` locked outline — see `episode_01_brand_audit.md` for the same issue already flagged in the prompt docs). If this asset is kept, expect a Character Recognition consistency hit similar to the brand audit's score of 6/10.

10. **Hero color check:** the splash turquoise reads close to `#4FD1C5` — this part is actually good and should be preserved if this asset is reworked.

11. **File naming is misleading.** `Scene_01_v1.mp4` implies this is just "Scene 1" (a 2s Hello beat per the plan), but it's actually a full ~16s multi-beat sequence covering the whole episode arc. Also doesn't follow the `production_checklist.md` §7.3 final-export naming convention (`bubu_ep{NN}_{pillar}_{keyword}.mp4`).

---

## What's actually working

- The **Hello → Build → Anticipation → Payoff → Loop** *shape* is conceptually present (even if mistimed/duplicated).
- The **turquoise color-reveal payoff** itself looks visually appealing and on-brand for the hero color.
- Character is cute, on-model in *spirit* (round, soft, toddler-friendly), even if not matching the locked v2 spec exactly.

---

## Recommendation

Treat this as a **separate experiment**, not a draft of Episode 01. Two paths forward:

- **Path A (recommended):** Continue with the originally planned pipeline — assemble the 5 existing Higgsfield clips (`video/Scene_01.mp4`–`Scene_05.mp4`) per `editing_plan.md` and the CapCut/Descript editing guides. Those clips already match the canon character design and were generated specifically to hit the 12s/5-beat target.
- **Path B:** If you want to pursue Descript's AI-generated full-sequence approach instead, it needs a major rework pass: trim to 12s, cut to exactly 3 text events with the correct 1–2 word labels, fix the dead 6s "Tap" beat into 3 distinct taps, move the splash to 0:08.0, add real silence before the payoff, re-export at ≥1080×1920 without the watermark (requires a paid Descript plan), and run the result through `episode_01_brand_audit.md`-style canon checks.
