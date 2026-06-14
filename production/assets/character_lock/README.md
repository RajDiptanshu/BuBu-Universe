# Bubu Character Lock Pack v1

**Purpose:** This pack is the single production specification for Bubu's locked visual identity, used to generate and validate **Bubu_Master_v1, Bubu_Front_v1, Bubu_ThreeQuarter_v1, Bubu_Side_v1, Bubu_Happy_v1, Bubu_Curious_v1, Bubu_Surprised_v1**. Once these 7 assets are generated and approved, they become the permanent character-lock reference set for **Episodes 2-100** — every future episode's Bubu must be generated using these images (and/or this spec) as identity reference, with zero design drift.

---

## Single Source of Truth

This pack does not introduce any new design. It is a production-ready consolidation of:

1. **[`canon/bubu_core_identity_block.md`](../../../canon/bubu_core_identity_block.md)** — the locked v2 Identity Block (verbatim text below), the Trunk Rule rotation table, and Silhouette Validation.
2. **[`references/bubu_master_prompt.md`](../../../references/bubu_master_prompt.md)** and **[`references/bubu_reference_generation.md`](../../../references/bubu_reference_generation.md)** — the approved Episode 1 Bubu reference prompts (Master, Front, Three-Quarter, Side, Curious, Surprise, Delight).
3. **[`production/bubu_consistency_checklist.md`](../../bubu_consistency_checklist.md)** — the 7-category, 35-point scoring rubric used to validate every generated asset.

If any future document conflicts with this pack, **`canon/bubu_core_identity_block.md` wins** (per the Precedence Rule in `canon/bubu_project_canon.md`).

---

## Locked Visual Specification

### The v2 Locked Identity Block (verbatim — reuse unedited in every prompt)

```
Bubu, a baby elephant character with one fixed, instantly recognizable
silhouette: a single large rounded teardrop-shaped body with no visible
neck (head and body form one continuous rounded shape), two perfectly
circular flat-disc ears (~40% of head width each, like two identical
coins attached high and symmetrically on the head), and one short trunk
shaped like a thick, uniform-width "hook" — the same width along its
entire length with a softly rounded (never pointed, never tapering) tip,
never longer than the diameter of one ear, always exactly one smooth
curve.

Four short stubby cylinder legs, small rounded tail. Large round eyes
(~23% of face width, close together with about one eye-width gap between
them), each eye with one fixed white highlight dot, simple single-stroke
eyebrows, small closed-curve mouth. No tusks, no wrinkles, no skin
texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face
patch pale cream (#EAEFF2), inner ears soft pink (#F4B8C0), cheek blush
pink (#FBC7C7), eyes near-black (#2B2B2B) with white highlight (#FFFFFF).
A thin, soft, even outline in dark slate (#6B7C8C) traces Bubu's entire
silhouette — body, ears, trunk, legs, tail — separating Bubu from the
background at any image size.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean
flat color fills, minimal gradient shading, no harsh shadows, crisp clean
linework, vector-illustration quality.
```

Only the **pose / expression / camera angle / framing / background** sections around this block may change between the 7 assets below. The block itself is never paraphrased, shortened, or reordered.

### Locked Colors

| Element | Hex | Notes |
|---|---|---|
| Body skin | `#A9B7C4` | Soft gray-blue. Never brown, never flat neutral gray, never green. |
| Belly & face patch (cream) | `#EAEFF2` | Pale cream — also the master/front/side reference background color. |
| Inner ears | `#F4B8C0` | Soft pink. **Hidden** in Curious/Focused poses; **visible** only when ears are popped/flapped outward (Surprise, Delight). |
| Cheek blush | `#FBC7C7` | Pink, present in every expression. |
| Eyes | `#2B2B2B` | Near-black, with one fixed `#FFFFFF` highlight dot per eye. |
| Outline | `#6B7C8C` | Dark slate. Thin, soft, even — traces the *entire* silhouette (body, ears, trunk, legs, tail) in every asset, every pose. |

