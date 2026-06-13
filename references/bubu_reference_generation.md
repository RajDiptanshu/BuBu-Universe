# Bubu Reference Generation — Production Batch

Consolidated, ready-to-paste generation prompts for the 8-image Bubu reference set, built from `bubu_core_identity_block.md`, `character_bible.md`, and `prompt_library.md`. No design changes from the approved v2 identity (perfect-circle ears, "hook" trunk shape + rotation, `#6B7C8C` outline) — this file only assembles the final per-image prompts and generation settings.

---

## 1. Master Prompt

The canonical reference image. Every other image in this set is generated using this image as a character-lock/reference input.

**Positive Prompt:**
```
Character reference sheet, single character, full body, neutral standing
pose, plain soft pastel cream background (#EAEFF2), no other objects, no
scenery, no shadows.

Bubu, a baby elephant character with one fixed, instantly recognizable
silhouette: a single large rounded teardrop-shaped body with no visible
neck (head and body form one continuous rounded shape), two perfectly
circular flat-disc ears (~40% of head width each, like two identical coins
attached high and symmetrically on the head), and one short trunk shaped
like a thick, uniform-width "hook" — the same width along its entire length
with a softly rounded (never pointed, never tapering) tip, never longer than
the diameter of one ear, always exactly one smooth curve. In this reference
image the hook is at its resting (0 degree) orientation: tip pointing down
toward the mouth, hanging near the chest.

Two-heads-tall baby proportions (head is 50% of total height). Four short
stubby cylinder legs, small rounded tail. Large round eyes (~23% of face
width, close together with about one eye-width gap between them), each eye
with one fixed white highlight dot, simple single-stroke eyebrows raised
slightly, small closed-curve smile. No tusks, no wrinkles, no skin texture,
no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), inner ears soft pink (#F4B8C0, visible only at ear
edges in this neutral pose), cheek blush pink (#FBC7C7), eyes near-black
(#2B2B2B) with white highlight (#FFFFFF). A thin, soft, even outline in dark
slate (#6B7C8C) traces Bubu's entire silhouette — body, ears, trunk, legs,
tail — clearly separating Bubu from the background.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, minimal gradient shading, soft even lighting, no harsh shadows,
crisp clean linework, vector-illustration quality. Square 1:1 composition,
character centered, full body visible head to feet, "Curious" expression
(default/rest state).
```

**Negative Prompt:**
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

**Recommended Aspect Ratio:** 1:1 (square)

**Recommended Model Settings:**
- Generate **4-8 variations** at default settings; no reference image yet (this is the source image).
- Guidance/CFG scale: **7-9** — high enough to enforce numeric proportions and "no tusks," not so high that flat-color fills get noisy.
- Steps: **30-50** (diffusion models).
- Use the dedicated negative-prompt field if available; if not, append `Avoid: ` + the negative list to the end of the positive prompt.
- Once a result is selected: **lock its seed**. This seed + this exact prompt text becomes the canonical "Bubu" reference for all future generations.

---

## 2. Variants

### 2.1 Front View

**Positive Prompt:**
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

**Negative Prompt:**
```
head turned, tilted head, asymmetrical ears, mismatched ear sizes, oval ears,
leaf-shaped ears, off-center trunk, trunk curving to one side, tapering
trunk, pointed trunk tip, trunk longer than one ear, uneven eyes, different
sized eyes, eyes at different heights, visible teeth, tongue, open mouth, 3/4
view, side view, profile, back view, multiple characters, cropped body,
partial body, extra limbs, tusks, wrinkles, photoreal, text, watermark, no
outline, uneven outline thickness, thick black outline
```

**Recommended Aspect Ratio:** 1:1 (square)

**Recommended Model Settings:**
- Reference image: **Bubu master image**, identity/reference strength **0.7-0.9**; let pose/angle follow the text (front view).
- Guidance/CFG scale: **7-9**.
- Over-generate **4-6 variations**, pick the result with the best left-right symmetry.
- QA-only image — not fed into production frames, but may be used as a secondary identity reference alongside the master image.

---

### 2.2 Three-Quarter View

**Positive Prompt:**
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

**Negative Prompt:**
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

