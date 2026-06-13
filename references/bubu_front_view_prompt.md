# Bubu Front View Prompt (v2 — Production-Ready)

A straight-on, perfectly symmetrical reference — the strongest test of bilateral symmetry (ears, eyes, trunk-centering). Used for **QA/reference purposes**; production episode frames default to the three-quarter view (see `bubu_three_quarter_view_prompt.md`).

**v2 supersedes v1.** Summary of changes (full panel critique in `bubu_core_identity_block.md`):

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | "Both ears... identical in size (~38% of head width)" doesn't constrain *shape*, only size — an oval and a circle of the same width would both pass. | Ears are now "perfect circles" — symmetry check becomes "are these two circles identical and mirrored," a binary, easy-to-verify test. |
| Children's psychologist | Trunk described as "hanging centered... relaxed J curl" with no connection to the other expression prompts' trunk poses. | Trunk is now explicitly "Bubu's signature hook at its 0° resting orientation" — same shape/labels used everywhere else. |
| AI image-gen expert | No outline — symmetry errors at the silhouette edge (e.g. one ear circle slightly larger) are harder to spot without a hard edge to measure against. | Added the fixed `#6B7C8C` outline, which makes left/right edge comparisons far easier for both humans and automated symmetry checks. |
| Thumbnail expert | This is a QA-only image, but it's still the easiest place to confirm the twin-circle-ear silhouette reads correctly before it's carried into every other prompt. | Added an explicit thumbnail-scale symmetry check to the optimization notes. |

---

## Exact Prompt (v2)

```
Using the Bubu master reference image as character reference (or the Master
Prompt description if no reference image is available):

Bubu the baby elephant, straight-on front view, perfectly symmetrical, camera
at eye level, full body visible head to feet, standing pose, head held level
(not tilted, not turned).

Bubu's silhouette: a single large rounded teardrop-shaped body with no
visible neck, two perfectly circular flat-disc ears (~40% of head width
each, like two identical coins), positioned identically on both sides of the
head and equidistant from the vertical center line. One short trunk shaped
like a thick, uniform-width "hook" with a softly rounded tip, never longer
than the diameter of one ear — shown here at its 0 degree resting
orientation, hanging centered directly below the face, tip pointing straight
down, not curving left or right. Both eyes equal size and equidistant from
the vertical center line (~23% of face width each, about one eye-width gap
between them), each with one fixed white highlight dot. "Curious" expression
(soft raised eyebrows, gentle closed-curve smile).

Four short stubby cylinder legs, small rounded tail. No tusks, no wrinkles,
no skin texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), inner ears soft pink (#F4B8C0, not visible in this
relaxed pose), cheek blush pink (#FBC7C7), eyes near-black (#2B2B2B) with
white highlight (#FFFFFF). A thin, soft, even outline in dark slate (#6B7C8C)
traces Bubu's entire silhouette, identical in thickness on both the left and
right sides.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, no harsh shadows.

Plain soft pastel cream background (#EAEFF2), no shadows, no props, square
1:1 composition, character centered exactly on the vertical midline.
```

---

## Why Each Design Choice Improves Consistency

- **Straight-on, perfectly symmetrical** — gives every key feature (ears, eyes, trunk position) an unambiguous "correct" answer: mirror symmetry across the vertical centerline. Any asymmetry is instantly visible without needing reference comparison.
- **Perfect-circle ears, "positioned identically on both sides... equidistant from the vertical center line"** — turns symmetry-checking into a simple shape comparison (two circles, same size, same height, mirrored distance from center) rather than a vague "do these look balanced" judgment.
- **"Trunk... hook... at its 0 degree resting orientation, hanging centered... not curving left or right"** — directly counters the model's tendency to add an asymmetric "personality" flourish to the trunk, while also tying this pose back to the same hook-shape vocabulary used in every other prompt.
- **"Both eyes equal size and equidistant from centerline"** — targets one of the most common mascot-design failures (one eye larger, higher, or closer to center than the other), which is especially noticeable on a front-facing character.
- **"Head held level (not tilted, not turned)"** — rules out the head-tilt that's a very common "cute/curious" default in training data, keeping this view a clean symmetry baseline rather than a posed character shot.
- **Outline "identical in thickness on both the left and right sides"** — adds a second, independent symmetry signal: even if the body shape itself is close to symmetric, an uneven outline thickness is an easy tell that something drifted.
- **Identical palette/style block to the Master Prompt** — minimizes prompt-to-prompt token variance, so any visual differences between this and the master image are attributable to pose/angle, not prompt drift.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| Head subtly turned 5–10° off-center | Even when "straight-on" is requested, perfect symmetry is statistically rare in training data — slight turns are extremely common. | Unchanged from v1 — remains the most common failure for this view; regenerate if detected. |
| One ear appears larger/rounder than the other due to the above turn | Foreshortening from an off-center head reads as an "ear size error" even though the ears themselves are correct. | "Perfect circles... equidistant from the vertical center line" gives a precise, measurable target — easier to spot *and* describe the deviation. |
| Trunk drawn curving to one side anyway | Strong stylistic prior toward giving characters an asymmetric "personality" pose. | "Hook at its 0 degree resting orientation... not curving left or right" is more specific than v1's "not curving left or right" alone, since it also fixes the trunk's *shape*, removing one more axis of variation. |
| Eyes at slightly different heights or sizes | General difficulty maintaining bilateral facial symmetry in character generation. | Unchanged — remains a known risk; over-generate and pick the best. |
| Outline thicker/darker on one side, or missing entirely | Outline is a new element; models may render line weight inconsistently. | Explicitly call out "identical in thickness on both sides" as a symmetry check; if outline is unreliable, this view (not a production frame) is the right place to catch it early. |
| Ears blend into head outline | Ear color = body color on the outer edge; without sufficient contrast, the ear silhouette may merge with the head silhouette. | The new `#6B7C8C` outline traces the ear circles independently from the head, giving a hard edge between them even when fill colors match. |

---

## Negative Prompt (v2)

```
head turned, tilted head, asymmetrical ears, mismatched ear sizes, oval ears,
leaf-shaped ears, off-center trunk, trunk curving to one side, tapering
trunk, pointed trunk tip, trunk longer than one ear, uneven eyes, different
sized eyes, eyes at different heights, visible teeth, tongue, open mouth, 3/4
view, side view, profile, back view, multiple characters, cropped body,
partial body, extra limbs, tusks, wrinkles, photoreal, text, watermark, no
outline, uneven outline thickness, thick black outline
```

---

## Optimization Notes for Image Generation Models

- If using a reference image, set **reference-image strength high (0.7–0.9)** for color/identity while letting the pose/angle follow the text prompt (front view) — most reference-image tools let you weight "identity" separately from "pose."
- **Over-generate for this angle** (4–6 variations) and pick the result with the best left-right symmetry — symmetry errors are easy to spot at a glance, so this is an efficient place to filter.
- **Run the thumbnail symmetry check**: scale the chosen image to ~120px wide and confirm the two ear-circles still look identical in size and position — if symmetry only "works" at full resolution but collapses when scaled down, regenerate.
- Treat this image as a **QA/reference asset only** — it validates ear/eye/trunk symmetry baselines but is not used directly in episode production, which defaults to the three-quarter view.
