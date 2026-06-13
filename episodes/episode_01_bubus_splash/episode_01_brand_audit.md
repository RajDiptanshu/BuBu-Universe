# Episode 01 Brand Audit — "Bubu's Splash!"

**Audit basis:** `canon/bubu_project_canon.md` reading order — `bubu_core_identity_block.md` → `bubu_personality_bible.md` → `bubu_universe_bible.md` → `visual_style_guide.md`, cross-checked against `content_pillars.md` and `engagement_framework.md`.

**Files reviewed:** `episode_01_full_package.md`, `scene_breakdown.md`, `image_prompts.md`, `video_prompts.md`, `editing_plan.md`.

---

## Scores

| # | Category | Score (1-10) |
|---|---|---|
| 1 | Character Recognition | 6 |
| 2 | Personality Consistency | 6 |
| 3 | Universe Consistency | 7 |
| 4 | Toddler Retention | 9 |
| 5 | Educational Value | 7 |
| 6 | Replayability | 9 |
| 7 | Franchise Potential | 6 |

---

## What's Already Working (do not change)

- **5-beat structure** matches `engagement_framework.md` exactly: 2s / 4s / 2s / 3s / 1s, correct expressions per beat (Curious → Focused → Surprise → Delight → Curious), correct on-screen-text rule (text only in Beats 1, 2, 4).
- **Pillar fit** is excellent: Water Play's trunk-spray payoff is, per `content_pillars.md`, "the single most on-brand payoff for an elephant mascot" — the right choice for Episode 01.
- **Loop design** is exemplary: Scene 5's frame-matching, hard-cut-only loop point, and trim guidance in `editing_plan.md` directly implement `engagement_framework.md`'s loop mechanics and Universe Bible §8's "I want to see it again" goal.
- **World Rules honored:** "everything starts quiet, one thing gets loud" (puddle saturation 0.25 → 0.85), "good things take three tries" (3 taps), "Bubu's trunk is the only thing that starts a wonder moment" (tap → splash) — all correct per `bubu_universe_bible.md` §7.
- **Joyful Wonder arc** (Wonder → Focus → brief Surprise → Joy → Wonder) is followed precisely, including Surprise capped at 2s per `bubu_personality_bible.md` §3.

---

## Weaknesses (by canon layer)

### 1. Core Identity (`bubu_core_identity_block.md`) — drives Character Recognition score

- **Outdated spec in `episode_01_full_package.md`:** its "AI Image Prompts" base description still says "two large round ears (~38% of head width)" and "trunk that curls in a single smooth curve" — this is the **pre-v2 spec**. The locked v2 identity requires perfect-circle ears (~40%, "two coins") and a single fixed **hook**-shaped trunk (rotated per pose, never a different curve shape).
- **Missing outline everywhere:** neither `episode_01_full_package.md` nor `image_prompts.md` include the locked `#6B7C8C` silhouette outline — the single change the v2 panel identified as most critical for thumbnail legibility and cross-generation drift resistance. Without it, Episode 01's renders risk inconsistent edges relative to every future episode generated against v2.
- **Style conflict in `image_prompts.md`:** its prompts specify "soft-shaded toon-3D illustration style, gentle gradients, soft shadows," which contradicts the core identity block's locked "Flat 2.5D toon illustration style... minimal gradient shading, no harsh shadows... vector-illustration quality." Per the canon precedence rule, the core identity block wins — this is the highest-impact fix, since it affects all 5 keyframes.

### 2. Personality Bible (`bubu_personality_bible.md`) — drives Personality Consistency score

- **"Arre, Bubu!" catchphrase is absent.** The personality bible defines this as Bubu's "one universal exclamation, said... at the Payoff beat of *every* episode," always paired with the episode's payoff word (e.g., "Arre, Bubu! ...Splash!"). Episode 01's Payoff narration/text is just "Splash!" — the constant half of the brand's signature line is missing from the flagship pilot.
- **Ear-Perk & Point signature is not depicted.** Signature #2 specifies a synchronized ear-lift (~10-15°) + trunk-snap-to-Point at the Hello→Build transition (Scene 1→2), described as the moment that "becomes a cue that something is about to happen" across all 1000 episodes. The current Scene 1→2 transition only describes a body lean and trunk lift — the named signature gesture isn't called out.