### Trunk Shape — "The Hook" (one shape, four rotations)

Bubu has **exactly one trunk shape**: a short, thick, uniform-width hook with a softly rounded (never pointed, never tapering) tip, never longer than the diameter of one ear, always exactly one smooth curve. Every pose is **this same hook, rotated** — never a different shape.

| Beat | Pose Name | Hook Rotation (from rest) | Tip Points Toward |
|---|---|---|---|
| Hello / Loop | Curious (rest) | 0° — default resting orientation | Down, toward the mouth/chest |
| Build | Focused | ~90°, rotated forward | Horizontally, toward the object-zone |
| Anticipation | Surprise | ~180°, rotated up | Straight up, away from the face |
| Payoff | Delight / Happy | ~215-225°, rotated up and back | Up and back, toward the near ear |

Standard phrasing for any trunk description:

> "trunk shaped like Bubu's signature hook — short, uniform thickness, rounded tip, one smooth curve, no longer than one ear's diameter — rotated to [point down toward the mouth / point forward toward the object / point straight up / point up and back toward the ear]."

### Eye Shape

- Large round eyes, **~23% of face width** each.
- Close together — about **one eye-width gap** between them.
- Each eye has exactly **one fixed white highlight dot** (`#FFFFFF`).
- Eye color: `#2B2B2B` (near-black).
- In Delight only, eyes become **closed happy crescents** (upward-curving lines, never fully absent/blank).
- Both eyes must always be the **same size** and sit at the **same height** — asymmetric eye size/height is a hard fail.

### Ear Proportions

- **Two perfectly circular flat-disc ears**, ~40% of head width each — "like two identical coins."
- Attached **high and symmetrically** on the head, same size, same horizontal line.
- Outer surface = body color (`#A9B7C4`); inner surface = `#F4B8C0` pink, visible **only** when ears are popped/flapped outward (Surprise, Delight) — never visible in Curious/Focused.
- Never oval, leaf-shaped, floppy, drooping, or "Dumbo"-style. The circular shape itself never changes — only its angle/visibility of the inner pink does.

### Cheek Color

- `#FBC7C7` (pink blush), present on both cheeks in every pose and every expression. Never omitted, never a different hue.

### Cream Belly Patch

- `#EAEFF2` — the same pale cream used for the master/front/side reference backgrounds.
- Covers the belly and face patch as one continuous lighter area against the `#A9B7C4` body color.
- Patch shape and placement must remain consistent across all 7 assets — it is part of the silhouette/color identity, not a background element.

### Outline

- `#6B7C8C`, thin, soft, even — traces the **entire** silhouette (body, ears, trunk, legs, tail) in **every** asset.
- Must be present, must be a single consistent weight on both left and right sides, and must clearly separate the far ear from the head in 3/4 views.

---

## Forbidden Variations (applies to all 7 assets)

Any of the following is an automatic fail and must be regenerated:

**Anatomy / Silhouette**
- Tusks (highest-risk failure across the whole system)
- Wrinkles, skin texture, toenails
- A second character, parent/adult elephant, or "baby and mother" pairing
- Extra limbs, extra ears, missing ear, one ear only (except the intentional single-ear case in `Bubu_Side_v1`)
- A visible neck / break between head and body
- Adult elephant proportions (smaller head, longer trunk/legs) — must stay two-heads-tall, head = 50% of total height

**Ears**
- Oval, leaf-shaped, floppy, drooping, or mismatched-size ears
- Pink inner ear visible in Curious/Focused poses
- Ears not popped / asymmetrical pop in Surprise or Delight

**Trunk**
- Any shape other than the hook: tapering trunk, pointed tip, hose-like trunk, segmented trunk, multiple bends, S-curve, spiral, or closed/trumpet loop
- Trunk longer than one ear's diameter
- Trunk rotation that doesn't match the pose's locked rotation value (see table above)