**Recommended Aspect Ratio:** 9:16 (vertical)

**Recommended Model Settings:**
- Reference image: **Bubu master image**, identity strength **0.7-0.9**.
- Guidance/CFG scale: **7-9**.
- This is the **production-default angle** — once approved, this image becomes a second character-lock/pose reference (alongside the master image) for the four expression variants below.
- If turn angle drifts wider toward profile across a batch, restate "30-35 degrees, not profile" in the prompt rather than relying on the reference image alone.

---

### 2.3 Side View

**Positive Prompt:**
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

**Negative Prompt:**
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

**Recommended Aspect Ratio:** 1:1 (square)

**Recommended Model Settings:**
- Reference image: **Bubu master image**, identity strength **0.7-0.9**.
- Guidance/CFG scale: **7-9**, with extra weight on "no tusks" — profile is the highest tusk-risk angle.
- After generation, also produce a **pure black silhouette** version (solid fill, no internal detail) and confirm the ear circle, hook trunk, and teardrop body are each independently identifiable — this is the "identifiable without color" validation, scored under Silhouette Accuracy.
- QA-only image — not used in production frames.

---

### 2.4 Curious (Hello / Loop beat)

Trunk pose: **hook at 0° (resting orientation)**.

**Positive Prompt:**
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

**Negative Prompt:**
```
head tilted, tilted head, walking pose, raised leg, stepping, surprised
expression, wide open eyes, open mouth, visible teeth, tongue, pink ear
interior visible, ears popped outward, oval ears, leaf-shaped ears, trunk
raised, trunk extended toward object, trunk rotated forward, tapering trunk,
pointed trunk tip, trunk longer than one ear, frowning, flat mouth, neutral
mouth, closed eyes, looking away, looking down, looking up, no outline, thick
black outline, profile view, side view, back view, cropped, partial body
```

**Recommended Aspect Ratio:** 9:16 (vertical)

**Recommended Model Settings:**
- Reference images: **Bubu master image** (identity, strength 0.6-0.8) + **approved 3/4 view image** (pose/angle, strength 0.4-0.6) where dual references are supported.
- Guidance/CFG scale: **7-9**.
- This expression bookends every episode (Beat 1 and Beat 5) — once approved, treat as a second-tier character-lock reference for loop-point consistency.
- If "slight forward sway" causes unwanted motion in still images, drop it from the image prompt and add it only to the corresponding video prompt.

---

### 2.5 Focused (Build beat)

Trunk pose: **hook rotated ~90° forward**.

**Positive Prompt:**
```
Using the Bubu master reference image and the Bubu three-quarter view
reference as character and pose reference:

Bubu the baby elephant, three-quarter front view (head and body turned
approximately 30-35 degrees from camera, favoring the character's right
side), full body visible head to feet, standing pose, body leaning slightly
forward toward the object-zone third of the frame.

Bubu's silhouette: a single large rounded teardrop-shaped body with no
visible neck, two perfectly circular flat-disc ears (~40% of head width
each, like two identical coins) — near ear fully visible, far ear visible as
a circle partially behind the head silhouette. One short trunk shaped like a
thick, uniform-width "hook" with a softly rounded tip, never longer than the
diameter of one ear.

'Focused' expression: one eyebrow very slightly lowered (the only asymmetric
facial feature in Bubu's expression set), both eyes steady and open, each
with one fixed white highlight dot, ears still and forward-facing (pink
inner ear NOT shown), trunk shown as the same hook shape rotated
approximately 90 degrees forward from its resting orientation — tip pointing
horizontally toward the object in the object-zone third of the frame, the
hook's rounded tip remaining open and rounded (not wrapped around the
object, not gripping), small closed-curve neutral mouth.

Four short stubby cylinder legs, small rounded tail. No tusks, no wrinkles,
no skin texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), cheek blush pink (#FBC7C7), eyes near-black (#2B2B2B)
with white highlight (#FFFFFF). A thin, soft, even outline in dark slate
(#6B7C8C) traces Bubu's entire silhouette, including a clear separating line
between the trunk's hook shape and the object it points toward.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, no harsh shadows.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

**Negative Prompt:**
```
both eyebrows lowered, angry expression, scowling, both eyebrows raised,
surprised expression, trunk wrapped around object, trunk curled around
object, trunk with multiple bends, segmented trunk, trunk lengthening,
tapering trunk, pointed trunk tip, trunk longer than one ear, oval ears,
leaf-shaped ears, ears popped outward, pink ear interior visible, falling
pose, off-balance, wide stance, open mouth, smiling widely, teeth, tongue, no
outline, thick black outline, trunk merging with object, profile view, side
view, back view, cropped, partial body
```

**Recommended Aspect Ratio:** 9:16 (vertical)

**Recommended Model Settings:**
- Reference images: **Bubu master image** (identity, strength 0.6-0.8) + **approved Curious 3/4 image** (pose/angle, strength ~0.5).
- Guidance/CFG scale: **7-9**.
- When generating for a specific episode, add the actual payoff object into the object-zone third of the prompt so the trunk has a real target.
- Double-check left-right consistency of the lowered eyebrow against the 3/4-view reference — this is the only asymmetric expression.

---

### 2.6 Surprise (Anticipation beat)

Trunk pose: **hook rotated ~180° upward**.

**Positive Prompt:**
```
Using the Bubu master reference image and the Bubu three-quarter view
reference as character and pose reference:

