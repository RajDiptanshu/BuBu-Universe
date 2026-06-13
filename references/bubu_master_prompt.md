# Bubu Master Prompt (v2 — Production-Ready)

This is the **canonical reference image prompt** — the single source-of-truth render used to anchor Bubu's design before any view-angle or expression variants are generated. All other reference prompts (front/3-quarter/side/expressions) should be generated using this image as a character-lock/reference input wherever the tool supports it.

**v2 supersedes v1.** See `bubu_core_identity_block.md` for the full four-discipline panel critique. Summary of what changed in this file:

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | Ears/trunk described as "near-circular" / "single-curve J" — too loose for a 100+-episode anchor image | Ears = perfect circles ("two coins"); trunk = fixed "hook" shape at its 0° resting rotation |
| Children's psychologist | "Curious" rest pose trunk described in isolation, with no link to the other 3 expressions | Trunk explicitly labeled as "Bubu's signature hook at rest (0° rotation)" — same shape that recurs, rotated, in every other prompt |
| AI image-gen expert | No outline → weak edge for character-lock/img2img reference use | Added fixed `#6B7C8C` outline around the full silhouette — gives every downstream generation a consistent edge to lock onto |
| Thumbnail expert | Body color vs. background contrast not addressed at the master-reference stage | Plain cream background + new outline maximize edge contrast in the one image every other prompt is derived from |

---

## Exact Prompt (v2)

```
Character reference sheet, single character, full body, neutral standing
pose, plain soft pastel cream background (#EAEFF2), no other objects, no
scenery, no shadows.

Bubu, a baby elephant character with one fixed, instantly recognizable
silhouette: a single large rounded teardrop-shaped body with no visible
neck (head and body form one continuous rounded shape), two perfectly
circular flat-disc ears (~40% of head width each, like two identical
coins attached high and symmetrically on the head), and one short trunk
shaped like a thick, uniform-width "hook" — the same width along its
entire length with a softly rounded (never pointed, never tapering) tip,
never longer than the diameter of one ear, always exactly one smooth
curve. In this reference image the hook is at its resting (0 degree)
orientation: tip pointing down toward the mouth, hanging near the chest.

Two-heads-tall baby proportions (head is 50% of total height). Four short
stubby cylinder legs, small rounded tail. Large round eyes (~23% of face
width, close together with about one eye-width gap between them), each
eye with one fixed white highlight dot, simple single-stroke eyebrows
raised slightly, small closed-curve smile. No tusks, no wrinkles, no skin
texture, no toenails.

Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and face
patch pale cream (#EAEFF2), inner ears soft pink (#F4B8C0, visible only at
ear edges in this neutral pose), cheek blush pink (#FBC7C7), eyes
near-black (#2B2B2B) with white highlight (#FFFFFF). A thin, soft, even
outline in dark slate (#6B7C8C) traces Bubu's entire silhouette — body,
ears, trunk, legs, tail — clearly separating Bubu from the background.

Flat 2.5D toon illustration style, soft rounded geometric shapes, clean
flat color fills, minimal gradient shading, soft even lighting, no harsh
shadows, crisp clean linework, vector-illustration quality. Square 1:1
composition, character centered, full body visible head to feet, "Curious"
expression (default/rest state).
```

---

## Why Each Design Choice Improves Consistency