**Color**
- Body color drifting toward brown, flat neutral gray, or green
- Any hex substitution for body/belly/inner ear/cheek/eye/outline colors
- Missing or wrong-color outline (`#6B7C8C`); thick black outline; no outline at all

**Expression**
- Visible teeth, tongue, open mouth showing teeth
- Sad, angry, frowning, or neutral-flat expressions outside the 4 locked expressions (Curious, Focused, Surprise, Delight)
- Asymmetric features other than Focused's single lowered eyebrow

**Style / Composition**
- Realistic, photoreal, photographic, 3D-render, Pixar-style, or Disney-style rendering
- Harsh shadows, heavy gradients, painterly shading
- Text, watermark, signature, logos
- Multiple views, turnaround sheets, collages, grids (each asset is one single image)
- Cropped or partial body — full body head-to-feet required in all 7 assets
- Camera tilt, zoom, motion blur

---

## The 7 Locked Assets

### 1. Bubu_Master_v1

**Role:** The canonical reference image. Every other asset in this pack (and every future episode generation) is produced using this image as the character-lock/reference input.

- **Exact pose:** Neutral standing pose, full body, head-to-feet, two-heads-tall proportions, trunk = hook at 0° resting orientation (tip pointing down toward the mouth, hanging near the chest).
- **Exact expression:** Curious (default/rest) — soft raised eyebrows, gentle closed-curve smile, both eyes open with white highlight dots.
- **Camera angle:** Straight-on, eye level, character centered.
- **Framing:** Square 1:1, full body visible head to feet, character centered on a plain background.

**Image generation prompt:**
```
Character reference sheet, single character, full body, neutral standing
pose, plain soft pastel cream background (#EAEFF2), no other objects, no
scenery, no shadows.

[Insert the v2 Locked Identity Block verbatim here]

Two-heads-tall baby proportions (head is 50% of total height). In this
reference image the hook trunk is at its resting (0 degree) orientation:
tip pointing down toward the mouth, hanging near the chest. Soft raised
eyebrows, small closed-curve smile ("Curious" expression, default/rest
state). Inner ear pink (#F4B8C0) visible only at ear edges in this neutral
pose.

Square 1:1 composition, character centered, full body visible head to feet.
```

**Negative prompt:**
```
tusks, wrinkles, skin texture, toenails, floppy ears, drooping ears, oval
ears, leaf-shaped ears, mismatched ear sizes, asymmetrical ears, long trunk,
tapering trunk, pointed trunk tip, segmented trunk, multiple bends, curled
S-shape trunk, trunk longer than one ear, hose-like trunk, no outline, thick
black outline, harsh black outline, outline color mismatch, realistic
elephant, photoreal, photographic, 3D render, Pixar style, Disney style,
adult elephant, second character, parent elephant, baby and mother,
background scenery, props, shadows, ground line, text, watermark, signature,
multiple views, turnaround sheet, collage, grid, mismatched eye sizes,
visible teeth, tongue, sad expression, angry expression, brown body color,
gray body color (flat neutral), green body color
```

**Consistency requirements:**
- Score against all 7 `bubu_consistency_checklist.md` categories (Silhouette, Trunk, Ear, Color, Expression, Toddler Appeal, Thumbnail Readability); this asset should score **at or near 35/35** since it defines the baseline.
- Run the black-silhouette-on-white test (per Silhouette Validation in `bubu_core_identity_block.md`): two equal ear circles, one hook-trunk distinct from the legs, single rounded teardrop body with no neck break, no extra shapes.
- Run the ~120px thumbnail test: ear circles and hook trunk must remain distinguishable from the outline at that size.
- **Lock the seed** used to produce the approved result — reuse this seed + this exact prompt as the canonical Bubu reference for all downstream assets and all future episodes.

---

### 2. Bubu_Front_v1

**Role:** Symmetry QA reference. Secondary identity reference alongside the Master image — not used directly in episode frames.