Bubu the baby elephant, three-quarter front view (head and body turned
approximately 30-35 degrees from camera, favoring the character's right
side), full body visible head to feet, standing pose, body weight centered
and still — a held-breath pause pose, no stepping or leaning.

Bubu's silhouette: a single large rounded teardrop-shaped body with no
visible neck, two perfectly circular flat-disc ears (~40% of head width
each, like two identical coins), both popped fully outward away from the
head, revealing soft pink inner-ear color (#F4B8C0) on both — the circular
ear shape itself unchanged, only its angle/visibility changes. One short
trunk shaped like a thick, uniform-width "hook" with a softly rounded tip,
never longer than the diameter of one ear.

'Surprise' expression: both eyebrows raised high, both eyes wide open (far
eye slightly smaller due to perspective, each with one fixed white highlight
dot), mouth in a small open "o" shape (no teeth, no tongue), trunk shown as
the same hook shape rotated approximately 180 degrees from its resting
orientation — tip pointing straight up and very slightly forward, all other
motion still.

Four short stubby cylinder legs, small rounded tail. No tusks, no wrinkles,
no skin texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), inner ears soft pink (#F4B8C0), cheek blush pink
(#FBC7C7), eyes near-black (#2B2B2B) with white highlight (#FFFFFF). A thin,
soft, even outline in dark slate (#6B7C8C) traces Bubu's entire silhouette,
including both popped-out ear circles individually.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, no harsh shadows.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes), vertical 9:16 composition, character
occupying 40-55% of frame height, eyes at approximately 40% from top of
frame, positioned center or center-left.
```

**Negative Prompt:**
```
wide open mouth, visible teeth, tongue, one ear popped, asymmetrical ears,
pink visible on only one ear, ears not popped, oval ears, leaf-shaped ears,
trunk rotated 215 degrees, trunk pointing up and back, trunk in trumpet curl,
trunk forming closed loop, tapering trunk, pointed trunk tip, trunk longer
than one ear, stepping back, recoiling, raised leg, leaning away, jumping,
eyes closed, crescent eyes, smiling, frowning, no outline, thick black
outline, profile view, side view, back view, cropped, partial body
```

**Recommended Aspect Ratio:** 9:16 (vertical)

**Recommended Model Settings:**
- Reference images: **Bubu master image** (identity, strength 0.6-0.8) + **approved Curious 3/4 image** (pose/angle, strength ~0.5).
- Guidance/CFG scale: **7-9**.
- If both ears don't pop symmetrically, regenerate rather than re-prompt — this is sampling variance, not a wording issue.
- If the trunk pose converges with Delight's, push the stated rotation further apart (e.g. "170 degrees" here vs. "230 degrees" for Delight).

---

### 2.7 Delight (Payoff beat)

Trunk pose: **hook rotated ~215-225° up and back** (same hook shape, not a closed loop).

**Positive Prompt:**
```
Using the Bubu master reference image and the Bubu three-quarter view
reference as character and pose reference:

Bubu the baby elephant, three-quarter front view (head and body turned
approximately 30-35 degrees from camera, favoring the character's right
side), full body visible head to feet, standing pose, body leaning slightly
backward in a celebratory posture, one front foot lifted slightly off the
ground in a small hop (the other three feet remain grounded).

Bubu's silhouette: a single large rounded teardrop-shaped body with no
visible neck, two perfectly circular flat-disc ears (~40% of head width
each, like two identical coins), both flapped outward away from the head,
revealing soft pink inner-ear color (#F4B8C0) on both — the circular ear
shape itself unchanged, only its angle/visibility changes. One short trunk
shaped like a thick, uniform-width "hook" with a softly rounded tip, never
longer than the diameter of one ear.

'Delight' expression: eyes scrunched into happy closed crescent shapes
(visible as upward-curving lines, not absent), mouth in a wide open smile
with a closed-curve outline (no teeth, no tongue), trunk shown as the same
hook shape rotated approximately 215-225 degrees from its resting orientation
— tip pointing up and back toward the near ear, still a single smooth curve
with a rounded tip, not forming a loop or second bend.

Four short stubby cylinder legs, small rounded tail. No tusks, no wrinkles,
no skin texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face patch
pale cream (#EAEFF2), inner ears soft pink (#F4B8C0), cheek blush pink
(#FBC7C7), eyes near-black (#2B2B2B). A thin, soft, even outline in dark
slate (#6B7C8C) traces Bubu's entire silhouette, keeping the rotated trunk
hook visually distinct from the ear circles near the top of the head.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean flat
color fills, no harsh shadows.

Soft pastel meadow background (pale sky and ground, saturation 0.20-0.35,
maximum 2 simple background shapes, payoff object at peak saturation),
vertical 9:16 composition, character occupying 40-55% of frame height, eyes
at approximately 40% from top of frame, positioned center or center-left.
```

**Negative Prompt:**
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

**Recommended Aspect Ratio:** 9:16 (vertical)

**Recommended Model Settings:**
- Reference images: **Bubu master image** (identity, strength 0.6-0.8) + **approved Curious 3/4 image** (pose/angle, strength ~0.5).
- Guidance/CFG scale: **7-9**.
- The rotated-hook trunk is the highest-priority element to verify — confirm it reads as the same hook as the other poses, just pointing up and back, not a straight raise (too close to Surprise) and not a loop/spiral.
- If the rotation doesn't read clearly, push the stated angle further (e.g. 240-250°) rather than adding descriptive words.

---

## 3. First Image to Generate

**Generate first: the Master Prompt (Section 1).**

## Why This Is the Best First Validation Image

1. **Every other prompt in this set depends on it.** All 7 variants explicitly reference "the Bubu master reference image" as character-lock input. Until this image exists and is approved, every other prompt is operating on text-only descriptions — the least consistent mode for any of these tools.

2. **It contains every identity-defining element at once, in its simplest form.** Circle ears, hook trunk at 0°, the new `#6B7C8C` outline, the full color palette, and the core proportions (two-heads-tall, egg body) are all present in a single neutral pose with no angle, expression, or background complexity competing for attention. If any of these fail here, they will fail everywhere — better to find out on the simplest possible image.

3. **It is the cheapest place to catch the highest-risk failures.** Tusks, ear shape, trunk taper, and outline rendering are the four most likely points of failure across the whole system. A plain 1:1 neutral pose isolates these completely from pose/angle/expression variables, so failures are unambiguous and fixes are cheap (regenerate one simple image vs. discovering the same issue across 7 derived images).

4. **It sets the seed and reference baseline for the entire batch.** Locking a seed and an approved image here means Front, 3/4, Side, and all four expressions can be generated with a consistent identity anchor — generating any other image first would mean re-doing that anchoring work once the master image is finally approved.

5. **It validates the v2 changes specifically.** This is the first image generated under the new identity block (circle ears, hook trunk, outline) — confirming it works here, on the simplest composition, is the fastest way to know whether the v2 system as a whole is viable before investing in the other 7 generations.
