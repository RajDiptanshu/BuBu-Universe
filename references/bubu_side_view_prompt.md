# Bubu Side View Prompt (v2 — Production-Ready)

A full 90-degree profile reference — the purest test of "recognizable from silhouette alone." Used for **silhouette QA / reference purposes only**; never used directly in episode production.

**v2 supersedes v1.** Summary of changes (full panel critique in `bubu_core_identity_block.md`):

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | "Only the near-side ear visible (~38% of head width, near-circular)" — in profile, an ear's shape is the *only* identity cue left besides the trunk, so "near-circular" wasn't precise enough. | Ear is now an unambiguous **circle**, the strongest possible single-shape identity cue in profile. |
| Children's psychologist | Trunk described only as "a single smooth J curve... tip not extending past the front legs" — disconnected from the hook-shape vocabulary used elsewhere. | Trunk is now "the hook at its 0° resting orientation, seen fully in profile" — same shape, same labels, viewed from the side. |
| AI image-gen expert | This view had no outline, yet it is the view where silhouette-only legibility matters most. | Added the `#6B7C8C` outline, AND added an explicit **pure silhouette validation variant** of the prompt for direct black-on-white testing. |
| Thumbnail expert | "Silhouette remains identifiable even without colors" — this file is now the primary deliverable for that requirement. | New dedicated section below walks through exactly how to test and score this. |

---

## Exact Prompt (v2)

```
Using the Bubu master reference image as character reference:

Bubu the baby elephant, full profile side view (exactly 90 degrees from
camera, facing left), full body visible head to feet, standing pose.

Bubu's silhouette: a single large rounded teardrop-shaped body with no
visible neck, one perfectly circular flat-disc ear visible (~40% of head
width, like a single coin) — the far ear and far eye not visible at this
angle. One short trunk shaped like a thick, uniform-width "hook" with a
softly rounded tip, never longer than the diameter of the ear, shown here at
its 0 degree resting orientation, seen fully in profile, hanging near the
mouth, tip not extending past the front legs. "Curious" expression (soft
raised eyebrow, gentle closed-curve smile, near eye visible with one fixed
white highlight dot).

Four short stubby cylinder legs, small rounded tail. No tusks, no wrinkles,
no skin texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), inner ear soft pink (#F4B8C0, not visible in this
relaxed pose), cheek blush pink (#FBC7C7), eye near-black (#2B2B2B) with
white highlight (#FFFFFF). A thin, soft, even outline in dark slate (#6B7C8C)
traces Bubu's entire silhouette.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, no harsh shadows.

Plain soft pastel cream background (#EAEFF2), no shadows, no props, square
1:1 composition, character centered exactly on the frame, full body visible
head to feet.
```

---

## Silhouette Validation Variant

After generating the color version above, also generate (or create via a simple threshold/fill edit of the same image) this variant — this is the actual test of "identifiable without colors":

```
Same composition and pose as the Bubu profile reference image, but rendered
as a solid black silhouette on a plain white background — no internal
details, no colors, no outline (the silhouette itself is the only shape).
The silhouette should clearly show: one circular ear shape distinct from the
head, one short hook-shaped trunk distinct from the legs, a single rounded
teardrop body with no neck break, and four short legs.
```

Score this image using the **Silhouette Accuracy** category in `bubu_consistency_checklist.md`. If the ear circle, hook trunk, or body shape are not independently identifiable in this pure-silhouette version, the issue is in Bubu's underlying shape design — fix it at the Master Prompt level (`bubu_master_prompt.md`), not by adjusting this prompt's wording.

---

## Why Each Design Choice Improves Consistency

- **Exactly 90 degrees, facing left** — removes all ambiguity about "how much profile" the model should render, and fixes a consistent facing direction so the trunk's "handedness" can be checked against the 3/4-view reference.
- **"One perfectly circular ear visible"** — in profile, the ear is one of only two shapes (with the trunk) carrying Bubu's entire identity; a circle is the most drift-resistant, most recognizable single shape available.
- **"Hook at its 0 degree resting orientation, seen fully in profile, tip not extending past the front legs"** — directly targets the strongest realistic-elephant prior (long profile trunks reaching the ground or beyond) while reusing the same hook vocabulary as every other prompt, so a profile "hook" should look like a rotated/viewed version of the same object as the 3/4-view "hook," not a different trunk.
- **The new outline** — in a single-color profile silhouette, an outline is often the *only* thing separating the ear circle from the head and the trunk hook from the front leg; without it, these shapes can visually merge even when each is individually correct.
- **The Silhouette Validation Variant** — converts the abstract requirement "recognizable without colors" into a concrete, repeatable test with a pass/fail outcome, tied directly to the consistency checklist.
- **Identical palette/style/background block to the Master and Front prompts** — isolates pose/angle as the only variable, so any silhouette failure can be attributed to the angle/shape design itself rather than prompt drift.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| **Tusks appear** | Profile is the single most tusk-associated elephant angle in training data — highest risk of all 8 prompts in this system. | Unchanged — restate "no tusks" early and in the negative prompt; remains the top risk specifically for this view. |
| Trunk rendered too long, reaching the ground or curling forward past the legs | Realistic profile elephant trunks are long and reach the ground; strong prior toward this in profile views. | "Hook... never longer than the diameter of the ear... tip not extending past the front legs" combines a size cap with a positional check. |
| Ear rendered as an oval or floppy/drooping shape instead of a circle | Profile view is where "Dumbo-style" ear drooping is most commonly depicted. | "Perfectly circular... like a single coin" is a harder shape to drift away from than "near-circular." |
| Far ear or far eye partially visible despite "not visible at 90°" | Models often "cheat" toward a slight 3/4 angle even when full profile is requested. | Unchanged — regenerate if detected; this view's entire purpose depends on a true 90° profile. |
| Ear circle and head, or trunk hook and front leg, visually merge into one shape | Same-color adjacent rounded shapes with no internal line are hard to separate, especially in profile. | The outline is specifically intended to prevent this; if it merges anyway, the Silhouette Validation Variant will catch it even if the color version looks acceptable. |
| Body elongated into a more realistic, less teardrop-shaped silhouette | Profile views expose body proportions most clearly, increasing pressure toward realistic elephant body shapes. | Unchanged from v1. |

---

## Negative Prompt (v2)

```
tusks, long trunk, trunk reaching ground, trunk extending past front legs,
trunk curling forward, tapering trunk, pointed trunk tip, hose-like trunk,
floppy ears, drooping ears, oval ears, leaf-shaped ears, far ear visible, far
eye visible, second ear visible, 3/4 view, front view, multiple views,
turnaround sheet, collage, grid, elongated body, realistic elephant
proportions, wrinkles, skin texture, toenails, props, shadows, background
scenery, no outline, thick black outline, merged shapes, ear blending into
head, trunk blending into leg, text, watermark, cropped, partial body
```

---

## Optimization Notes for Image Generation Models

- **Restate "no tusks" both early in the main prompt and in the negative prompt** — this is the highest-risk failure mode across the entire reference system, and profile view is where it is most likely to occur.
- **Always generate the Silhouette Validation Variant** for any approved profile image — this is the most direct test of the "identifiable without colors" requirement and should become a standard step, not an occasional check.
- This view is **not used in episode production** — if the silhouette test fails here, the fix belongs at the Master Prompt / character design level, not in this prompt's wording.
- If tusks, a drooping ear, or merged shapes persist across attempts, try increasing the priority of "no tusks, circular ear, hook-shaped trunk, thin outline separating all shapes" by moving these terms to the very first sentence of the prompt.
