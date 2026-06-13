# Visual Style Guide — Bubu Channel

Locks down everything that must stay constant across 100+ AI-generated episodes, and defines the variables that are allowed to change per episode/pillar.

---

## Background Rules

- **One shared "world" base:** a flat horizon-line composition (soft ground color + soft sky color), identical framing across every episode.
- **Maximum 2 background set-pieces** behind/around Bubu (e.g., one cloud shape + one plant shape). Never more.
- **Background complexity score capped at 3/10** — flat shapes only, no gradients with more than 2 stops, no background characters, no signage/text.
- **Background motion:** none, or a single slow looping element (e.g., one cloud drifting) — must be slower and less salient than any foreground motion.
- **Pillar-specific dressing** (water surface for Water Play, road strip for Vehicles, etc.) replaces the ground layer only — the sky/horizon composition never changes.

---

## Object Rules

- **3–5 objects total per frame, including Bubu.** Fewer is better; never exceed 5.
- **One object = one word.** Every object must be nameable with a single word a toddler could learn.
- **Geometric/primitive-based shapes** (circles, ovals, rounded rectangles) for all objects — minimizes AI generation drift across frames.
- **One "payoff object" per episode**, always rendered in the episode's hero color at full saturation.
- Objects appear **one at a time** during the Build beat — never all at once.

---

## Camera Rules

- **Static locked-off frame for the entire episode.** No pans, no zooms, no shake, no rotation.
- **Vertical 9:16 framing**, Bubu positioned center or center-left, occupying roughly 40–55% of frame height.
- **Eye-level / slightly-below framing** (toddler's-eye POV).
- **No cuts.** One continuous shot per episode, beginning to end.
- Payoff objects enter from a single consistent direction within an episode (right, below, or above) — never multiple directions in one episode.

---

## Color & Saturation Rules

- **Background saturation: 0.20–0.35** (HSL). Always visibly muted relative to foreground.
- **Bubu's palette:** fixed exactly as defined in `character_bible.md` — never adjusted for saturation/lighting.
- **Foreground/secondary objects:** saturation 0.55–0.70.
- **Hero/payoff object:** saturation 0.75–0.90 — the single most saturated element in any frame, reserved for the payoff beat.
- **Contrast target:** luminance range 0.80–0.90 between lightest and darkest frame areas — must read clearly on a small phone screen.
- **One hero color per episode**, matched to Bubu's rotating accessory.

---

## Composition Rules

- **Rule of thirds, fixed:** Bubu sits on the left or center third; the payoff object's entry point is the opposite third.
- **Negative space above Bubu's head** is preserved in every frame — reserved for on-screen text labels (never overlapping Bubu, the payoff object, or the accessory).
- **Symmetry preference:** background set-pieces are placed to balance (not compete with) Bubu's asymmetric ear/trunk silhouette.
- **Consistent eye-line:** Bubu's eyes sit at approximately the same vertical position (≈40% from top of frame) across all episodes.

---

## Motion Rules

- **Bubu is the only character that moves significantly.** Background elements are static or barely-moving.
- **Motion budget per episode:** exactly one "build" motion (repeated 1–3x) and one "payoff" motion (single, fast, directional).
- **Build motion** = small, rhythmic, repeating (trunk pat, ear wiggle, small hop) — same speed each repetition.
- **Payoff motion** = the fastest, largest motion in the episode, always paired with the hero color reaching peak saturation and the single sound effect.
- **No simultaneous competing motions** — only one moving element at a time (Bubu OR the payoff object, not both at full speed together, except at the exact payoff frame where both may move together for emphasis).

---

## What Must NEVER Change Across Episodes

1. Bubu's proportions, body shape, ear shape, trunk rules, facial features, and fixed color palette (per `character_bible.md`).
2. The 4-expression set — no new expressions are ever introduced.
3. The shared world base (horizon-line composition, sky/ground relationship).
4. The static camera / no-cuts / single-continuous-shot rule.
5. The 3–5 object cap per frame.
6. The one-hero-color-per-episode rule.
7. The accessory rule (one accessory, never altering silhouette).
8. The beat structure and timing defined in `engagement_framework.md`.
