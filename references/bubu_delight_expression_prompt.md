# Bubu "Delight" Expression Prompt (v2 — Production-Ready)

Used for the **Payoff beat** — the highest-energy moment of the episode, occurring at peak saturation alongside the episode's single sound effect. The second and final expression where Bubu's pink inner ears are visible. Trunk pose: **hook rotated ~215-225° up and back**.

**v2 supersedes v1.** Summary of changes (full panel critique in `bubu_core_identity_block.md`):

| Persona | v1 Gap | v2 Fix Applied Here |
|---|---|---|
| Disney designer | "Trunk raised overhead and curled into a rounded 'trumpet' shape where the tip curls back toward the head forming a single closed loop" — a **closed loop is structurally a different shape** from Bubu's other trunk poses (it doubles back on itself), breaking the "one consistent trunk shape" principle and creating the highest silhouette-drift risk in the whole system. | **The closed loop is removed entirely.** Delight's trunk is now "the same hook shape, rotated ~215-225° so the tip points up and back toward the near ear" — structurally identical to every other pose, just rotated further than Surprise. This was the single highest-impact fix in this revision. |
| Children's psychologist | Three independent "excitement" signals (crescent eyes, trumpet loop, foot hop) gave the model three chances to under- or over-render — for a 0-2 viewer, too many simultaneous novel shapes can make Delight read as "a different character" rather than "happy Bubu." | Reduced to two primary signals (crescent eyes + rotated hook trunk, both built from existing shape vocabulary) plus the foot-hop as a tertiary motion cue — keeps Delight recognizably "the same Bubu" while still clearly the most energetic pose. |
| AI image-gen expert | The closed-loop trunk was flagged in v1 as the highest trunk-consistency risk of the four expressions — directly caused by describing a structurally novel shape instead of reusing the hook. | Resolved by the rotation-only approach above. Outline added, with a note that the outline should make the rotated hook's silhouette clearly distinct from the ear circles even when both are near the top of the head. |
| Thumbnail expert | A closed-loop trunk + flapping ears + hop is a visually busy silhouette at small sizes — three simultaneous changes compete for attention. | Simplified pose (rotated hook, not a loop) reduces silhouette complexity, making Delight easier to read at thumbnail size while remaining the most visually distinct of the four expressions. |

---

## Exact Prompt (v2)

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

---

## Why Each Design Choice Improves Consistency

- **Removing the closed-loop trunk in favor of "the same hook, rotated 215-225°"** — this is the single most important consistency fix in the v2 system. Delight's trunk is now structurally identical to Curious/Focused/Surprise's trunk, just at a more extreme rotation — eliminating the risk of a "different trunk shape" appearing at the episode's emotional peak.
- **Crescent (closed) eyes vs. Surprise's wide-open eyes** — creates maximum visual contrast between the episode's two "exciting" expressions, so the Anticipation→Payoff transition reads as a clear emotional shift even to a 0-2-year-old viewer.
- **A clear angular gap from Surprise (180°) to Delight (215-225°)** — both raised-trunk poses are now positioned on the same rotation scale with a defined ~35-45° separation, giving the model (and human reviewers) a precise, comparable target instead of two vaguely-different "raised trunk" descriptions.
- **"One front foot lifted in a small hop"** — adds a secondary independent Delight signal (alongside the eyes and trunk rotation) without introducing a new shape — it's a pose change to an existing limb, not a new element.
- **Backward lean** — the opposite pole from Focused's forward lean, giving Bubu's four core poses (Curious-neutral, Focused-forward, Surprise-still, Delight-backward) a distinct body-language arc across the episode.
- **"Payoff object at peak saturation" included directly in the background description** — ties this expression prompt to the visual style guide's saturation rules (0.75-0.90 for the hero/payoff object), reinforcing that Delight and the payoff object's color burst happen in the same frame.
- **Outline explicitly called out near the top of the head** — with the trunk now rotated up and back near the ears, this is the most visually congested area of the image; the outline keeps the rotated hook and the two ear circles as three distinguishable shapes rather than one cluster.

---

## Possible AI Generation Failure Modes

| Failure mode | Why it happens | v2 Mitigation |
|---|---|---|
| Crescent eyes render as fully closed/invisible, losing the eye feature entirely | "Closed crescent shapes" is close in wording to "closed eyes," and models may remove the eye feature altogether. | "Visible as upward-curving lines, not absent" — explicitly distinguishes "closed shape" from "no shape." If this persists, try "eyes squeezed into thin upward-curving happy lines, still visible as a feature." |
| Rotated hook trunk reverts to a straight-up pose (converging with Surprise) or reintroduces a loop/spiral | The "215-225°, tip toward near ear, not a loop" instruction is new; models may default to the simpler "straight up" or to a familiar "elephant trumpet" loop from training data. | This is now the **primary risk to monitor** in this prompt (replacing v1's loop risk with a "did the rotation actually apply" risk). If it reverts to straight-up, increase the angle stated (e.g. "240 degrees") to push further from Surprise's 180°. If a loop reappears, add "not curling back on itself, not forming a closed shape" to the negative prompt. |
| Hop exaggerated into a full jump, both feet off the ground, or an unbalanced/falling pose | "Celebratory hop" can be over-interpreted as larger full-body motion than the single-lifted-foot instruction specifies. | Unchanged from v1. |
| Mouth shows teeth or tongue despite "wide open smile, closed curve, no teeth" | "Wide open smile" is a strong teeth/tongue trigger phrase. | Unchanged from v1. |
| Ear flap (mid-motion) renders as either fully relaxed (Curious-like) or fully popped static (Surprise-like) | Both ear-pop states ("popped outward, pink visible") are now described identically to Surprise's ear state — Delight's ears may be visually indistinguishable from Surprise's. | Acceptable fallback, explicitly stated: if Delight's ears can't be reliably differentiated from Surprise's "popped" state, render them identically — pink-ear visibility (vs. Curious/Focused's hidden pink) is the more important consistency signal than the exact flap angle, and the trunk rotation + eye shape + hop remain the primary differentiators from Surprise. |

---

## Negative Prompt (v2)

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

---

## Optimization Notes for Image Generation Models

- The **rotated-hook trunk pose is now the highest-priority element to verify** in this prompt (replacing v1's loop-trunk concern). Confirm it reads as "the same hook as Bubu's other poses, just pointing up and back" — not as a straight raise (too close to Surprise) and not as a loop/spiral (violates the one-curve rule).
- If the 215-225° rotation doesn't read clearly, **push the stated angle further** (e.g. 240-250°) rather than adding new descriptive words — numeric rotation values have proven more reliable for this shape than additional adjectives.
- Since this is the **payoff frame**, pair it with the episode's specific Pillar Prompt and hero-color payoff object (per `prompt_library.md`) when generating production frames — the isolated version here is for character/expression reference only.
- **Thumbnail check**: scale to ~120px and confirm three things are still distinguishable near the top of the head — the two ear circles and the rotated trunk hook. If they blur into one shape, the outline instruction needs to be emphasized further, or the rotation angle reduced slightly (e.g. to 200°) to give the trunk more separation from the ears.
