# Bubu Three-Quarter View Prompt (v2 — Production-Ready)

The **production default angle**. Per `character_bible.md` ("always keep Bubu's face toward camera... front or 3/4-front"), this is the view used for the majority of actual episode keyframes — this prompt doubles as a direct template for episode generation, not just a design reference.

**v2 supersedes v1.** Summary of changes (full panel critique in `bubu_core_identity_block.md`):

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | "Far ear partially visible behind the head silhouette but not hidden" was the right instinct but relied on a vague "near-circular" ear shape — a partially-occluded oval is much harder to read consistently than a partially-occluded circle. | Far ear is now a partially-occluded **circle** ("two coins, one slightly behind the other") — a much more stable partial shape across generations. |
| Children's psychologist | Trunk curve direction ("toward the camera-near side... J curve") wasn't tied to the rest/Build/Anticipation/Payoff poses used in the expression prompts — toddlers see four "different" trunks across the episode's beats. | This view's trunk is now explicitly "the hook at its 0° resting orientation" — the same shape referenced in `bubu_curious_expression_prompt.md`, since this view + Curious expression together form Beat 1/5. |
| AI image-gen expert | No outline — at the 30-35° turn angle, the back-ear/head boundary is the single hardest edge for models to render consistently, and was previously unguarded. | The `#6B7C8C` outline specifically helps separate the partially-hidden far ear from the head silhouette — the most failure-prone edge in this view. |
| Thumbnail expert | Composition values (40-55% frame height, eyes ~40% from top) were correct but didn't account for the new outline's contribution to edge legibility at small sizes. | Outline + circle ears together are emphasized in the optimization notes as the primary thumbnail-legibility levers for this — the most-used — view. |

---

## Exact Prompt (v2)

```
Using the Bubu master reference image as character reference:

Bubu the baby elephant, three-quarter front view (head and body turned
approximately 30-35 degrees from camera, favoring the character's right
side), full body visible head to feet, standing pose.

Bubu's silhouette: a single large rounded teardrop-shaped body with no
visible neck, two perfectly circular flat-disc ears (~40% of head width
each, like two identical coins) — the near ear fully visible and slightly
larger due to perspective, the far ear visible as a circle partially behind
the head silhouette, not hidden. One short trunk shaped like a thick,
uniform-width "hook" with a softly rounded tip, never longer than the
diameter of one ear — shown here at its 0 degree resting orientation, curving
gently toward the camera-near side, tip pointing down toward the chest.
"Curious" expression (soft raised eyebrows, gentle closed-curve smile, both
eyes visible with the far eye slightly smaller due to perspective, each eye
with one fixed white highlight dot).

Four short stubby cylinder legs, small rounded tail. No tusks, no wrinkles,
no skin texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), inner ears soft pink (#F4B8C0, not visible in this
relaxed pose), cheek blush pink (#FBC7C7), eyes near-black (#2B2B2B) with
white highlight (#FFFFFF). A thin, soft, even outline in dark slate (#6B7C8C)
traces Bubu's entire silhouette, including a clear separating line between
the far ear and the head.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, no harsh shadows.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

---

## Why Each Design Choice Improves Consistency

- **This is the production angle** — generating and approving this view first means most actual episode frames can be derived directly from it, rather than from an angle (front/side) that's never used in real episodes.
- **Locking the turn angle to "30-35°, favoring the right side"** prevents inconsistent turn amounts across episodes (sometimes 15°, sometimes 45°), which would otherwise make Bubu's apparent ear/trunk proportions vary frame-to-frame even when the underlying design is unchanged.
- **"Far ear visible as a circle partially behind the head silhouette"** directly targets the most common 3/4-view failure — the back ear vanishing entirely — while the circle shape (vs. v1's "near-circular") gives the model a much more stable partial form to render consistently.
- **"Hook at its 0 degree resting orientation"** ties this view's trunk directly to the Curious expression prompt's vocabulary — since this view + Curious together form the episode's opening and closing frames, using identical trunk language for both reduces the chance of a mismatched loop point.
- **The new outline, specifically called out at the far-ear/head boundary** — this is the single hardest edge in the entire reference system (two similarly-colored, overlapping rounded shapes); an explicit outline instruction gives the model a reason to render a visible separating line there.
- **Switching to 9:16 with the exact production framing values** (40-55% frame height, eyes at ~40% from top) means this prompt is not just a "design reference" but a literal starting template for Beat 1 of any episode.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| Far ear disappears completely | 3/4 turns commonly fully occlude the back ear in realistic/semi-realistic rendering logic. | "Visible as a circle partially behind the head silhouette, not hidden" + outline at that boundary gives the model both a shape and an edge to render, rather than just an instruction not to hide it. |
| Turn angle drifts wider toward profile across generations | Without a reference image anchor, repeated "3/4 view" requests tend to creep toward more extreme angles. | Unchanged — restate "30-35°, not profile" per generation if drift occurs (see Optimization Notes). |
| Trunk curve direction flips between generations (left vs. right) | No inherent "handedness" anchor in the text alone — reference image is needed to lock this. | "Hook... curving toward the camera-near side" + reference image together anchor handedness; the fixed hook *shape* also makes a flipped trunk more visually obvious (a hook pointing the wrong way is easier to spot than a generic "J curve" pointing the wrong way). |
| Background exceeds the 2-set-piece / saturation limits | General model tendency to "fill" backgrounds more than minimal-style prompts request. | Unchanged from v1. |
| Eye-line drifts from the ~40%-from-top target | Composition percentages are approximate guidance for most models, not hard constraints. | Unchanged from v1. |
| Outline missing or inconsistent specifically at the far-ear/head boundary | This is the most geometrically complex edge in the image (overlapping similar-colored shapes at an angle). | If the outline renders elsewhere but not here, treat this as the priority edge to fix — it's the one most responsible for far-ear visibility, which is this view's top historical failure mode. |

---

## Negative Prompt (v2)

```
profile view, side view, full back view, far ear missing, far ear hidden,
one ear only, oval ears, leaf-shaped ears, mismatched ear sizes, trunk
direction inconsistent, multiple bends in trunk, tapering trunk, pointed
trunk tip, trunk longer than one ear, hose-like trunk, extreme turn angle,
more than 45 degrees turned, tusks, wrinkles, background characters, more
than 2 background elements, cluttered background, oversaturated background,
no outline, thick black outline, outline missing at ear boundary, text,
watermark, cropped, partial body
```

---

## Optimization Notes for Image Generation Models

- Once an approved 3/4-view image exists, use **it** (not just text) as the primary character-lock input for every episode keyframe — text-only angle descriptions are among the least consistent specifications across models.
- If angle drift occurs across a generation batch, **re-state "30-35°, not profile" in every prompt** rather than relying on the reference image alone to hold the angle.
- If the far ear keeps disappearing, try moving the phrase "far ear visible as a circle partially behind the head, separated by a thin outline" earlier in the prompt — edge/occlusion instructions benefit more from front-loading than most other details.
- **Thumbnail check**: scale the approved image to ~120px wide. The two ear-circles (one full, one partial) and the hook-shaped trunk should remain distinguishable from the body at that size — this view is used in the majority of frames, so its thumbnail legibility matters most.
- For tools supporting **multiple reference images**, supply both the front-view reference (anchors proportions/symmetry) and this 3/4-view reference (anchors pose/angle) together — this combination tends to be more stable than either alone.