### 3. Universe Bible (`bubu_universe_bible.md`) — drives Universe Consistency score

- **Naming inconsistency:** `episode_01_full_package.md` calls the location a "pond" throughout, while `scene_breakdown.md`, `image_prompts.md`, and the Universe Bible (Location #1, "The Puddle") all use "puddle." Minor, but worth aligning since "The Puddle" is now the canonical named location.
- **Wonder Pebble absent.** World Rule #8 ("The meadow remembers") establishes Wonder Pebbles as "the only form of continuity/memory in the world" and the franchise's primary long-term collectible mechanic — every payoff is supposed to create one. Episode 01, as the flagship pilot, doesn't include one. (Note: the Universe Bible was written after this episode and references it retroactively, so this is a gap to close going forward rather than an error at the time of writing.)

### 4. Visual Style Guide / Content Pillars — minor

- Water Play's stated teaching goal includes sensory vocabulary ("wet," "cool") in addition to "splash"/"water" — Episode 01 only reinforces "Tap" and "Splash." Not a defect (1-2 word rule still respected), but a missed opportunity for the pillar's full educational scope.

---

## Recommendations (strengthen the IP, do not redesign)

All of the following are additive/corrective edits to text and prompts — none require changing the episode's structure, beats, timing, or storyboard.

1. **Add "Arre, Bubu!" to the Payoff beat.** Update on-screen text and narration at 0:08 to "Arre, Bubu! ...Splash!" in `episode_01_full_package.md`, `scene_breakdown.md`, and `editing_plan.md` Sections 5–6. This is the single highest-value fix for Franchise Potential — it makes Episode 01 consistent with the catchphrase rule that's supposed to apply to *every* episode, starting from the first one.

2. **Re-lock the image prompts to v2 Core Identity.** In `episode_01_full_package.md`'s base character description and `image_prompts.md`'s shared description, replace the ear/trunk wording with the v2 block's exact language (perfect-circle ~40% ears, hook-shaped trunk with rotation per pose) and add the `#6B7C8C` outline to every prompt. This is the highest-value fix for Character Recognition and protects consistency across all future episodes generated from this template.

3. **Resolve the flat vs. soft-shaded style conflict in `image_prompts.md`** by aligning its style language with the core identity block's "Flat 2.5D toon, minimal gradient shading, no harsh shadows, vector-illustration quality." Since canon takes precedence over episode files, the episode prompt should be updated to match — not the other way around.

4. **Seed the Wonder Pebble mechanic from Episode 01.** Add one small, round, pale gray-blue pebble near the puddle (still within the 3–5 object cap and the "max 2 background shapes" rule, since it can double as the second set-piece) that turns turquoise at the Payoff alongside the puddle. This requires zero new shape vocabulary (round pebble = existing visual language) and establishes Pebble Hill's "memory" mechanic from the very first episode rather than retrofitting it later.

5. **Add the Ear-Perk & Point beat to the Scene 1→2 transition.** A small (~10-15°) synchronized ear-lift paired with the trunk's first forward motion toward the puddle, called out explicitly in `scene_breakdown.md` and `video_prompts.md`'s Scene 1 description — reuses existing assets, no new poses.

6. **Standardize "puddle" terminology.** Replace "pond" with "puddle" (or "The Puddle") throughout `episode_01_full_package.md` for consistency with the Universe Bible's named location and the other episode files.

7. **(Optional, low priority)** Consider a secondary reinforcement of "water" or "wet" via narration phrasing in the music/SFX notes, to more fully cover the Water Play pillar's stated teaching goal — only if it doesn't add a second on-screen word during Beats already at their 1-2 word limit.

---

## Net Assessment

Episode 01 is structurally excellent — it is a near-perfect implementation of the engagement framework and world rules, and its pillar choice is correct. Its gaps are entirely in **brand-signature completeness** (catchphrase, Wonder Pebble, Ear-Perk & Point) and **spec currency** (pre-v2 identity language, missing outline, style conflict) — all fixable without touching the storyboard, timing, or creative concept. Closing these gaps now, while only one episode exists, is far cheaper than retrofitting them across 1000.