- **Exact pose:** Straight-on front view, perfectly symmetrical, full body head-to-feet, standing, head held level (not tilted, not turned). Trunk = hook at 0°, hanging centered directly below the face, tip pointing straight down (not curving left or right).
- **Exact expression:** Curious — soft raised eyebrows, gentle closed-curve smile, both eyes equal size and equidistant from the vertical centerline.
- **Camera angle:** Eye level, dead-on front view (0° turn).
- **Framing:** Square 1:1, character centered exactly on the vertical midline, full body head-to-feet.

**Image generation prompt:**
```
Using the Bubu_Master_v1 image as character reference (or the Master Prompt
description if no reference image is available):

[Insert the v2 Locked Identity Block verbatim here]

Straight-on front view, perfectly symmetrical, camera at eye level, full
body visible head to feet, standing pose, head held level (not tilted, not
turned). Two perfectly circular ears positioned identically on both sides of
the head and equidistant from the vertical center line. Trunk shown as the
hook at its 0 degree resting orientation, hanging centered directly below
the face, tip pointing straight down, not curving left or right. Both eyes
equal size and equidistant from the vertical center line. "Curious"
expression (soft raised eyebrows, gentle closed-curve smile). Inner ear pink
(#F4B8C0) not visible in this relaxed pose.

Plain soft pastel cream background (#EAEFF2), no shadows, no props, square
1:1 composition, character centered exactly on the vertical midline.
```

**Negative prompt:**
```
head turned, tilted head, asymmetrical ears, mismatched ear sizes, oval ears,
leaf-shaped ears, off-center trunk, trunk curving to one side, tapering
trunk, pointed trunk tip, trunk longer than one ear, uneven eyes, different
sized eyes, eyes at different heights, visible teeth, tongue, open mouth, 3/4
view, side view, profile, back view, multiple characters, cropped body,
partial body, extra limbs, tusks, wrinkles, photoreal, text, watermark, no
outline, uneven outline thickness, thick black outline
```

**Consistency requirements:**
- Reference image: Bubu_Master_v1, identity strength 0.7-0.9.
- Score categories Silhouette, Trunk, Ear, Color, Toddler Appeal against the checklist — pass = ≥28/35, no category <3.
- Primary QA check: **left-right symmetry** — both ears identical in size/position, both eyes identical in size/position, trunk perfectly centered and vertical. Over-generate 4-6 variations and pick the best-symmetry result.
- This image is **QA-only** — never used directly in an episode frame.

---

### 3. Bubu_ThreeQuarter_v1

**Role:** The **production-default angle**. Once approved, this becomes the second character-lock/pose reference (alongside Bubu_Master_v1) for all in-episode generations, including Bubu_Curious_v1, Bubu_Happy_v1, and Bubu_Surprised_v1 below.

- **Exact pose:** Three-quarter front view, head and body turned approximately 30-35° from camera, favoring Bubu's right side. Full body, standing. Trunk = hook at 0°, curving gently toward the camera-near side, tip pointing down toward the chest.
- **Exact expression:** Curious — soft raised eyebrows, gentle closed-curve smile, both eyes visible (far eye slightly smaller due to perspective), each with a white highlight dot.
- **Camera angle:** 30-35° turn from front-on (three-quarter view) — never exceeding 45°, never reaching profile.
- **Framing:** Vertical 9:16, character occupying 40-55% of frame height, eyes at ~40% from top, positioned center or center-left, soft pastel meadow background (saturation 0.20-0.35, max 2 background shapes).

