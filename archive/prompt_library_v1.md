# Prompt Library — Bubu Channel

Reusable prompt blocks for AI image/video generation. Combine: **Master Prompt + Style Prompt + Camera Prompt + one Expression Prompt + one Pillar Prompt + episode-specific details + Negative Prompt.** This combination should be used for every single generation across all 100+ episodes.

---

## Master Prompt (Bubu — always include verbatim)

```
Bubu, a baby elephant character: rounded egg-shaped body, two-heads-tall baby
proportions, two large near-circular ears (~38% of head width) attached high
and symmetrically on the head, short trunk rendered as a single smooth curve
(one bend maximum when extended), large round eyes (~23% of face width) with
one fixed white highlight dot, simple single-stroke eyebrows, small closed-curve
mouth, no tusks, no wrinkles, no skin texture, no toenails, flat smooth shading
throughout. Fixed color palette: body skin soft gray-blue (#A9B7C4), belly and
face patch pale cream (#EAEFF2), inner ears soft pink (#F4B8C0), cheek blush
pink (#FBC7C7), eyes near-black (#2B2B2B) with white highlight. Bubu is the
only character with this color palette and silhouette.
```

---

## Style Prompt (always include verbatim)

```
Flat 2.5D toon illustration style, soft rounded geometric shapes (circles,
ovals, rounded rectangles), clean flat color fills with minimal gradient
shading, no outlines thicker than necessary for clarity, soft pastel
background (saturation 0.20-0.35), high-contrast saturated foreground objects
(saturation 0.55-0.90), bright even lighting, no harsh shadows, vertical 9:16
composition, large empty negative space in the upper third of frame reserved
for text labels, background complexity minimal (maximum 2 background
set-pieces), 3-5 total objects in frame including Bubu.
```

---

## Camera Prompt (always include verbatim)

```
Static, locked-off camera. No pans, no zooms, no tilts, no rotation, no
camera shake. Single continuous shot for the full duration of the clip — no
cuts. Eye-level or slightly-below framing (toddler's-eye point of view).
Subject occupies 40-55% of frame height, positioned center or center-left,
eyes at approximately 40% from the top of frame.
```

---

## Expression Prompts (use exactly one per beat, per `character_bible.md`)

**Curious (default / Hello beat):**
```
'Curious' expression: wide round eyes with soft raised eyebrows, ears relaxed
and facing forward, trunk in a gentle resting J-curl near the mouth with a
slight swaying motion, soft closed-curve smile.
```

**Focused (Build beat):**
```
'Focused' expression: one eyebrow very slightly lowered, eyes steady, ears
still and forward-facing, trunk extended in a single smooth curve toward the
object being interacted with (pointing, patting, or holding).
```

**Surprise (Anticipation beat):**
```
'Surprise' expression: both eyebrows raised high, eyes wide open, mouth in a
small open 'o' shape, both ears popped fully outward revealing pink inner-ear
color, trunk lifted straight up, all motion otherwise still.
```

**Delight (Payoff beat):**
```
'Delight' expression: eyes scrunched into happy crescent shapes, ears flapped
outward showing pink inner-ear color, trunk raised overhead in a curled
'trumpet' pose, one front foot lifted in a small hop.
```

---

## Pillar Prompts (scene dressing — add one per episode, on top of Master/Style/Camera)

**1. Water Play:**
```
Scene includes a small still pond or puddle shape in the object-zone third of
the frame, rendered in pale blue-gray at low saturation until the payoff
moment, when it becomes fully saturated turquoise (#4FD1C5).
```

**2. Colors:**
```
Scene includes one neutral gray rounded object (ball, balloon, or bud shape)
in the object-zone third of the frame, which fills with the episode's hero
color at full saturation during the payoff moment.
```

**3. Shapes:**
```
Scene includes one flat gray outline of a simple geometric shape (circle,
square, triangle, or star) on the ground in the object-zone third of the
frame, which fills solid with the episode's hero color and performs one small
motion (bounce, roll, or lift) during the payoff moment.
```

**4. Counting:**
```
Scene includes 2-3 identical small gray objects (pebbles, leaves, or bubbles),
appearing one at a time in the object-zone third of the frame during the Build
beat, each appearance synced to one of Bubu's repeated actions. All objects
activate together (glow, bounce, or float) during the payoff moment.
```

**5. Animal Friends:**
```
Scene includes one small friend-animal character in the same flat 2.5D toon
style as Bubu (simple geometric body, large eyes, flat colors, no overlap with
Bubu's color palette), entering from the object-zone third during the Build
beat and reaching Bubu during the payoff moment for a shared 'Delight' reaction.
```

**6. Things That Go (Vehicles):**
```
Scene includes a short flat road-strip along the ground and one small gray
vehicle shape (car, truck, or train segment) in the object-zone third of the
frame, which turns the episode's hero color and moves rapidly across the full
frame in a single direction during the payoff moment, leaving a simple motion
streak.
```

**7. Playground:**
```
Scene includes one simple playground element (slide, swing, or low step
shapes) in flat 2.5D toon style as the secondary set-piece. Bubu performs the
element's signature release motion (sliding down, swinging forward) as the
payoff moment — the largest motion of any pillar.
```

**8. Daily Routines:**
```
Scene replaces the default outdoor world with a simple flat room-interior
(same horizon-line composition, warm room-toned colors), including one
routine-related object (cup, toothbrush shape, or bowl). Completing the
routine action during the payoff moment produces a small sparkle or soft glow
effect and a content sigh from Bubu.
```

---

## Negative Prompt (always include verbatim)

```
No tusks, no wrinkles, no skin texture detail, no toenails, no visible teeth,
no tongue, no extra limbs, no extra trunk segments or multiple bends, no
second character overlapping or merging with Bubu's silhouette, no clothing
beyond a single small accessory, no camera movement, no camera shake, no
zoom, no scene cuts, no background characters, no text or signage embedded in
the background art, no cluttered background, no more than 5 total objects in
frame, no oversaturated background, no desaturated foreground hero object, no
photorealistic style, no realistic proportions, no scary or aggressive
expressions, no dark or low-contrast lighting.
```

---

## Quick Assembly Template

For any new episode/beat, concatenate in this order:

```
[Master Prompt] + [Style Prompt] + [Camera Prompt] + [Expression Prompt for
this beat] + [Pillar Prompt for this episode's pillar] + [episode-specific
hero color / object / action details] + [Negative Prompt]
```
