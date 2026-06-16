# Episode 02 — Regeneration Audit (Critical: PNG/Video Mapping)

**Status: ASSEMBLY, EDITING, REVIEW, AND EXPORT WORK PAUSED.**
No ffmpeg/assembly commands generated. The current export
(`final/bubu_ep02_good_morning_bubu_final.mp4`) was NOT reviewed for this audit.

## Method

For each of the 6 slots, compared (a) `episode_02_images/scene_0N.png` /
`scene_5.png`, (b) frame 0 of `videos/scene_0N.mp4`, against (c) that scene's
locked description in `image_prompts.md` / `higgsfield_video_prompts_v2.md`.

**Note on the reported example:** direct frame comparison shows
`scene_02.mp4`'s first frame is visually identical to `scene_02.png` (dim Nook,
Bubu reaching to touch the pebble, small spark) — not to `scene_03.png` (warm
light-flood + glowing pebble + flowers). So the png→mp4 *generation pairing*
(NN↔NN) is internally consistent for all 6 slots. The actual fault is a
**content/slot misassignment**: each internally-consistent png+mp4 pair's
*content* matches a different scene's intended description than its filename
implies. Net effect is the same as flagged — **emotional progression is
scrambled and the current set cannot be assembled as-is.**

---

## 1. Corrected Scene Mapping Table

| Slot (filename) | Intended scene (per spec) | Current content depicts | Match? | Action |
|---|---|---|---|---|
| scene_00 | Brand Sting — generic bg, no Nook, Curious, no pebble | Generic gold/green bg, no Nook, calm pose, no pebble | ✅ Correct | **KEEP** |
| scene_01 | Hello — dim Nook, Curious, dormant pale pebble | Dim Nook, calm/curious, pale pebble on ground | ✅ Correct | **KEEP** |
| scene_02 | Build — Ear-Perk & Point, trunk points at light-gap (≤0.30 sat), pebble unchanged/no sparkle | Bubu's trunk *touches the pebble*, pebble emits a small spark | ❌ Wrong content (matches no scene's spec) | **REGENERATE** |
| scene_03 | Anticipation — ears popped/pink, trunk straight up 180°, "o" mouth, pale light-gap (0.35–0.40), pebble calm | Calm/content Bubu, full warm Sunrise-Cream flood, glowing pebble, flowers (afterglow) | ❌ Matches **Scene 5** intent, not Scene 3 | **RE-SLOT → becomes Scene 5 source** (then regenerate lighting per Scene 5 spec — see §2) |
| scene_04 | Payoff — Delight (crescent eyes, open smile, leaning back), turquoise flash 0.97–1.00 + Sunrise Cream flood 0.85–0.93 | Bubu trunk-up near ear, wide eyes, "o" mouth (Surprise pose) + bright glow | ❌ Matches **Scene 3** intent, not Scene 4 | **RE-SLOT → becomes Scene 3 source** (then regenerate lighting per Scene 3 spec — see §2) |
| scene_5 (note: missing leading zero) | Loop / Meadow Remembers — Scene-1-matching Curious pose, dim light-gap (0.24–0.30), pebble *faint* turquoise glow only | Bubu eyes-closed/big-smile/leaning-back (Delight) + brightest glow of the set, turquoise pebble distinct from cream flood | ❌ Matches **Scene 4** intent, not Scene 5 | **RE-SLOT → becomes Scene 4 source.** Likely usable with little/no regeneration — see §2 |

