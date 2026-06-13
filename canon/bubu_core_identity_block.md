# Bubu Core Identity Block (v2 — Locked)

This file is the **single source of truth** for Bubu's visual identity going forward. It replaces the scattered identity/palette/style paragraphs in the v1 reference prompts with one locked block, reviewed by a four-discipline panel:

1. **Disney character designer** — silhouette, shape language, iconic readability
2. **Children's psychologist** — baby-schema appeal, emotional clarity for ages 0-2
3. **AI image-generation expert** — drift resistance, prompt-to-prompt consistency
4. **YouTube thumbnail expert** — legibility at ~120px, contrast against background

---

## Panel Critique of the v1 System

| Persona | v1 Issue | v2 Fix |
|---|---|---|
| **Disney designer** | "Two large near-circular ears (~38-40% of head width)" still permits oval, leaf, or teardrop interpretations across generations. "Trunk: single smooth J curve, one bend maximum" describes a *curve quality* but not a *shape* — models fill in wildly different trunk thicknesses and tapers. | Ears redefined as **perfect circles** ("two coins"). Trunk redefined as a single **fixed shape** — a short, uniform-thickness "hook" — not just a curve quality. |
| **Children's psychologist** | The four expression prompts describe the trunk as four *visually different objects*: a "J curl," a "pointing curve," a "straight-up curve," and a "trumpet loop." For a 0-2 viewer, a mascot whose key feature changes *shape* (not just position) between scenes is less recognizable and less soothing than one whose shape stays constant and simply *moves*. | All four trunk poses are now defined as **rotations of the same hook shape** (see Trunk Rule below) — Bubu's trunk always looks like "Bubu's trunk," just pointing a different way. |
| **AI image-generation expert** | No outline was specified. Across 100+ episodes and multiple AI tools, "J curve," "trumpet loop," and "straight up curve" are different enough text strings that models treat them as different objects, compounding silhouette drift over time. Body color `#A9B7C4` sits close in luminance to common pastel-sky tones, making edge detection (and therefore consistency-checking) harder. | Added a **fixed thin outline** (`#6B7C8C`, dark slate) around the entire character in every prompt — this gives every generation a hard edge to lock onto, and gives humans/QA tools a consistent line to compare across images. The **hook + rotation** system (above) gives every trunk pose a shared textual anchor ("the hook shape") instead of four unrelated descriptions. |
| **YouTube thumbnail expert** | At ~120px, `#A9B7C4` body against a `0.20-0.35` saturation pastel background has too little contrast — Bubu's edges can disappear in feed previews. "Near-circular ears ~38-40%" doesn't guarantee the strong twin-circle "ears-up" silhouette that reads instantly when scaled down. | The new outline (`#6B7C8C`) guarantees an edge at any size. **Perfect-circle ears** are chosen specifically because two same-sized circles atop a rounded body is one of the most thumbnail-legible silhouettes possible (same principle as classic mouse-eared mascot design). |

---

## The v2 Locked Identity Block

**Use this block verbatim — unedited — in every Bubu prompt (master, all view angles, all expressions).** Only the pose/expression/background/composition sections around it should change between prompts.

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

---

## The Trunk Rule (v2)

**Bubu has exactly one trunk shape: the "hook."** It is a short, thick, uniform-width curve with a rounded tip — visually similar to a thick comma or a candy-cane hook, never a tapering hose. Every pose in the system is the **same hook, rotated to a different orientation** — never a different shape.

| Beat | Pose Name | Hook Rotation (from rest) | Tip Points Toward |
|---|---|---|---|
| Hello / Loop | Curious (rest) | 0° — default resting orientation | Down, toward the mouth/chest |
| Build | Focused | ~90°, rotated forward | Horizontally, toward the object-zone |
| Anticipation | Surprise | ~180°, rotated up | Straight up, away from the face |
| Payoff | Delight | ~215-225°, rotated up and back | Up and back, toward the near ear |

When writing any trunk description, use this pattern:

> "trunk shaped like Bubu's signature hook — short, uniform thickness, rounded tip, one smooth curve, no longer than one ear's diameter — rotated to [point down toward the mouth / point forward toward the object / point straight up / point up and back toward the ear]."

This keeps the **shape** description identical across all 8 prompts and isolates the only variable (rotation/orientation) to a single short phrase — the part of the system most resistant to AI drift.

---

## Silhouette Validation (addendum to side-view prompt)

"Silhouette remains identifiable even without colors" is a hard requirement. For every approved reference image, in addition to the normal color render, generate (or manually create via a solid-fill/threshold edit) a **pure black silhouette on white** version and confirm:

- Two equal circles are visible above a rounded body (ears)
- One short, thick hook shape is visible at the front of the head (trunk) — distinct from a leg
- The body silhouette is a single rounded teardrop with no neck break
- No tusks, extra limbs, or stray shapes break the outline

If any of these fail in silhouette, the issue is in the **shape design itself**, not in color/style wording — regenerate at the Master Prompt level (see `bubu_master_prompt.md` v2) before touching any other prompt.

---

## Migration Notes (for `production_checklist.md` step 9.2)

This v2 identity block changes Bubu's spec in three concrete ways versus the original `character_bible.md` / `prompt_library.md`:

1. **Ears**: "near-circular, ~38% of head width" → "perfect circles, ~40% of head width, like two coins."
2. **Trunk**: "single smooth J curve, one bend maximum" → "fixed 'hook' shape (uniform width, rounded tip, ≤ one ear diameter), rotated per pose" — replaces four separately-worded trunk poses with one shape + rotation table.
3. **New element — Outline**: a constant `#6B7C8C` thin outline around Bubu's full silhouette, present in every prompt, added specifically for thumbnail contrast and cross-generation edge consistency.

Recommended follow-up (separate task): fold these three changes into `character_bible.md`, `prompt_library.md`'s Master/Style Prompts, and `visual_style_guide.md`'s color rules, so the production pipeline and this reference system stay in sync.
