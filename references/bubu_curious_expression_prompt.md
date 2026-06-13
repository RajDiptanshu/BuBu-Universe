# Bubu "Curious" Expression Prompt (v2 — Production-Ready)

The **default/rest expression** — appears at the start (Hello beat) and end (Loop beat) of every episode. Built on top of the three-quarter production view. Trunk pose: **hook at 0° (resting orientation)**.

**v2 supersedes v1.** Summary of changes (full panel critique in `bubu_core_identity_block.md`):

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | "Trunk in a gentle resting J curl... with a slight forward sway" was a one-off description, unrelated to the other three expressions' trunk poses. | Now explicitly "the hook at its 0° resting orientation" — the *same shape* as Focused/Surprise/Delight, just unrotated. Establishes Curious as the visual "home position" Bubu returns to. |
| Children's psychologist | Pink inner ears correctly excluded, but ear *shape* wasn't anchored, so "relaxed... forward-facing" ears could still vary in form between episodes. | Ears are now perfect circles, "facing forward" — same shape as every other prompt, removing one more source of frame-to-frame variation for the most-repeated expression. |
| AI image-gen expert | No outline — since this expression appears at both the opening and closing frame (the loop point), edge consistency between those two frames matters most here. | Added `#6B7C8C` outline; this is the expression where outline consistency is most load-bearing, since Beat 1 and Beat 5 are directly compared for the loop. |
| Thumbnail expert | This is the expression most likely to appear in a thumbnail (it's the "default" pose) but had no thumbnail-specific guidance. | Added a thumbnail note: Curious + outline + circle ears is the combination most viewers will recognize as "Bubu" at a glance — prioritize testing this expression at 120px first. |

---

## Exact Prompt (v2)

```
Using the Bubu master reference image and the Bubu three-quarter view
reference as character and pose reference:

Bubu the baby elephant, three-quarter front view (head and body turned
approximately 30-35 degrees from camera, favoring the character's right
side), full body visible head to feet, standing pose, head held level (not
tilted), facing toward the object-zone third of the frame.

Bubu's silhouette: a single large rounded teardrop-shaped body with no
visible neck, two perfectly circular flat-disc ears (~40% of head width
each, like two identical coins) — near ear fully visible, far ear visible as
a circle partially behind the head silhouette. One short trunk shaped like a
thick, uniform-width "hook" with a softly rounded tip, never longer than the
diameter of one ear.

'Curious' expression: wide round eyes with soft raised eyebrows (both eyes
visible, far eye slightly smaller due to perspective, each with one fixed
white highlight dot), ears relaxed and facing forward (outer body-color side
visible, pink inner ear NOT shown), trunk shown as the hook at its 0 degree
resting orientation — tip pointing down toward the chest, with a slight
forward sway — small closed-curve smile.

Four short stubby cylinder legs, small rounded tail. No tusks, no wrinkles,
no skin texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), cheek blush pink (#FBC7C7), eyes near-black (#2B2B2B)
with white highlight (#FFFFFF). A thin, soft, even outline in dark slate
(#6B7C8C) traces Bubu's entire silhouette.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, no harsh shadows.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

---

## Why Each Design Choice Improves Consistency

- **Built on the 3/4-view reference, not a fresh angle description** — since Curious is the most-used expression (start and end of every episode), it must be the most reliably reproducible; anchoring it to the already-approved production angle removes one variable.
- **"Hook at its 0 degree resting orientation"** — establishes Curious's trunk pose as Bubu's visual "home position." Every other expression's trunk is described as a rotation *away from* this position, and Curious is what Bubu's trunk returns *to* — reinforcing the loop conceptually as well as visually.
- **"Slight forward sway"** — gives image-to-video tools a clear, minimal motion cue for the Hello beat without implying a full walk or step, keeping the "static camera, single mover" rule from the visual style guide intact.
- **"Head held level (not tilted)"** — rules out the common "cute head-tilt" default that would otherwise creep into a "curious baby animal" prompt, keeping Curious visually distinct from a head-tilted alternative the model might prefer.
- **"Pink inner ear NOT shown"** — explicitly distinguishes Curious from Surprise/Delight, which are the only two expressions where pink ear interiors appear; this is one of the clearest binary signals for telling expressions apart at a glance.
- **The outline, called out here specifically because this expression bookends every episode** — if Beat 1 and Beat 5 are generated separately, matching outline treatment is one more thing that should make the loop feel seamless rather than like two different images.
- **Identical 9:16 framing values to the 3/4-view prompt** — since Curious appears at both the very start and very end of the episode (the loop point), consistent framing here is critical for the loop to feel seamless.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| Head tilted despite "head held level" | Strong "cute/curious" trope in training data defaults to a tilted head. | Unchanged from v1 — remains a known risk for this expression specifically. |
| Forward sway interpreted as a full walking pose or raised leg | "Slight sway" is a subtle motion cue that text-to-image models may exaggerate into a full action. | Unchanged — if this persists, move the sway description to the **video** prompt only (see Optimization Notes). |
| Eyebrows raised too high, blurring into "Surprise" | Curious and Surprise share "raised eyebrows" as a feature; without contrast cues the two can converge. | Unchanged from v1; "soft raised eyebrows" (Curious) vs. "raised high" (Surprise) is the intended contrast — if it's not enough, try "gently raised" for Curious. |
| Smile omitted or rendered as a flat/neutral mouth | "Small closed-curve smile" is a subtle feature easily lost among larger pose/angle instructions. | Unchanged from v1. |
| Pink inner ear color appears despite "not shown" | Models may default to showing inner ear color whenever ears are mentioned at all. | Unchanged from v1. |
| Trunk hook rendered at a slightly different rotation than the 3/4-view master (e.g. tip pointing forward instead of down) | "0 degree resting orientation" is a new, precise instruction — models may not yet have a strong prior for what "0 degrees" means for this specific shape. | If this drifts, fall back to the v1-style description as a *supplement*: "hanging in a relaxed curl near the mouth, tip pointing down" — combine both phrasings until the hook-rotation vocabulary is well-established across a generation batch. |

---

## Negative Prompt (v2)

```
head tilted, tilted head, walking pose, raised leg, stepping, surprised
expression, wide open eyes, open mouth, visible teeth, tongue, pink ear
interior visible, ears popped outward, oval ears, leaf-shaped ears, trunk
raised, trunk extended toward object, trunk rotated forward, tapering trunk,
pointed trunk tip, trunk longer than one ear, frowning, flat mouth, neutral
mouth, closed eyes, looking away, looking down, looking up, no outline, thick
black outline, profile view, side view, back view, cropped, partial body
```

---

## Optimization Notes for Image Generation Models

- Since this expression is reused at **both the opening and closing frame** of every episode, treat any approved Curious image as a second-tier character-lock reference (after the Master and 3/4-view images) for the highest possible consistency at the loop point.
- If the forward sway reads as too much motion in still images, omit it from the **image** prompt entirely and add it only to the corresponding **video** prompt — image prompts define appearance, video prompts define movement, per the production checklist.
- If eyebrows consistently render too high (drifting toward Surprise), try "softly raised" or "gently raised" instead of "raised" to reduce the magnitude.
- **Thumbnail priority**: because Curious is Bubu's "default face," it is the expression most likely to appear in thumbnails or be used as a profile/avatar image. Run the ~120px scale test on this expression first — if the circle-ear + hook-trunk + outline silhouette doesn't read as "Bubu" at thumbnail size here, it won't read well anywhere else either.