**Net result:** Scenes 0 and 1 are correct and untouched. Scenes 3↔4↔5 are a
clean 3-way content rotation (each slot's content belongs one position over).
Scene 2 matches nothing and needs a fresh image. **6 of 6 source videos are
invalidated** — even the 2 correct slots (0, 1) feed into an assembly whose
remaining 4 clips must be replaced/re-ordered, so no partial assembly is safe
until all 6 are corrected and re-validated.

---

## 2. Regeneration Plan

Ordered by effort, lowest first. All image prompts referenced below **already
exist and are already correct** in `image_prompts.md` / `higgsfield_video_prompts_v2.md`
— the prompts were never the problem; execution against them for slots 2/3/4/5
produced content for the wrong slot (or no matching slot). Nothing in
`image_prompts.md` or `higgsfield_video_prompts_v2.md` needs to be rewritten.

### Step A — Re-slot Scene 4 (current `scene_5`/`scene_05` → new Scene 4 source)
- Current `scene_5.png` content (Delight pose + brightest glow, turquoise
  pebble visually distinct from Sunrise-Cream flood) is a **strong match** for
  Scene 4's spec.
- Action: rename/copy `episode_02_images/scene_5.png` →
  `episode_02_images/scene_04_candidate.png` and `videos/scene_05.mp4` →
  `videos/scene_04_candidate.mp4`. Run the Scene 4 validation checklist (§3)
  against the PNG.
- **If it passes**: this becomes the new `scene_04.png`. The existing
  `videos/scene_05.mp4` (old content) may be usable as the Scene-4 *video* too
  (re-slot, not regenerate) — but still re-run the Scene 4 video checklist
  against it, since `higgsfield_video_prompts_v2.md` Scene 4 describes specific
  *easing* motion (flash→steady glow, particles fading, hop→settle) that must
  be present.
- **If it fails** (e.g., turquoise/cream not cleanly distinct, pose doesn't
  fully match Delight criteria): regenerate using `image_prompts.md` Scene 4
  prompt as-is, supplying current `scene_5.png` as an *additional* pose/lighting
  reference alongside `Bubu_Master_v1` + `Bubu_ThreeQuarter_v1` + `Bubu_Happy_v1`.

### Step B — Re-slot + relight Scene 3 (current `scene_04` → new Scene 3 source)
- Current `scene_04.png` content (Surprise pose: trunk up near ear, wide eyes,
  "o" mouth) is a **strong pose match** for Scene 3, but its background
  (full bright flood + sparkling pebble) **overshoots** Scene 3's spec (pale
  light-gap 0.35–0.40, pebble pale/calm/no glow in the still image — World Rule
  #1, "one quiet world, one loud payoff").
- Action: **regenerate** using `image_prompts.md` Scene 3 prompt verbatim
  (Bubu_Master_v1 + Bubu_ThreeQuarter_v1 + Bubu_Surprised_v1, identity 0.6–0.8),
  supplying current `scene_04.png` as a **pose-only** reference (the
  Surprise expression/trunk-180°/ears-popped reading is correct and should be
  preserved) while explicitly down-weighting its lighting — target light-gap
  ≤0.40 saturation, pebble pale gray-blue with no baked-in glow/sparkle.
- Then regenerate the Scene 3 video via `higgsfield_video_prompts_v2.md`
  Scene 3 prompt (near-freeze-frame, single end-of-clip pebble sparkle only).

### Step C — Regenerate Scene 5 (current `scene_03` → new Scene 5 source)
- Current `scene_03.png` content (calm pose + full sunny meadow + flowers) is
  the **largest gap**: Scene 5 must read as "Scene 1, but the pebble has a
  faint turquoise glow" — i.e., **dim** Nook (0.24–0.30), same framing as
  Scene 1, NOT a bright blooming meadow. Using current `scene_03.png` as-is
  for Scene 5 would also badly damage the loop seam (Scene5→Scene1 dissolve
  between a bright sunny frame and a dim frame).
- Action: **regenerate** using `image_prompts.md` Scene 5 prompt verbatim
  (Bubu_Master_v1 + Bubu_ThreeQuarter_v1 + Bubu_Curious_v1, identity 0.6–0.8).
  Use the **current (correct) `scene_01.png`** as the primary lighting/framing
  reference (Scene 5 must closely match Scene 1 except for the pebble's faint
  turquoise tint) — do not use current `scene_03.png` as a reference, to avoid
  re-introducing the over-bright meadow look.
- Then regenerate the Scene 5 video via `higgsfield_video_prompts_v2.md`
  Scene 5 prompt (eases from Delight → Curious, light-gap eases to dim, pebble
  glow eases to *faint persistent* turquoise).

### Step D — Regenerate Scene 2
- Current `scene_02.png` content (Bubu touches pebble → spark) matches no
  scene's spec and also pre-empts Scene 3's "first sparkle" beat.
- Action: **regenerate** using `image_prompts.md` Scene 2 prompt verbatim
  (Bubu_Master_v1 + Bubu_ThreeQuarter_v1, identity 0.6–0.8) — Ear-Perk & Point
  pose, trunk at ~90° aimed at the light-gap (NOT at the pebble), light-gap
  ≤0.30, pebble pale gray-blue and **completely unchanged/no sparkle**.
- Then regenerate the Scene 2 video via `higgsfield_video_prompts_v2.md`
  Scene 2 prompt (ear-perk completes in ~0.2s, then 3 evenly-spaced trunk taps
  at the light-gap, 3 equal brightness steps ≤0.30, pebble unchanged).

### Step E — Housekeeping
- Fix the `scene_5.png` → `scene_05.png` naming inconsistency once its content
  is finalized in its correct slot, so all 6 images follow `scene_0N.png`.
- After Steps A–D, **every** `episode_02_images/scene_0N.png` and
  `videos/scene_0N.mp4` will be a newly-validated pair — archive the current
  `episode_02_images/` and `videos/` contents (don't delete) before writing
  the new set, in case any re-slotted asset needs to be revisited.

---

## 3. Scene-by-Scene Validation Checklist

Run against **every** new/re-slotted PNG before it is sent to Higgsfield, and
again against the resulting video before it is approved for assembly. Each
item is a pass/fail derived directly from `image_prompts.md` +
`higgsfield_video_prompts_v2.md`.

### Scene 0 — Brand Sting (no change expected, re-validate anyway)
- [ ] No Nook elements (no grass-blade walls, no leaf-roof, no dirt floor)
- [ ] No Wonder Pebble present anywhere in frame
- [ ] Background = generic pale sky/ground, ≤2 simple shapes, saturation 0.24–0.42
- [ ] Curious expression: wide eyes, soft raised eyebrows, closed-curve smile
- [ ] Trunk at 0° resting curl near chest
- [ ] Ears relaxed/forward — outer body color visible (flag if pink inner-ear
      shown; current asset shows pink and is a known minor deviation)
- [ ] Composition: Bubu 40–55% frame height, eyes ~40% from top, center-left, 9:16

### Scene 1 — Hello (no change expected, re-validate anyway)
- [ ] The Nook present: dirt floor, grass-blade walls, leaf-roof (≤2 set-pieces)
- [ ] Light-gap closed/dim, background saturation 0.24–0.30
- [ ] Wonder Pebble visible near Bubu, pale gray-blue, **no glow/sparkle**
- [ ] Curious expression, ears relaxed/forward, pink inner-ear NOT shown
- [ ] Trunk at 0° resting curl
- [ ] Composition: Bubu 40–55% frame height, eyes ~40% from top, center-left, 9:16
- [ ] **Loop check**: framing/pose closely matches what Scene 5 must converge to

### Scene 2 — Build (NEW generation)
- [ ] Ears rotated forward 10–15° from Scene 1 (Ear-Perk) — pink inner-ear NOT shown
- [ ] Trunk at ~90°, pointing horizontally at the leaf-roof light-gap (NOT at
      the pebble, NOT touching anything)
- [ ] Focused expression: exactly one slightly-lowered eyebrow (only permitted asymmetry)
- [ ] Light-gap brighter than Scene 1 but capped at ~0.30 saturation
- [ ] Wonder Pebble: pale gray-blue, **unchanged size/position, no glow, no
      sparkle, no contact with Bubu**
- [ ] ≤2 background set-pieces, no new objects
- [ ] Composition: Bubu 40–55% frame height, eyes ~40% from top, center-left, 9:16
- [ ] **Regression check**: image does NOT show Bubu's trunk touching/reaching
      toward the pebble (the specific defect found in the current asset)

### Scene 3 — Anticipation (NEW generation, pose-reference from current scene_04)
- [ ] Both ears popped fully outward, pink inner-ear (#F4B8C0) visible on both
- [ ] Trunk straight up at 180°, tip pointing slightly forward
- [ ] Surprise expression: raised eyebrows, wide eyes, small open "o" mouth
- [ ] Body completely still/centered — held-breath pose
- [ ] Light-gap at brightest **pale** state, 0.35–0.40 saturation — explicitly
      **not** a Sunrise-Cream flood, no hero-band (0.85+) bleed
- [ ] Wonder Pebble: pale gray-blue, **no glow/sparkle/flash baked into the
      still image** (the video-only end-of-clip sparkle is added in motion,
      not the keyframe)
- [ ] No on-screen text (this is the episode's only silent, text-free beat)
- [ ] Composition: Bubu 40–55% frame height, eyes ~40% from top, center-left, 9:16
- [ ] **Regression check**: background brightness is visibly LESS intense than
      Scene 4's — if Scene 3 and Scene 4 look similarly bright, this fails
      (the specific defect found in the current asset)

### Scene 4 — Payoff (RE-SLOT candidate from current scene_5, validate before reuse)
- [ ] Delight expression: eyes in closed crescent shapes, mouth in wide open
      closed-curve smile (not an "o")
- [ ] Body leaning back, celebratory/hop posture, ears flapped outward showing
      #F4B8C0
- [ ] Trunk at 215–225° (up and back toward near ear), one smooth curve
- [ ] Wonder Pebble flashing turquoise (#4FD1C5), 0.97–1.00 saturation —
      **visually distinct** from the Sunrise-Cream flood (not merged/blended
      into one color/shape)
- [ ] Sunrise-Cream light-flood (#FFE3A8) at 0.85–0.93 saturation in the
      light-gap/floor area
- [ ] 2–3 particle/sparkle dots radiating from the light-gap
- [ ] On-screen text zone clear: "Arre, Bubu! ...Pop!" must fit in upper
      negative space without overlapping Bubu/pebble/flood
- [ ] Composition: Bubu 40–55% frame height, eyes ~40% from top, center-left, 9:16
- [ ] **This is the only slot permitted to show hero-band (0.85+) saturation**
      — confirm no other slot's final asset reaches this band

### Scene 5 — Loop / Meadow Remembers (NEW generation, lighting-reference from scene_01, NOT scene_03)
- [ ] Pose/framing closely matches Scene 1 (Curious: wide eyes, soft
      eyebrows, closed-curve smile, ears relaxed/forward, pink inner-ear NOT shown)
- [ ] Trunk at 0° resting curl, matching Scene 1 exactly
- [ ] Light-gap back to **dim** 0.24–0.30 saturation, matching Scene 1's level
      — explicitly NOT a bright/sunny meadow
- [ ] Wonder Pebble: same size/position as all prior scenes, with a **faint**
      persistent turquoise tint — visibly turquoise but clearly gentler than
      Scene 4's flash/glow, and NOT back to plain pale gray-blue
- [ ] No flowers or other new background elements beyond Scene 1's ≤2 set-pieces
- [ ] No on-screen text
- [ ] Composition: Bubu 40–55% frame height, eyes ~40% from top, center-left, 9:16
- [ ] **Loop check**: side-by-side with Scene 1 — only difference visible
      should be the pebble's faint turquoise tint
- [ ] **Regression check**: overall brightness must read as "dim Nook," not
      "sunlit meadow" (the specific defect found in the current asset)

---

## 4. Go/No-Go Criteria Before Assembly

Assembly (ffmpeg/editing) may resume **only when ALL of the following are true**:

1. **All 6 slots pass their Scene-by-Scene Validation Checklist (§3)** —
   both the PNG keyframe and the resulting Higgsfield video for each slot.
2. **Emotional progression is monotonic and correct**: Scene 1 (dim/calm) →
   Scene 2 (Ear-Perk+Tap, pebble unchanged) → Scene 3 (frozen Surprise, pale
   light-gap, pebble calm) → Scene 4 (single brightest/loudest Delight moment,
   turquoise flash + Sunrise-Cream flood) → Scene 5 (back to dim, pebble
   faintly glowing). Verified by placing all 6 final keyframes in a single
   contact sheet in scene order and confirming brightness/energy rises only
   once, peaking at Scene 4.
3. **"One quiet world, one loud payoff" holds**: Scene 4 is the *only* slot
   with hero-band (0.85–1.00) saturation anywhere in frame. No other scene's
   pebble or background reaches that band.
4. **Loop pair validated**: Scene 5's final frame and Scene 1's opening frame
   match in pose/framing/lighting, differing only in the pebble's faint
   turquoise tint — checked side-by-side, not from memory.
5. **No cross-scene content duplication**: each of the 6 final PNGs is
   visually distinct from the other 5 in pose+lighting (no two scenes
   accidentally share the same content, as scenes 3/4/5 did in the current set).
6. **File naming consistent**: all 6 images follow `episode_02_images/scene_0N.png`
   (fixing the current `scene_5.png` exception), all 6 videos follow
   `videos/scene_0N.mp4`.
7. **Archived, not deleted**: the current (invalidated) `episode_02_images/`
   and `videos/` contents are preserved in an archive location, so no prior
   generation work is lost if a re-slotted asset needs revisiting.

**Until all 7 conditions are met: NO ffmpeg assembly, no editing-plan timing
work, and no further review of any exported video should proceed.** Once met,
assembly work can resume from `editing_plan.md` (re-validating its trim
windows against the new clips' actual durations, since regenerated clips may
not have identical durations to the invalidated ones).
