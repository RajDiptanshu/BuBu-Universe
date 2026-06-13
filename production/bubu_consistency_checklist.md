# Bubu Consistency Checklist (v2 — Production-Ready)

A scoring tool for evaluating any generated Bubu image against `bubu_core_identity_block.md` (the v2 locked identity) and `character_bible.md`. Use this for every approved reference image (master, view angles, expressions) and periodically during production (per `production_checklist.md` step 9.3, every ~10 episodes).

**v2 changes from v1**: categories 1-3 and 7 now check against the v2 identity (perfect-circle ears, fixed "hook" trunk shape + rotation table, `#6B7C8C` outline); category 4 adds the outline color to the palette table. Categories 5-6 are unchanged in structure but cross-reference the new trunk-rotation vocabulary.

**Scoring scale (all categories):**

| Score | Meaning |
|---|---|
| 5 | Perfect match — no notable deviation from the v2 identity block |
| 4 | Minor deviation — acceptable, would not be noticed by a viewer |
| 3 | Noticeable deviation — borderline, regenerate if a better option exists |
| 2 | Significant deviation — regenerate |
| 1 | Major deviation / feature broken or missing — automatic regenerate |

---

## 1. Silhouette Accuracy

**What to check:** Use the Silhouette Validation Variant from `bubu_side_view_prompt.md` — convert the image to a solid black silhouette on white (or squint/blur it) and ask: "Does this read as Bubu without any other information?"

**Look for:** Two equal-sized circles (ears), one short hook-shaped trunk distinct from the legs, a single rounded teardrop body with no neck break, four short legs — no competing shapes or extra appendages breaking the outline.

| Score | Description |
|---|---|
| 5 | Instantly reads as Bubu — both ear circles, the hook trunk, and the teardrop body are all independently identifiable in pure silhouette |
| 4 | Reads as Bubu with one minor silhouette oddity (e.g. one ear circle slightly elliptical) |
| 3 | Reads as "a baby elephant" but not distinctly Bubu — e.g. trunk and a front leg merge into one shape |
| 2 | Silhouette is ambiguous — ear circles read as part of the head, or trunk is not distinguishable from a limb |
| 1 | Unrecognizable as an elephant from silhouette alone |

---

## 2. Trunk Accuracy

**What to check:** Compare against the Trunk Rule in `bubu_core_identity_block.md` — the trunk must be the fixed "hook" shape (uniform width along its entire length, softly rounded tip, never tapering, never longer than the diameter of one ear, exactly one smooth curve), and its **rotation must match the pose** per this table:

| Pose | Required Hook Rotation |
|---|---|
| Curious (rest / Hello / Loop) | 0° — tip pointing down toward chest |
| Focused (Build) | ~90° forward — tip pointing horizontally toward object |
| Surprise (Anticipation) | ~180° — tip pointing straight up, very slightly forward |
| Delight (Payoff) | ~215-225° — tip pointing up and back toward near ear |

| Score | Description |
|---|---|
| 5 | Hook shape correct (uniform width, rounded tip, ≤ one ear diameter, one curve) AND rotation matches the pose table exactly |
| 4 | Hook shape correct; rotation is slightly off the target angle but the pose is still clearly distinguishable from the adjacent poses |
| 3 | Hook shape mostly correct (e.g. very slight tapering) OR rotation is ambiguous between two adjacent poses (e.g. Surprise vs. Delight hard to tell apart) |
| 2 | Trunk tapers noticeably, has a second bend/segment, or rotation converges with a different pose (e.g. Delight reads as Surprise) |
| 1 | Trunk missing, duplicated, rendered as a long/realistic elephant trunk, or forms a closed loop |

---

## 3. Ear Accuracy

**What to check:** Both ears must be **perfect circles** (~40% of head width, "like two identical coins"), symmetric and placed high on the head. Color rules: body-color outside; pink `#F4B8C0` interior visible ONLY in Surprise/Delight (ears popped/flapped outward); pink hidden in Curious/Focused (ears relaxed/forward).

| Score | Description |
|---|---|
| 5 | Both ears are circles of identical size/placement, and pink visibility matches the expression rules exactly |
| 4 | Ears correctly circular but very minor size/symmetry mismatch |
| 3 | Ears noticeably mismatched in size, slightly oval rather than circular, or pink shown/hidden incorrectly for the expression |
| 2 | Ears floppy/drooping (Dumbo-style), leaf-shaped, or one ear missing in a view where both should be visible |
| 1 | Ears absent, or rendered as a completely different shape (e.g. large floppy realistic ears) |

---

## 4. Color Accuracy

**What to check:** Sample pixel colors from the image and compare against the fixed hex palette, including the v2 outline:

| Element | Target Hex |
|---|---|
| Body skin | `#A9B7C4` |
| Belly / face patch | `#EAEFF2` |
| Inner ears (Surprise/Delight only) | `#F4B8C0` |
| Cheek blush | `#FBC7C7` |
| Eyes | `#2B2B2B` with `#FFFFFF` highlight |
| **Outline (new in v2)** | **`#6B7C8C`** — thin, even, traces the entire silhouette |