**Image generation prompt:**
```
Using the Bubu_Master_v1 image as character reference:

[Insert the v2 Locked Identity Block verbatim here]

Three-quarter front view (head and body turned approximately 30-35 degrees
from camera, favoring the character's right side), full body visible head to
feet, standing pose. Near ear fully visible and slightly larger due to
perspective; far ear visible as a circle partially behind the head
silhouette, not hidden. Trunk shown as the hook at its 0 degree resting
orientation, curving gently toward the camera-near side, tip pointing down
toward the chest. "Curious" expression (soft raised eyebrows, gentle
closed-curve smile, both eyes visible, far eye slightly smaller due to
perspective, each with one fixed white highlight dot). Inner ear pink
(#F4B8C0) not visible in this relaxed pose. Outline includes a clear
separating line between the far ear and the head.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

**Negative prompt:**
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

**Consistency requirements:**
- Reference image: Bubu_Master_v1, identity strength 0.7-0.9.
- Full 7-category checklist score, ≥28/35, no category <3 — including the new "far ear visible behind head" requirement under Ear.
- If turn angle drifts toward profile across a batch, restate "30-35 degrees, not profile" rather than relying on the reference image alone.
- Once approved, this image is promoted to a **second character-lock reference** for Bubu_Curious_v1, Bubu_Happy_v1, and Bubu_Surprised_v1.

---

### 4. Bubu_Side_v1

**Role:** Silhouette/QA reference only. **Not used in episode frames** — Episode generations (per `episodes/episode_01_bubus_splash/image_prompts.md`'s shared negative prompt) explicitly exclude side/profile/back views. This asset exists solely to validate the hook trunk and ear circle in profile, isolated from production composition rules.

- **Exact pose:** Full profile side view, exactly 90° from camera, facing left, full body, standing. Trunk = hook at 0°, seen fully in profile, hanging near the mouth, tip not extending past the front legs.
- **Exact expression:** Curious — soft raised eyebrow, gentle closed-curve smile, near eye visible with white highlight dot. Far eye and far ear not visible at this angle.
- **Camera angle:** Exactly 90° (full profile).
- **Framing:** Square 1:1, character centered, full body head-to-feet, plain cream background.

**Image generation prompt:**
```
Using the Bubu_Master_v1 image as character reference:

[Insert the v2 Locked Identity Block verbatim here]