- **Plain background, no scenery/shadows** — isolates the character so this image can serve as a clean character-lock/img2img reference for every later generation; background variance can't contaminate the comparison.
- **Full body, head-to-feet, neutral pose** — exposes every defining proportion ratio (head:body:legs) at once, so any drift in later generations is immediately visible against this baseline.
- **Perfect-circle ears ("two coins")** — replaces the vaguer "near-circular ~38-40%" wording with a shape every model and every human reviewer can verify unambiguously: are these two circles the same size, on the same horizontal line, symmetric about the centerline?
- **The "hook" trunk at its 0° resting orientation** — establishes the *one* trunk shape used everywhere else in the system. Every other prompt's trunk description should read as "this same hook, rotated."
- **Explicit numeric ratios** (50% head, ~40% ear diameter, ~23% eye width, ~1 eye-width gap, trunk ≤ one ear diameter) — numeric anchors give the model concrete targets instead of vague "big eyes/ears," which measurably reduces variance across repeated generations.
- **The new `#6B7C8C` outline** — gives every generation, from every tool, a consistent hard edge. This makes (a) character-lock/img2img more reliable, since the reference image has unambiguous boundaries, and (b) the silhouette/thumbnail tests in `bubu_consistency_checklist.md` easier to score, since the outline is itself part of what's being checked.
- **Hex codes for every palette element** — removes color ambiguity ("blue-gray" could mean many shades); pairing hex with descriptive names gives the model both a precise and a fallback signal.
- **"Vector illustration / flat 2.5D toon"** — actively counters the strong default bias of most models toward photorealistic or painterly "baby elephant" imagery (heavily influenced by wildlife photography and 3D-animated films).
- **1:1 square composition** — maximizes canvas for full-body + face detail without the vertical cropping pressure of 9:16; production 9:16 frames are derived later from this approved design.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| **Tusks appear** despite "no tusks" | Elephants are very strongly associated with tusks in training data — highest-risk failure across all prompts in this system. | Keep "no tusks" early in the prompt AND in the negative prompt; this is unchanged from v1 and remains the #1 risk. |
| Ears render as ovals, leaves, or "Dumbo" floppy shapes instead of perfect circles | "Near-circular" left room for interpretation; floppy/oval ears are the dominant baby-elephant trope. | "Perfectly circular," "like two identical coins" — a much harder shape for a model to drift away from than "near-circular." |
| Trunk tapers to a point or renders as a long hose | Realistic elephant trunks taper and elongate; "J curve, one bend" didn't constrain *thickness*. | "Uniform-width... never tapering... never longer than the diameter of one ear" directly blocks both failure axes (length and taper). |
| Outline missing, too thick, or wrong color | Outline is a new element with no precedent in v1 prompts; models may ignore subtle line-art instructions. | If outline doesn't render, regenerate with "thin outline" emphasized earlier in the prompt, or add it in post (vector trace) — the outline is valuable enough to enforce in editing if generation is unreliable. |
| Adult-like proportions (smaller head, longer trunk/legs) | Strong prior toward realistic/famous elephant depictions. | Unchanged from v1 — "two-heads-tall, head is 50% of total height" remains the anchor. |
| Body color drifts toward brown/gray rather than gray-blue | Weak hex-code adherence; gray-blue is an unusual elephant color. | Unchanged — hex codes front-loaded; outline color (#6B7C8C) is a *darker tone of the same hue family*, so even if exact hex drifts slightly, the outline-vs-body relationship should still look correct. |
| A second, smaller elephant appears (implied "parent") | Strong "baby + mother elephant" association in training data. | Unchanged — "single character" stated up front and reinforced in negative prompt. |

---

## Negative Prompt (v2)

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

---

## Optimization Notes for Image Generation Models

- **Front-load the highest-risk constraints** (no tusks, perfect-circle ears, hook-shaped trunk, flat 2.5D toon style, exact palette) — most diffusion and transformer-based image models weight earlier tokens more heavily.
- **Separate negative-prompt fields** (SDXL-based tools, Midjourney `--no`, etc.): paste the negative block directly. **No separate field** (some Higgsfield/Kling/Veo image modes): append `Avoid: ` + the negative list to the end of the main prompt.
- **Lock a seed** once an acceptable result is produced. Reuse that seed + this exact prompt text as the canonical "Bubu" reference for all future generations.
- **Feed the resulting image forward** — once approved, this image (not just its text description) should be supplied as the reference/character-lock input for the front, three-quarter, side, and expression prompts in this system.
- **Run the thumbnail test immediately on this image**: scale it to ~120px wide. Confirm the two ear-circles and the hook-shaped trunk are still distinguishable from the body outline at that size *before* generating any other reference image — every downstream prompt inherits this image's silhouette, so fix legibility issues here first.
- Generate **4–8 variations** at this stage and pick the single best result before moving on — every downstream prompt depends on this one image being correct.