| Score | Description |
|---|---|
| 5 | All sampled colors match target hex values within a small tolerance, AND the outline is present, thin, even, and the correct dark-slate tone |
| 4 | Body/belly/outline colors correct; only accent colors (cheek/inner ear) slightly off |
| 3 | Noticeable hue shift (e.g. body reads more blue or more gray than #A9B7C4), or outline present but wrong color/uneven thickness |
| 2 | Body color drifted toward an unintended family (brown, green, neutral gray), or outline missing entirely |
| 1 | Palette bears no resemblance to the fixed palette |

---

## 5. Expression Accuracy

**What to check:** Compare against the four signal channels defined for the relevant expression — (1) eyes/eyebrows, (2) ears (circle shape + pink visibility), (3) trunk hook rotation (per the table in category 2), (4) body posture (lean direction + foot position).

| Score | Description |
|---|---|
| 5 | All 4 signal channels match the intended expression exactly, including correct hook rotation |
| 4 | 3 of 4 channels match; the 4th is a minor miss (still readable as the right expression) |
| 3 | 2 of 4 channels match — expression is ambiguous between two states (commonly Surprise vs. Delight) |
| 2 | Expression reads as a different one of the four (e.g. Surprise instead of Delight) |
| 1 | Expression unreadable, or contradicts the intended beat (e.g. sad/angry during Payoff) |

---

## 6. Toddler Appeal

**What to check:** Baby-schema maximization — large head-to-body ratio, large eyes, soft rounded shapes (circle ears reinforce this), warm/soft colors, no sharp angles or aggressive features.

| Score | Description |
|---|---|
| 5 | Maximally warm, soft, round, and approachable — ideal for ages 0-2 |
| 4 | Appealing overall with one minor stiff/sharp element |
| 3 | Acceptable but proportions lean slightly more "adult" or neutral than "baby" |
| 2 | Noticeably less cute/soft than the reference — could read as flat or generic |
| 1 | Scary, unsettling, or unappealing for the target age group |

---

## 7. Thumbnail Readability

**What to check:** Scale the image down to roughly 120px wide (typical Shorts thumbnail/feed size) and view it at that size. With the v2 outline, Bubu's edges should remain visible against the pastel background even at this scale.

| Score | Description |
|---|---|
| 5 | Outline is visible at 120px; both ear circles, the hook trunk (at its current rotation), and any hero-color payoff object are all instantly identifiable |
| 4 | Bubu and general mood are clear; one secondary detail (e.g. exact trunk rotation, or expression) is hard to read |
| 3 | Bubu is identifiable but edges are soft/low-contrast at small size, or the scene reads as visually busy |
| 2 | Bubu is hard to distinguish from the background at small size (outline too faint or missing) |
| 1 | Image is visual noise at thumbnail size — unreadable |

---

## Scoring Summary Table

Fill in for each evaluated image:

| Category | Score (1-5) | Notes |
|---|---|---|
| 1. Silhouette Accuracy | | |
| 2. Trunk Accuracy | | |
| 3. Ear Accuracy | | |
| 4. Color Accuracy | | |
| 5. Expression Accuracy | | |
| 6. Toddler Appeal | | |
| 7. Thumbnail Readability | | |
| **Total (out of 35)** | | |

---

## Pass / Fail Thresholds

- **Pass:** Total score ≥ 28/35 **AND** no individual category scores below 3.
- **Automatic regenerate:** Any single category scores **1**, regardless of total — a score of 1 indicates a broken core feature (e.g. missing trunk, tusks present, unreadable silhouette, missing outline) that undermines consistency on its own.
- **Borderline (review manually):** Total between 24-27, or any category scoring exactly 2 — use judgment based on which category is weak. Silhouette Accuracy, Trunk Accuracy, Ear Accuracy, and Color Accuracy scoring below 3 should weigh most heavily toward regeneration, since these are the features most critical to cross-episode consistency and to the v2 silhouette/thumbnail requirements.

## How to Use This Checklist

1. **Reference images (master, view angles, expressions):** Score against this checklist before approving any image as a character-lock reference — these images set the baseline for all 100+ episodes, so they should score as close to 35/35 as possible. For the side-view image specifically, also run the Silhouette Validation Variant (category 1).
2. **Production keyframes (per episode, per `production_checklist.md` step 3.3):** Score quickly against categories 1, 2, 3, 5, and 7 (the categories most likely to drift frame-to-frame, and the ones most affected by the v2 hook-rotation and outline changes); full 7-category scoring is optional for routine episodes.
3. **Periodic drift check (every ~10 episodes, per `production_checklist.md` step 9.3):** Score a sample of recent episode keyframes against all 7 categories and compare totals over time — a downward trend signals gradual design drift even if individual episodes pass. Pay particular attention to category 2 (Trunk Accuracy) — confirm the hook shape hasn't quietly reverted to a generic "J curve" or, for Delight specifically, re-acquired a closed loop.