Full profile side view (exactly 90 degrees from camera, facing left), full
body visible head to feet, standing pose. One perfectly circular ear visible
(~40% of head width, like a single coin) — the far ear and far eye not
visible at this angle. Trunk shown as the hook at its 0 degree resting
orientation, seen fully in profile, hanging near the mouth, tip not
extending past the front legs. "Curious" expression (soft raised eyebrow,
gentle closed-curve smile, near eye visible with one fixed white highlight
dot). Inner ear pink (#F4B8C0) not visible in this relaxed pose.

Plain soft pastel cream background (#EAEFF2), no shadows, no props, square
1:1 composition, character centered exactly on the frame, full body visible
head to feet.
```

**Negative prompt:**
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

**Consistency requirements:**
- Reference image: Bubu_Master_v1, identity strength 0.7-0.9. Extra weight on "no tusks" — profile is the highest tusk-risk angle.
- After generation, produce a **pure black silhouette** version and confirm the ear circle, hook trunk, and teardrop body are each independently identifiable (Silhouette category).
- **This asset is QA-only.** It must never be used as a pose reference for an in-episode frame, and its existence does not relax the "no side/profile/back view" exclusion in episode-level negative prompts.

---

### 5. Bubu_Happy_v1

**Role:** The **Delight / Payoff-beat** expression — Bubu's celebratory reaction at the moment of discovery. (Named "Happy" in this pack; corresponds to "Delight" in `bubu_core_identity_block.md` and `bubu_personality_bible.md`.)

- **Exact pose:** Three-quarter front view (30-35°, favoring Bubu's right side), full body, standing, body leaning slightly backward in a celebratory posture, one front foot lifted slightly off the ground in a small hop (other three feet grounded). Trunk = hook rotated ~215-225° up and back, tip pointing up and back toward the near ear — same hook shape, single smooth curve, not a loop.
- **Exact expression:** Delight/Happy — eyes scrunched into closed happy crescent shapes (visible as upward-curving lines, not absent), mouth in a wide open smile with closed-curve outline (no teeth, no tongue). Both ears flapped outward, revealing `#F4B8C0` inner-ear pink on both (circular shape unchanged, only angle/visibility changes).
- **Camera angle:** Three-quarter front, 30-35° turn (same as Bubu_ThreeQuarter_v1).
- **Framing:** Vertical 9:16, character occupying 40-55% of frame height, eyes at ~40% from top, center/center-left, soft pastel meadow background (saturation 0.20-0.35, max 2 background shapes, payoff object at peak saturation if present).

**Image generation prompt:**
```
Using the Bubu_Master_v1 image and the Bubu_ThreeQuarter_v1 image as
character and pose reference:

[Insert the v2 Locked Identity Block verbatim here]

Three-quarter front view (head and body turned approximately 30-35 degrees
from camera, favoring the character's right side), full body visible head to
feet, standing pose, body leaning slightly backward in a celebratory
posture, one front foot lifted slightly off the ground in a small hop (the
other three feet remain grounded).

Both ears flapped outward away from the head, revealing soft pink inner-ear
color (#F4B8C0) on both — the circular ear shape itself unchanged, only its
angle/visibility changes. 'Delight'/Happy expression: eyes scrunched into
happy closed crescent shapes (visible as upward-curving lines, not absent),
mouth in a wide open smile with a closed-curve outline (no teeth, no
tongue). Trunk shown as the same hook shape rotated approximately 215-225
degrees from its resting orientation — tip pointing up and back toward the
near ear, still a single smooth curve with a rounded tip, not forming a
loop or second bend. Outline keeps the rotated trunk hook visually distinct
from the ear circles near the top of the head.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

**Negative prompt:**
```
eyes fully closed, no visible eyes, closed eyes, trunk straight up, trunk
pointing up without backward angle, trunk converging with surprise pose,
closed loop trunk, trumpet loop, spiral trunk, multiple bends, segmented
trunk, trunk curling back on itself, tapering trunk, pointed trunk tip, trunk
longer than one ear, oval ears, leaf-shaped ears, visible teeth, tongue, open
mouth showing teeth, both feet off ground, full jump, falling, unbalanced
pose, forward lean, one ear only, asymmetrical ears, sad expression, neutral
expression, frowning, no outline, thick black outline, profile view, side
view, back view, cropped, partial body
```

**Consistency requirements:**
- Reference images: Bubu_Master_v1 (identity, strength 0.6-0.8) + Bubu_ThreeQuarter_v1 (pose/angle, strength ~0.5).
- Full 7-category checklist, ≥28/35, no category <3 — Expression category must confirm crescent eyes + open smile + 215-225° hook rotation simultaneously.
- The rotated-hook trunk is the **highest-priority element to verify**: must read as the same hook as Curious/Surprised, only rotated — never a straight raise (too close to Surprised) and never a loop/spiral. If rotation doesn't read clearly, push the stated angle (e.g., 240-250°) rather than adding descriptive words.
- Both ears must pop **symmetrically** with matching `#F4B8C0` visible on both — asymmetric pop is a sampling-variance fail; regenerate, don't re-prompt.

---

### 6. Bubu_Curious_v1

**Role:** The **Hello / Loop-beat** expression — Bubu's default rest state. Appears at the start and end of every episode (the loop point), and is the pose used in the mandatory BUBU! Brand Sting per `bubu_personality_bible.md` §7.

- **Exact pose:** Three-quarter front view (30-35°, favoring Bubu's right side), full body, standing, head held level (not tilted), facing toward the object-zone third of the frame. Trunk = hook at 0° resting orientation, tip pointing down toward the chest, with a slight forward sway (still-image only; sway belongs in the video prompt, not this image prompt).
- **Exact expression:** Curious — wide round eyes with soft raised eyebrows (both eyes visible, far eye slightly smaller due to perspective, each with a white highlight dot), small closed-curve smile. Ears relaxed and facing forward, outer body-color side visible, pink inner ear **not** shown.
- **Camera angle:** Three-quarter front, 30-35° turn (same as Bubu_ThreeQuarter_v1).
- **Framing:** Vertical 9:16, character occupying 40-55% of frame height, eyes at ~40% from top, center/center-left, soft pastel meadow background (saturation 0.20-0.35, max 2 background shapes).

**Image generation prompt:**
```
Using the Bubu_Master_v1 image and the Bubu_ThreeQuarter_v1 image as
character and pose reference:

[Insert the v2 Locked Identity Block verbatim here]

Three-quarter front view (head and body turned approximately 30-35 degrees
from camera, favoring the character's right side), full body visible head to
feet, standing pose, head held level (not tilted), facing toward the
object-zone third of the frame.

Near ear fully visible, far ear visible as a circle partially behind the
head silhouette. 'Curious' expression: wide round eyes with soft raised
eyebrows (both eyes visible, far eye slightly smaller due to perspective,
each with one fixed white highlight dot), ears relaxed and facing forward
(outer body-color side visible, pink inner ear NOT shown), trunk shown as
the hook at its 0 degree resting orientation — tip pointing down toward the
chest, with a slight forward sway — small closed-curve smile.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

**Negative prompt:**
```
head tilted, tilted head, walking pose, raised leg, stepping, surprised
expression, wide open eyes, open mouth, visible teeth, tongue, pink ear
interior visible, ears popped outward, oval ears, leaf-shaped ears, trunk
raised, trunk extended toward object, trunk rotated forward, tapering trunk,
pointed trunk tip, trunk longer than one ear, frowning, flat mouth, neutral
mouth, closed eyes, looking away, looking down, looking up, no outline, thick
black outline, profile view, side view, back view, cropped, partial body
```

**Consistency requirements:**
- Reference images: Bubu_Master_v1 (identity, strength 0.6-0.8) + Bubu_ThreeQuarter_v1 (pose/angle, strength 0.4-0.6).
- Full 7-category checklist, ≥28/35, no category <3.
- Because this expression bookends every episode (Beats 1 and 5) and anchors the Brand Sting, treat the approved result as a **second-tier character-lock reference for loop-point consistency** across Episodes 2-100.
- If "slight forward sway" introduces unwanted motion artifacts in a still image, drop it from this image prompt — it belongs only in the corresponding video prompt.

---

### 7. Bubu_Surprised_v1

**Role:** The **Anticipation-beat** expression — the brief "held-breath" bridge between Curious and Happy. Per `bubu_personality_bible.md` §3, must never exceed ~2 seconds of screen time and is never a destination emotion.

- **Exact pose:** Three-quarter front view (30-35°, favoring Bubu's right side), full body, standing, body weight centered and still — a held-breath pause pose, no stepping or leaning. Trunk = hook rotated ~180° up, tip pointing straight up and very slightly forward, all other motion still.
- **Exact expression:** Surprise — both eyebrows raised high, both eyes wide open (far eye slightly smaller due to perspective, each with a white highlight dot), mouth in a small open "o" shape (no teeth, no tongue). Both ears popped fully outward, revealing `#F4B8C0` inner-ear pink on both (circular shape unchanged, only angle/visibility changes).
- **Camera angle:** Three-quarter front, 30-35° turn (same as Bubu_ThreeQuarter_v1).
- **Framing:** Vertical 9:16, character occupying 40-55% of frame height, eyes at ~40% from top, center/center-left, soft pastel meadow background (saturation 0.20-0.35, max 2 background shapes).

**Image generation prompt:**
```
Using the Bubu_Master_v1 image and the Bubu_ThreeQuarter_v1 image as
character and pose reference:

[Insert the v2 Locked Identity Block verbatim here]

Three-quarter front view (head and body turned approximately 30-35 degrees
from camera, favoring the character's right side), full body visible head to
feet, standing pose, body weight centered and still — a held-breath pause
pose, no stepping or leaning.

Both ears popped fully outward away from the head, revealing soft pink
inner-ear color (#F4B8C0) on both — the circular ear shape itself unchanged,
only its angle/visibility changes. 'Surprise' expression: both eyebrows
raised high, both eyes wide open (far eye slightly smaller due to
perspective, each with one fixed white highlight dot), mouth in a small open
"o" shape (no teeth, no tongue). Trunk shown as the same hook shape rotated
approximately 180 degrees from its resting orientation — tip pointing
straight up and very slightly forward, all other motion still. Outline
traces both popped-out ear circles individually.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

**Negative prompt:**
```
wide open mouth, visible teeth, tongue, one ear popped, asymmetrical ears,
pink visible on only one ear, ears not popped, oval ears, leaf-shaped ears,
trunk rotated 215 degrees, trunk pointing up and back, trunk in trumpet curl,
trunk forming closed loop, tapering trunk, pointed trunk tip, trunk longer
than one ear, stepping back, recoiling, raised leg, leaning away, jumping,
eyes closed, crescent eyes, smiling, frowning, no outline, thick black
outline, profile view, side view, back view, cropped, partial body
```

**Consistency requirements:**
- Reference images: Bubu_Master_v1 (identity, strength 0.6-0.8) + Bubu_ThreeQuarter_v1 (pose/angle, strength ~0.5).
- Full 7-category checklist, ≥28/35, no category <3.
- If both ears don't pop symmetrically, **regenerate rather than re-prompt** — this is sampling variance, not a wording issue.
- If the trunk rotation converges visually with Bubu_Happy_v1's rotation, push the stated angles further apart (e.g., "170 degrees" here vs. "230 degrees" for Happy) so the two poses remain visually distinct.

---

## Generation Workflow

Generate in this order — each asset feeds the next:

1. **Bubu_Master_v1** — generate 4-8 variations, run silhouette + thumbnail tests, lock seed, get approval.
2. **Bubu_Front_v1** and **Bubu_Side_v1** — generate using Bubu_Master_v1 as reference. QA-only; confirm symmetry (Front) and profile silhouette (Side).
3. **Bubu_ThreeQuarter_v1** — generate using Bubu_Master_v1 as reference. This becomes the production-default angle and second pose reference.
4. **Bubu_Curious_v1, Bubu_Happy_v1, Bubu_Surprised_v1** — generate using Bubu_Master_v1 + Bubu_ThreeQuarter_v1 as combined identity + pose reference.

All 7 approved images, plus this README, become the **Episode 2-100 character-lock reference set**. No episode may be produced using only text prompts if any of these 7 images exist and are approved — always supply the relevant image(s) as reference input alongside the text prompts above.

---

## Consistency Validation

Every one of the 7 assets must be scored against the 7 categories in `production/bubu_consistency_checklist.md` (Silhouette, Trunk, Ear, Color, Expression, Toddler Appeal, Thumbnail Readability), each 1-5:

- **Pass threshold:** ≥28/35 total, with **no category below 3**.
- **Target for this pack:** all 7 assets should score **near 35/35**, since they collectively define the baseline every future episode is checked against.
- Any asset that fails must be regenerated against this spec before being added to the lock set — never "fixed" by editing the spec to match a flawed image.

---

## Maintenance Rule (Episodes 2-100)

- This pack, once approved, is **locked**. Changes to colors, trunk shape, ear proportions, or any element in the Locked Visual Specification above require a deliberate canon update to `canon/bubu_core_identity_block.md` first (per the Precedence Rule), followed by a new version of this pack (`Bubu_*_v2`, etc.) and re-validation of all 7 assets.
- Episode 01 remains permanently grandfathered (per Canon Update Log entry 2026-06-14, item 7) and is **not** retroactively matched to this pack; an optional remaster is possible only after Episode 25, non-blocking.
- Every new episode (Episode 2 onward) must reference Bubu_Master_v1 and Bubu_ThreeQuarter_v1 (plus the relevant expression asset) as character-lock/pose inputs — text prompts alone are insufficient once this pack exists.
