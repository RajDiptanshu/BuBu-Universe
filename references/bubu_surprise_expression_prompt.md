# Bubu "Surprise" Expression Prompt (v2 — Production-Ready)

Used for the **Anticipation beat** — the lowest-energy, held-breath pause immediately before the payoff. The first of two expressions where Bubu's pink inner ears become visible. Trunk pose: **hook rotated ~180° upward**.

**v2 supersedes v1.** Summary of changes (full panel critique in `bubu_core_identity_block.md`):

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | "Trunk lifted straight up... tip gently curled" was the closest v1 trunk pose to Delight's "trumpet curl," with no structural device to keep the two from converging. | Now explicitly "hook rotated ~180°, tip pointing up and slightly forward" vs. Delight's "~215-225°, tip pointing up and back" — the rotation table in `bubu_core_identity_block.md` gives both poses a precise, comparable angular difference. |
| Children's psychologist | "Both ears popped fully outward revealing pink" was correct but described as a one-off change in ear *state* without anchoring the ear *shape* (circle) that stays constant. | Ears remain perfect circles in both states — only the pink interior visibility changes, not the shape. Reinforces "same Bubu, different state" for toddlers. |
| AI image-gen expert | No outline — and "both ears popped outward" is a bilateral symmetric change that's hard to verify without a hard edge on each ear. | Outline added, explicitly traced around both popped ear circles — gives a clear, comparable edge for checking left/right symmetry of the pop. |
| Thumbnail expert | Pink ears + raised trunk is a high-contrast, attention-grabbing pose — good for thumbnails — but this wasn't called out as a secondary thumbnail option alongside Curious. | Added a note identifying this as a strong "high-energy" thumbnail alternative to Curious's "calm" default. |

---

## Exact Prompt (v2)

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

---

## Why Each Design Choice Improves Consistency

- **"Both ears popped fully outward revealing pink"** — gives toddlers a clear, high-contrast, binary visual signal ("something is about to happen") that doesn't depend on subtle facial reading — critical for the 0-2 audience.
- **"The circular ear shape itself unchanged, only its angle/visibility changes"** — reinforces that this is the *same* Bubu in a different state, not a redesign; the ear circle is a constant, only its pop-angle and pink-visibility vary.
- **Small open "o" mouth, explicitly no teeth/tongue** — bounds the "surprised mouth" to a simple closed shape, directly countering the strong default of models adding visible teeth/tongue to "surprised" or "open mouth" prompts.
- **"Body weight centered and still — a held-breath pause pose"** — reinforces the Anticipation beat's requirement to be the lowest-energy moment of the episode, providing maximum contrast against the high-energy Payoff (Delight) that follows immediately after.
- **"Hook rotated ~180°, tip pointing up and very slightly forward"** — gives Surprise a precise angular position on the rotation table distinct from Delight's "~215-225°, tip pointing up and back," so the two raised-trunk poses are mathematically, not just descriptively, different.
- **Outline traced around both popped ear circles individually** — makes the bilateral symmetry of the ear-pop directly checkable: are both ear outlines the same size and the same distance from the head outline?
- **Identical 9:16 framing to all other beat prompts** — ensures the Anticipation frame holds its position exactly between the Build and Payoff frames with no jump in composition.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| Mouth too wide or showing teeth | "Surprise" is one of the strongest teeth/open-mouth trigger words in image generation. | Unchanged from v1 — remains the top risk for this expression. |
| Only one ear pops outward, or pink appears on only one side | Bilateral symmetric actions (both ears moving identically) are harder for models to render consistently than single-feature changes. | Outline traced around both ear circles individually gives a direct visual check; if asymmetric, regenerate rather than attempting a wording fix (sampling variance, not a prompt issue). |
| Trunk pose too visually similar to Delight's overhead trumpet curl | Both expressions involve a raised trunk; without a clearly different curl direction/shape, the two can converge. | The rotation table gives Surprise (~180°, tip forward) and Delight (~215-225°, tip back) a ~35-45° angular separation — if convergence persists, exaggerate the gap further (e.g. 170° vs 230°). |
| Unwanted recoil motion — stepping back, raised leg, or leaning away | "Surprise" commonly implies a flinch/recoil reaction in training data, conflicting with the "held-breath, still" requirement. | Unchanged from v1. |
| Eyes rendered as closed or crescent-shaped (Delight-like) instead of wide open | "Surprise" and "Delight" eyes are sometimes conflated as generic "excited" eyes. | Unchanged from v1 — "wide open" (Surprise) vs. "scrunched into crescents" (Delight) remains the intended contrast. |

---

## Negative Prompt (v2)

```
wide open mouth, visible teeth, tongue, one ear popped, asymmetrical ears,
pink visible on only one ear, ears not popped, oval ears, leaf-shaped ears,
trunk rotated 215 degrees, trunk pointing up and back, trunk in trumpet curl,
trunk forming closed loop, tapering trunk, pointed trunk tip, trunk longer
than one ear, stepping back, recoiling, raised leg, leaning away, jumping,
eyes closed, crescent eyes, smiling, frowning, no outline, thick black
outline, profile view, side view, back view, cropped, partial body
```

---

## Optimization Notes for Image Generation Models

- If the trunk pose reads too similarly to Delight across generations, **exaggerate the angular gap** in the prompt itself — e.g. explicitly say "170 degrees, tip pointing forward and slightly down" for Surprise vs. "230 degrees, tip pointing back toward the ear" for Delight — wider numeric separation tends to produce more visually distinct results than the same gap described in words alone.
- Bilateral symmetric features (both ears popping, both eyebrows raising) tend to be more reliable than single-sided asymmetric ones — if pink only appears on one ear, regenerate rather than trying to "fix" via prompt wording, since this is a sampling variance issue more than a prompt issue.
- Because this expression sits at the **lowest-energy point** of the episode, double-check against the Build (Focused) and Payoff (Delight) frames for energy contrast — if Surprise looks more "active" than Focused, the held-breath stillness instruction needs to be emphasized further.
- **Thumbnail note**: pink-eared Surprise is a strong high-contrast alternative thumbnail to the default Curious pose — if A/B testing thumbnails, this expression (popped pink ears + raised hook) is worth testing alongside Curious for click-through.
