# Bubu "Focused" Expression Prompt (v2 — Production-Ready)

Used for the **Build beat** — Bubu is actively interacting with the episode's object via Point, Hold, Spray, or Pat/Tap. The only expression in the set with an intentionally asymmetric facial feature. Trunk pose: **hook rotated ~90° forward**.

**v2 supersedes v1.** Summary of changes (full panel critique in `bubu_core_identity_block.md`):

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | "Trunk extended forward in a single smooth curve... tip rounded and open, not wrapped" described a *different-looking* trunk from Curious's "J curl," risking a visibly inconsistent mascot across the Hello→Build transition. | Now explicitly "the hook rotated ~90° forward" — same shape as Curious's hook, just pointing a different way. The "not wrapped, tip stays rounded/open" instruction is preserved but framed as "the hook's rounded tip stays rounded" — i.e. the shape doesn't change, only its orientation. |
| Children's psychologist | The single asymmetric eyebrow was correctly isolated, but nothing tied this pose back to a consistent "Bubu" silhouette a toddler would recognize mid-action. | Circle ears + hook trunk (just rotated) keep Bubu's silhouette recognizable even mid-action — only the eyebrow and trunk angle change, everything else stays anchored. |
| AI image-gen expert | No outline — and this is the pose where the trunk overlaps with an external object, making edge separation between "Bubu's trunk" and "the object" especially important. | Outline added; explicitly noted that the outline should continue around the trunk hook even where it approaches the object, keeping trunk and object visually distinct. |
| Thumbnail expert | Forward lean + extended trunk toward an object is often the *second* frame shown in feed previews (after Curious) — its silhouette wasn't tested for legibility when an object is added to the frame. | Added a thumbnail note about checking the hook-trunk-to-object silhouette doesn't merge into one blob at small sizes. |

---

## Exact Prompt (v2)

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

---

## Why Each Design Choice Improves Consistency

- **Isolating asymmetry to a single feature (one eyebrow)** — limits the "asymmetry risk" to one small, well-defined area rather than letting the model introduce asymmetry elsewhere (eyes, ears, trunk), which would compound across the four-expression set.
- **"The same hook shape rotated approximately 90 degrees forward"** — keeps Focused's trunk visually traceable back to Curious's trunk as the *same object in a different pose*, rather than risking a "different trunk" appearance between beats — directly addressing the children's-psychologist concern about shape consistency across an episode.
- **"The hook's rounded tip remaining open and rounded — not wrapped, not gripping"** — keeps Focused visually distinct from a "Hold" action that might otherwise look like a different trunk shape; preserves the single-curve, fixed-shape trunk rule even when the trunk is doing work.
- **"Body leaning slightly forward"** — gives a secondary, body-level cue (beyond the face) that something active is happening, reinforcing the Build beat's "rhythmic repeated action" without adding extra limbs or motion elements.
- **Outline called out at the trunk-to-object boundary** — this is the one expression where Bubu's silhouette and an external object's silhouette are closest together; an explicit separating line prevents the two from merging into a single blob, which matters both for clarity and for the thumbnail test.
- **Pink inner ear NOT shown** — keeps Focused on the "calm" side of the expression set alongside Curious, contrasting with the pink-eared Surprise/Delight pair used for the more excited beats.
- **Identical framing values to Curious and the 3/4-view template** — ensures Beat 2 (Build) keyframes align pixel-for-pixel with Beat 1 and Beat 5, so only the expression/pose changes between frames.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| Eyebrow asymmetry rendered too strongly, reading as an angry expression | "One eyebrow lowered" is close in wording to "frowning" or "angry," which models associate strongly with stronger asymmetry. | Unchanged from v1 — if this persists, try outcome-based phrasing (see Optimization Notes). |
| Eyebrow asymmetry not rendered at all, expression reads identical to Curious | Subtle single-feature asymmetry is easy for models to ignore in favor of a "default" symmetric face. | Unchanged from v1. |
| Trunk wraps around the object despite "not wrapped" | Strong prior that an elephant trunk interacting with an object will grip/wrap it. | "The hook's rounded tip remaining open and rounded" reinforces that the *shape itself* doesn't change — a wrap would require a second bend, which the hook-shape rule (one smooth curve) already excludes. |
| Trunk rotation reads as a *different shape* rather than the same hook rotated (e.g. becomes thinner/longer when extended forward) | "Rotated 90 degrees" is a new instruction; models may default to "extending" (lengthening) the trunk rather than rotating a fixed-length shape. | If this occurs, add "the hook does not lengthen or change thickness when rotated — only its angle changes" as a supplemental clause. |
| Forward lean exaggerated into a falling or off-balance pose | "Leaning forward" can be over-interpreted as a dynamic action pose rather than a subtle posture shift. | Unchanged from v1. |
| No object present in the frame (since this is an isolated character reference), so the trunk points at empty space | This prompt is generated without a specific episode object; the trunk's target is described only as "the object-zone third." | Unchanged — when generating for a specific episode, add the actual payoff object per the relevant Pillar Prompt (see Optimization Notes). |

---

## Negative Prompt (v2)

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

---

## Optimization Notes for Image Generation Models

- When generating this expression **for a specific episode**, add the episode's actual payoff object into the object-zone third of the prompt (per the relevant Pillar Prompt in `prompt_library.md`) so the trunk has a real target — this reduces "pointing at nothing" oddities and lets you verify the outline correctly separates trunk from object.
- If the eyebrow asymmetry doesn't render reliably, try phrasing it as a *description of the resulting look* rather than an instruction — e.g. "a focused, slightly inquisitive expression with one eyebrow subtly lower than the other" — some models respond better to outcome-based phrasing for subtle asymmetries.
- Since this is the **only asymmetric expression**, double-check left-right consistency against the approved 3/4-view reference specifically for this image — confirm the lowered eyebrow is on the same side across regenerations.
- **Thumbnail check**: with an object in frame, scale to ~120px and confirm the hook-trunk and the object remain two distinguishable shapes, not one merged blob — this is the main new risk introduced by this pose.
