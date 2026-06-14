# Bubu Production Bible

**Purpose:** This is the **operating manual** for making Bubu episodes. Everything in this document is downstream of the canon (`canon/`) — if anything here ever appears to conflict with `canon/bubu_project_canon.md` or the six-layer canon it governs, the canon wins and this document is wrong and must be corrected.

A new producer, editor, animator, or AI assistant should be able to read **this single document**, follow it step by step, and produce an episode that passes `production/quality_checklist.md` at 90+ — without first reading the rest of the repository. Where a step requires a canon detail (a color, a rule, a rotation angle), this document tells you *which file* holds the authoritative value rather than restating every number, so that this manual never goes stale relative to canon.

---

# 1. Production Philosophy

These four principles resolve every "which way do we go" decision that isn't already answered by canon. When in doubt, return to this section before improvising.

## Character-First, Not Rhyme-First

Bubu episodes are not built around a catchy tune that a character happens to appear in. They are built around **Bubu** — a specific body, a specific set of motions (the Wobble, the Ear-Perk & Point, the trunk-rotation pose table), and a specific emotional arc (Wonder → Focus → Anticipation → Joy → Wonder). Music, narration, and on-screen text exist to *support* that character performance, never to replace it.

**In practice:** if a new episode idea starts with "wouldn't it be fun if Bubu sang a little song about—", stop. Start instead from "what does Bubu *notice*, and what does Bubu's trunk *do* about it?" The song, if any, comes after — and per `canon/bubu_franchise_vision.md` §9, standard-pillar episodes carry **no songs or dialogue-heavy storytelling** at all.

## Franchise-First, Not Viral-Video-First

Every episode is a brick in a thousand-episode wall. A single episode that performs spectacularly but introduces a one-off visual gag, an off-model pose, or a new "fun" character trait that contradicts canon is a **net loss**, even if its individual metrics are good — because the next 999 episodes now have to either repeat the contradiction or visibly abandon it.

**In practice:** `production/channel_launch_plan.md` §6 (Episode Performance Framework) explicitly forbids changing canon based on a single Hit Episode. Performance data is *evidence to consider*, never a mandate to deviate. New locations, objects, hero colors, and Wonder Pebble states are added only per `seasons/season_01_master_roadmap.md` and `canon/bubu_universe_bible.md`'s World Rules — never improvised mid-production because "it'll look cool."

## Consistency Over Novelty

The product *is* the consistency. A toddler — and a parent — should be able to recognize "this is Bubu" within 2 seconds of any episode, from episode 1 to episode 1000, with zero ambiguity. Novelty (new locations, new objects, new vocabulary, new hero colors) is introduced **only at the rate the canon and roadmap allow**, and always *within* the locked identity, never by changing it.

**In practice:** every episode reuses the same body, palette, trunk shapes, expression set, camera framing, beat structure, and signature behaviors. The only things that change episode-to-episode are: the location (from the 10 established locations), the hero color (one per episode), the build/payoff words, the payoff object/action, and which Wonder Pebble(s) are created or interacted with. Nothing else is a "creative choice" — it's a fixed slot to fill from canon.

## Preschool Psychology Principles

Every structural choice in Bubu traces back to how 0-4 year-olds actually process media:

- **Predictability builds trust.** The 5-beat structure (Hello → Build → Anticipation → Payoff → Loop) never changes shape, only content — so a toddler learns *when* to expect the exciting part, which is itself calming.
- **Repetition is the lesson, not a flaw.** World Rule #3 ("good things take three tries") and the Build word's 2-3 pulses aren't padding — repetition at this age is how words and cause-effect relationships are encoded.
- **Calm is the default state; loud is the reward.** World Rule #1 (one quiet world, one loud payoff per episode) keeps the background muted and reserves the highest saturation for a single Payoff moment — overstimulation is the single biggest risk in children's media for this age group, and Bubu is explicitly positioned (`canon/bubu_franchise_vision.md`) as the *calm* alternative. Exact saturation ranges (including the Episode 02+ vibrancy update) live in `canon/visual_style_guide.md` — do not hardcode values here.
- **One lesson at a time.** `canon/content_pillars.md` and `production/quality_checklist.md` Section D require a single learning objective per episode — mixed lessons are an automatic-fail-adjacent red flag because toddlers at this age cannot productively process two new concepts in 12 seconds.
- **The world should feel alive without feeling busy.** "The meadow remembers" (World Rule #8) — Pebble Hill's growth and persisted glow-objects — gives repeat viewers a sense of an ongoing relationship with Bubu's world, which is what turns a "watched it once" viewer into a "returning viewer" (`production/channel_launch_plan.md` §5's most important long-term metric).

---

# 2. End-to-End Production Pipeline

Every episode passes through these eleven steps, **in this order, with no skipping**. Each step has a single clear output that the next step consumes. If a step's output is missing or incomplete, the next step cannot begin.

```
Idea → Episode Selection → Canon Validation → Story Creation → Image Prompt Creation
  → Image Generation → Video Generation → Audio Creation → Editing → QA → Publishing
```

## Step 1 — Idea

**Input:** Nothing (this is the starting point). **Output:** A one-line concept: *pillar + location + a single noticeable thing Bubu's trunk does to it.*

Ideas are not invented freely. They come from one of two sources:
- `seasons/season_01_master_roadmap.md` — the default source. Each episode slot already specifies pillar, location, and arc context.
- `production/pilot_episode_ideas.md` — for early pilot episodes or as a source of *texture* (specific objects, phrasing) when fleshing out a roadmap slot.

A valid idea names: which of the 8 pillars (`canon/content_pillars.md`), which of the 10 locations (`canon/bubu_universe_bible.md`), and what Bubu's trunk does (one of: Point, Hold, Spray, Pat/Tap — per `canon/bubu_personality_bible.md`'s "only Bubu's trunk starts wonder" rule).

## Step 2 — Episode Selection

**Input:** A roadmap slot or pilot idea. **Output:** A confirmed episode number, title, and the four "must decide before generating anything" items: **pillar, hero color, build word, payoff word.**

Selection is **not** "pick whichever idea feels most fun today." The roadmap's episode order is itself part of the product — `production/channel_launch_plan.md` §7 states the roadmap order is the *default publishing order*, and `seasons/season_01_master_roadmap.md`'s Episode Dependency Notes are hard constraints (e.g., a Pebble Hill growth episode cannot be produced before the episodes that create the pebbles it grows; Hindi-word episodes in Arc 4 cannot precede the matching English-concept episode).

**Checklist for this step:**
- [ ] Episode number and title match the roadmap (or are a deliberately-flagged pilot episode).
- [ ] Pillar is confirmed and is not a repeat of the immediately preceding 1-2 episodes' pillar (per `production/channel_launch_plan.md` §7's "rotation, not blocks").
- [ ] Hero color is chosen and checked against the last 2-3 published episodes for near-duplicates (Continuity Check, `production/quality_checklist.md` Step 3).
- [ ] Build word and payoff word are drafted (1-2 words each).

## Step 3 — Canon Validation

**Input:** The confirmed episode slot. **Output:** A short validation note confirming the episode does not violate canon — or a list of what must change before it can proceed.

This is the step that prevents drift *before* a single prompt is written. Walk through, in order:

1. **Identity** (`canon/bubu_core_identity_block.md`) — does this episode require Bubu to do anything outside the fixed body/palette/trunk-rotation vocabulary? (It never should. If an idea seems to require it, the idea is wrong, not the identity.)
2. **Personality** (`canon/bubu_personality_bible.md`) — does the episode correctly place the Wobble (running in Scenes 1/2/5, absent in Scene 3), the Ear-Perk & Point (Scene 1→2 transition only), the mandatory Scene 0 "BUBU!" Brand Sting, and "Arre, Bubu! ...[payoff word]!" (Payoff beat only)? Does narration avoid any self-introduction (Voice Constraint)? If this is a Big Feelings/Whisper Grass episode, does any fear pose fully resolve before the Delight payoff?
3. **Universe** (`canon/bubu_universe_bible.md`) — is the location one of the 10 established locations (within Bubu Grove), used with its established visual design? Does this episode's Wonder Pebble appear from Scene 1 and flash turquoise (`#4FD1C5`) at the Anticipation→Payoff transition to trigger "Wow!", following the announce→deliver→crown payoff hierarchy and the 0.3s flash-timing window, per Season Guardrail #5's bookkeeping for which pebble is being discovered? Do all 9 World Rules hold, including the Audio Ownership Rule (#9 — each signature sound stays in its one designated moment) and the Episode Continuity Rule (§10 — Pebble Hill tier, Flagship claim log, hero-color non-repetition window)?
4. **Content Pillar** (`canon/content_pillars.md`) — is there exactly one learning objective, matching the assigned pillar?
5. **Engagement Framework** (`canon/engagement_framework.md`) — does the 12s (or 10s/15s variant) 5-beat structure fit this idea without forcing or padding?
6. **Visual Style** (`canon/visual_style_guide.md`) — background set-piece count ≤2, object count within the 3-5 cap, single hero color, static camera.
7. **Franchise Vision** (`canon/bubu_franchise_vision.md`) — does anything in this episode brush against §9 ("What Bubu Should Never Become")? (Loud/chaotic, conflict, redesign, ad-pressure, generic catchphrase, cast/world expansion ahead of canon, merch-driven changes, anything unsafe for 0-2s.)
8. **Roadmap dependencies** (`seasons/season_01_master_roadmap.md`) — are all prerequisite episodes for this slot already produced?

If any check fails, the episode does **not** proceed to Step 4 until the idea is adjusted. This step is deliberately cheap (it's a checklist pass, not new creative work) precisely so that expensive downstream steps (image/video generation) are never wasted on an idea that was never going to pass QA.

## Step 4 — Story Creation

**Input:** A validated episode concept. **Output:** The completed **Scene Breakdown table** (Section 1 of the episode's full package) — all 5 beats with Time, Expression/Trunk, Visual, On-screen text, and Narration columns filled in, plus the Ear-Perk & Point note and the Wonder Pebble note.

This is where the episode's specific *content* is written, using the most recently produced episode's full package as a structural template (do not write from a blank page — copy the table structure from the prior episode and replace content). Every cell must trace back to a canon rule:

- **Scene 0 (BUBU! Brand Sting, -0.5-0s, Episode 02+):** Curious expression, trunk at 0°, Wobble running, "BUBU!" text + chime, hard cut into Scene 1 (`canon/engagement_framework.md` Beat 0).
- Scene 1 (Hello, 0-2s): Curious expression, trunk at 0°, Wobble running, establishes location + any persisted glow-objects, including this episode's pale gray-blue **Wonder Pebble** (`canon/bubu_universe_bible.md` §4).
- Scene 2 (Build, 2-6s): Focused expression, trunk at ~90°, the chosen trunk-function (Point/Hold/Spray/Pat-Tap) repeated per World Rule #3 (1-3 reps), build word pulses.
- Scene 3 (Anticipation, 6-8s): Surprise expression, trunk at ~180°, all motion stops, Wobble paused, silent.
- Scene 4 (Payoff, 8-11s): Delight expression, trunk at ~215-225°, the Wonder Pebble flashes turquoise (`#4FD1C5`) triggering "Wow!", immediately followed by the single saturated payoff moment in the episode's hero color, "Arre, Bubu! ...[payoff word]!"
- Scene 5 (Loop, 11-12s): returns to Scene 1's pose/framing, persisted state updates (Wonder Pebble now turquoise, etc.) carried forward.

For 10s/15s variants, adjust per `canon/engagement_framework.md`'s variant rules (10s = 2 Build reps; 15s = 3 slower Build reps + extended 4s Payoff) — but the beat *order* and *function* never change.

## Step 5 — Image Prompt Creation

**Input:** The completed Scene Breakdown. **Output:** 5 image prompts (one per scene), each built from the **Shared Bubu Description** + scene-specific pose/expression/background details + the shared negative prompt.

Every prompt starts with the verbatim **Shared Bubu Description** (copy it from the most recent episode's full package — it should be byte-identical across all episodes, sourced from `canon/bubu_core_identity_block.md`). Append:
- The episode's background description (location's established visual design, ≤2 set-pieces, saturation per `canon/visual_style_guide.md`'s ranges — Episode 02+ uses the vibrancy-updated ranges, except where a scene calls for the Payoff saturation).
- The scene's specific pose: expression name + exact trunk rotation in degrees, per the pose table.
- Any objects/pebbles and their current glow states (carried forward from the previous episode that touched them).
- The shared negative prompt (`references/bubu_master_prompt.md` / `references/bubu_reference_generation.md`) — tusks, wrinkles, skin texture, toenails, extra limbs, second character, etc.

See Section 4 below for how these prompts interact with reference images.

## Step 6 — Image Generation

**Input:** 5 image prompts. **Output:** 5 approved keyframe images, one per scene, each scored against `production/bubu_consistency_checklist.md` (35-point scale, pass ≥28 with no category below 3, automatic regenerate on any category scoring 1).

Generate Scene 1 first — it is the episode's reference frame. Once Scene 1 passes the consistency checklist, generate Scenes 2-5 using Scene 1 as a visual/identity reference (img2img, character-lock, or reference-image feature), changing only what the Scene Breakdown specifies (expression, trunk rotation, object/glow states). See Section 4 for the full drift-prevention workflow.

## Step 7 — Video Generation

**Input:** 5 approved keyframes + 5 video prompts (motion-only descriptions, written alongside the image prompts in Step 5). **Output:** 5 video clips, each reviewed for static camera, correct motion, and no mid-clip artifacts.

Image-to-video, one keyframe per clip. See Section 5 for the full camera/motion/duration/transition rules.

## Step 8 — Audio Creation

**Input:** The Scene Breakdown's timing and the episode's chosen build/payoff words. **Output:** One continuous background music bed, one single SFX placed at the Payoff frame, and (if narrated) the narration track.

See Section 6 for the full music/SFX/voice/catchphrase rules.

## Step 9 — Editing

**Input:** 5 video clips + audio assets. **Output:** A single assembled file, hard-cut (no transition effects) in scene order, with text overlays, music, SFX, and narration synced per the Editing Plan (Section 4 of the full package), runtime 10-15s (default 12s).

**Episode 02+:** before exporting, **prepend** the evergreen Scene 0 master asset (`production/assets/bubu_brand_sting.mp4`, 0.5s, byte-identical across all episodes — see `canon/engagement_framework.md` Beat 0) to the assembled Scenes 1-5 via concat. This is the only step that touches Scene 0; Scenes 1-5's assembly, text, music, and SFX work exactly as described above, unchanged. Total exported runtime becomes 10.5-15.5s.

## Step 10 — QA

**Input:** The assembled episode. **Output:** A completed `production/quality_checklist.md` score sheet (Sections A-F, Red Flag List, Automatic Fail Conditions) and a PASS/FAIL decision, following that document's 4-step Review Process.

A score below 90, or any automatic-fail condition, sends the episode back to the relevant earlier step (most often Step 6, 7, or 9) — never forward.

## Step 11 — Publishing

**Input:** A signed-off episode (`production/quality_checklist.md` §4 Episode Sign-Off Process completed). **Output:** A published YouTube Short with metadata, in the correct playlist(s), logged in the episode tracker.

See Section 7 for the full publishing workflow.

---

# 3. Episode Creation Workflow

## Required Files

Every episode produces exactly **one** primary document: `episode_{NN}_full_package.md`, following the structure established by Episodes 02-10 (the Episode 01 multi-file structure — separate `scene_breakdown.md`, `image_prompts.md`, `video_prompts.md`, `editing_plan.md` — is **deprecated**; do not create new episodes that way). The full package contains, as numbered sections:

1. **Scene Breakdown** — the 5-beat table, Ear-Perk & Point note, Wonder Pebble note.
2. **Image Prompts** — Shared Bubu Description + 5 scene prompts + shared negative prompt.
3. **Video Prompts** — 5 motion-only descriptions.
4. **Editing Plan** — scene order/timecodes table, SFX, music, on-screen text timing, narration timing, loop check.
5. **Educational Objective** — 1-2 sentences naming the single learning objective and how this episode delivers it.
6. **Brand-Building Objective** — 1-2 sentences naming what this episode reinforces about Bubu's identity, world, or franchise continuity.

The package also carries a header block: Pillar, Location, Hero color (hex), Build word, Payoff word, Runtime, Status, and a "Canon basis" line listing which canon files this episode was built from.

## Required Folder Structure

```
episodes/
  episode_{NN}_{slug}/
    episode_{NN}_full_package.md
```

`{NN}` is zero-padded to 2 digits (`01`-`99`) for Season 1; `{slug}` is a short snake_case version of the episode title (e.g., `episode_09_snack_time`). One folder per episode, created at Step 4 (Story Creation) and not before — an empty folder for an unproduced episode is not created in advance.

## Required Outputs

By the end of Step 11 (Publishing), an episode's folder should be understood to also have produced (these are *not* committed to this text repository, but their existence is a Sign-Off requirement per `production/quality_checklist.md` §4):

- 5 approved keyframe images (Scenes 1-5).
- 5 video clips (Scenes 1-5).
- 1 assembled, exported video file: 9:16 vertical, ≥1080×1920, MP4 (H.264), 30fps, named `bubu_ep{NN}_{pillar}_{keyword}.mp4` per `production/production_checklist.md` Phase 7.
- 1 thumbnail frame, generated separately for small-preview readability.
- 1 completed `production/quality_checklist.md` score sheet and sign-off record row.
- 1 metadata package (title, description, hashtags) per Section 7 below.

---

# 4. Image Generation Workflow

## How Reference Images Are Used

Bubu has a locked set of **8 reference images** (`references/bubu_reference_generation.md`): a Master image, Front View, Three-Quarter View (the production-default camera angle), Side View, and the 4 expression variants (Curious, Focused, Surprise, Delight) — each generated from `references/bubu_master_prompt.md`'s canonical prompt with full positive/negative blocks and recommended settings (CFG 7-9, 30-50 steps, locked seed, identity-reference strength 0.6-0.9).

These 8 images are the **ground truth**. Every episode's Scene 1 keyframe is generated using the Three-Quarter View reference plus the relevant expression reference as identity-reference inputs (img2img / character-lock), at the same identity-reference strength range. Scenes 2-5 of the *same episode* then use that episode's own Scene 1 keyframe as the reference, so that any episode-specific background/object elements stay consistent across its 5 scenes — but Scene 1 itself must always trace back to the 8 master references, not to a previous episode's Scene 1. This is what prevents **compounding drift**: each episode's identity comes from the same fixed source, not from a chain of "episode N+1 copied episode N which copied episode N-1..."

## How Bubu Drift Is Prevented

Three layers of defense, applied in order:

1. **Prompt-level (prevention).** Every prompt — reference or episode — uses the verbatim Shared Bubu Description and the shared negative prompt. Nothing about Bubu's body, palette, or proportions is ever paraphrased or "improved" episode-to-episode. If the description text itself needs to change, that is a canon change (`canon/bubu_core_identity_block.md`), not a per-episode decision.
2. **Per-image scoring (detection).** Every generated keyframe is scored against `production/bubu_consistency_checklist.md`'s 35-point, 7-category rubric (Silhouette, Trunk, Ear, Color, Expression, Toddler Appeal, Thumbnail Readability accuracy). Pass = ≥28/35 with no category below 3. **Any category scoring 1 triggers automatic regeneration** — no exceptions, regardless of overall score.
3. **Episode-level scoring (final gate).** The assembled episode is scored against `production/quality_checklist.md` Section A (Character Consistency, 40 points) — which explicitly deducts points for *any* scene where a sub-category fails, even if the other 4 scenes are correct. One bad keyframe is enough to fail an otherwise-perfect episode.
4. **Periodic drift check (long-horizon).** Per `production/production_checklist.md` Phase 9.3, every ~10 episodes, sample a frame and re-check it against the 8 master references directly — this catches *slow* drift that no single episode's scoring would flag (e.g., the body color has crept 5% warmer over 10 episodes, with each individual step within tolerance).

## When Images Must Be Regenerated

Regenerate a keyframe immediately if **any** of the following are true:

- It scores below 28/35 on `production/bubu_consistency_checklist.md`, or any single category scores 1.
- It exhibits any `production/quality_checklist.md` Automatic Fail condition (tusks/wrinkles/texture, second character, malformed trunk/ears, broken palette/outline, etc.) — these are checked at image stage, not left to be caught at final QA.
- It is visually inconsistent with the *other 4 scenes of the same episode* in ear size/shape, body color, background composition, or camera framing (`production/production_checklist.md` 3.3).
- It contradicts an established Wonder Pebble or glow-object state from a prior episode (e.g., shows a previously-lit pebble as unlit with no in-episode explanation).
- The episode's Canon Validation (Step 3) was later found to have missed something — in this case, regeneration starts from Step 4 (Story Creation), not just the image.

Regeneration always re-applies the *same* prompt and reference chain described above — never a "tweaked" prompt designed to nudge the output in a new direction. If the same prompt repeatedly produces a failing result, the problem is the generation settings (seed, CFG, reference strength) or the reference image itself, not the prompt text.

---

# 5. Video Generation Workflow

## Camera Rules

- **Static, locked-off 9:16 vertical camera for the entire episode.** No pans, tilts, zooms, drifts, or cuts — ever. This is an Automatic Fail condition in `production/quality_checklist.md` if violated even briefly.
- Bubu occupies **40-55% of frame height**, eyes positioned **~40% from the top**, **center-left** of frame — in every scene, every episode (`canon/visual_style_guide.md`).
- The "cut" between scenes (Section 9 below) is an editing-stage hard join between separately-generated clips, not an in-clip camera cut — from the camera's point of view within any single generated clip, nothing moves but Bubu and the episode's objects.

## Motion Rules

- Only **Bubu's trunk** initiates "wonder" (World Rule #2) — backgrounds, objects, and pebbles react to the trunk's action, never move on their own initiative.
- The **Bubu Wobble** (gentle idle sway) runs continuously in Scenes 1, 2, and 5, and is **absent** in Scene 3 — the absence must be clearly readable as a *deliberate stillness*, not just "less motion."
- The **Ear-Perk & Point** — both ears lifting/rotating ~10-15° forward — occurs at the exact instant the trunk snaps from its resting curl into the Build action, at the Scene 1→2 transition, and **only there**, once per episode.
- Build-beat repetitions (1-3, per World Rule #3) must be **identical in timing and size** to each other, unless the episode deliberately uses the "grows each time" variant (each rep larger than the last) established in Episode 04 and reused in Episode 10 — and even then, the *growth pattern* itself must be smooth and even, not random.
- The Payoff beat is the episode's **only** moment of full-saturation motion and the **only** hop/flap — everything before it is comparatively restrained, so the Payoff reads as a genuine release.
- The Loop beat (Scene 5) eases *back* from the Payoff's energy into Scene 1's resting pose — it is a deceleration, not an instant snap.

## Scene Duration Rules

Per `canon/engagement_framework.md`, the default 12s episode uses:

| Scene | Beat | Duration |
|---|---|---|
| 1 | Hello | 2s |
| 2 | Build | 4s |
| 3 | Anticipation | 2s |
| 4 | Payoff | 3s |
| 5 | Loop | 1s (generate at 2s minimum, then trim) |

For the 10s variant, Scene 2 is reduced to 2 reps (shorter Build). For the 15s variant, Scene 2 extends to 3 slower reps (6s) and Scene 4 extends to 4s. **The 5-beat order and each beat's function never change** — only Scene 2 and Scene 4's durations flex, and the **5-scene episode body** (Scenes 1-5) must stay within **10-15 seconds** (an Automatic Fail condition if violated).

**Episode 02+:** every episode is preceded by a mandatory **Scene 0 — "BUBU!" Brand Sting** (0.5s, hard-cut into Scene 1; see `canon/engagement_framework.md` Beat 0 and `canon/bubu_personality_bible.md` §7). Total exported file runtime is therefore **10.5-15.5 seconds** (Scenes 1-5's 10-15s plus the 0.5s sting).

## Transition Rules

**There are no transition effects, ever.** The 5 scene clips are concatenated with **hard joins only** (Section 9, Step 9 — Editing). Visual continuity between scenes comes entirely from each scene's keyframe matching the *end state* of the previous scene and the *start state* of the next — i.e., continuity is solved at the Image Generation stage (Step 6), not the editing stage. If a hard join "feels" like it needs a transition effect to smooth it over, that is a signal the keyframes themselves don't connect — go back to Step 6, not forward to adding a crossfade.

The one exception that is *not* a transition effect: the Scene 5 → Scene 1 **loop point**, when the platform auto-replays the video. This is solved the same way — Scene 5's trimmed final frame must closely match Scene 1's opening frame (per-episode Loop Check in the Editing Plan) — so that the loop reads as continuous motion, not a cut.

## Episode 01 Grandfathering

**Episode 01 ("Bubu's Splash") is permanently exempt from the 2026-06-14 Episode 02+ canon update's items 1-6** (every-episode Wonder Pebble with turquoise flash, "Bubu Grove" naming, the vibrancy/saturation bump, the mandatory Scene 0 Brand Sting, the core action-word vocabulary, and the No Self-Introductions voice constraint). Episode 01 is **not retroactively edited** to add any of these — its existing exported file (`episodes/episode_01_bubus_splash/final/bubu_ep01_waterplay_splash_final.mp4`) remains the canonical, published Episode 01.

- This exemption is permanent, not a temporary backlog item — Episode 01 predates the Wonder Pebble/Bubu Grove/Brand Sting/vocabulary system entirely, and rebuilding it to match would be a full re-production, not a fix.
- An **optional remaster** of Episode 01 (bringing it in line with Episode 02+ canon) may be considered only **after Episode 25** has published, purely as a "season 1 polish" pass — never as a blocker to Episode 02+ production, and never scheduled into the regular roadmap cadence.
- All canon validation, continuity bookkeeping (§10), and Pebble Hill tracking begin counting from **Episode 02** — Episode 01 contributes no Wonder Pebble, hero-color-history, or Pebble Hill entry to the continuity system.

---

# 6. Audio Workflow

## Music

One **continuous background music bed** per episode — gentle, warm, major-key, instrumental — that loops seamlessly from Scene 5 back into Scene 1 (matching the visual loop). The music is not scene-segmented; it is a single continuous piece with internal dynamics:

- Steady under Scenes 1-2, with **percussion ticks synced to each Build repetition** (one tick per rep; pitch/intensity may step up slightly with each rep, especially for "grows each time" episodes).
- A brief **quiet dip through Scene 3** (Anticipation) — the music itself "holds its breath."
- The episode's **biggest swell, timed exactly to the Payoff moment** (0:08.0 in a default 12s episode) — synced with the single SFX and the "Arre, Bubu! ...[payoff word]!" beat.
- Eases back to its steady state through Scene 5, ready to loop.

Daily Routines-pillar episodes use a calmer, slightly slower percussion pacing throughout, per the established tonal variation (Episodes 06/09) — this is the *only* pillar-specific music variation; all other pillars share the same tempo character.

## SFX

**Exactly one Payoff SFX per episode** (World Rule #6), placed precisely at the Payoff frame — and nowhere else. This is checked twice: at QA (`production/quality_checklist.md` Automatic Fail conditions — "more than one SFX, or the single SFX plays anywhere other than the Payoff moment") and at the Red Flag List level (SFX more than ~2 frames early/late relative to the Payoff visual).

The SFX character should match the episode's payoff: a "splash" for Water Play, a "chime/sparkle" for a glow-object lighting up, etc. — chosen to be the *richest/fullest* version appropriate to the episode's place in its arc (e.g., Episode 10's splash SFX was explicitly the "fullest, richest version used yet" as the first-10 capstone). Build-beat repetitions are **never** carried by SFX — they are carried by the music's percussion ticks (see Music, above), preserving the single-SFX rule.

**Episode 02+ — Wonder Pebble discovery twinkle and Brand Sting chime:** two additional fixed audio cues exist alongside the Payoff SFX — the Beat 0 brand-sting chime and the Wonder Pebble discovery twinkle (woven into the music bed at the Anticipation→Payoff boundary, per World Rule #6's amendment). Per the **Audio Ownership Rule** (World Rule #9, full spec in `canon/bubu_audio_bible.md`), these three cues — brand-sting chime, discovery twinkle, Payoff SFX — each belong to exactly one moment and are never substituted, reordered, or reused for a different beat.

## Voice

Narration is sparse, simple, and tightly synced to on-screen text:

- Scene 0 (Episode 02+): "BUBU!" + soft chime — the brand sting's only sound.
- Scene 1: the single word "Bubu!"
- Scene 2: the build word, spoken once per repetition (e.g., "Tap! Tap! Tap!") — drawn from the core action-word vocabulary (`canon/content_pillars.md`) where applicable.
- Scene 3: silence — no narration.
- Scene 4: "Wow!" (the Wonder Pebble's discovery flash) immediately followed by "Arre, Bubu! ...[payoff word]!" — delivered with the most energy of the episode.
- Scene 5: optional, soft, wordless content hum — never new words.

No dialogue beyond this structure exists in a standard-pillar episode. Narration pacing should be consistent with prior episodes in the same pillar — a Red Flag List item is "narration pacing feels rushed or compressed compared to prior episodes in the same pillar," since toddlers register pacing changes even when they can't articulate them.

**No self-introductions:** Bubu never speaks or displays a self-introduction sentence (e.g., "Hi, I'm Bubu the Elephant!"). Recognition relies entirely on the Brand Sting, visual identity, and the structure above — see `canon/bubu_personality_bible.md`'s Voice Constraint. This is an Automatic Fail condition if violated.

## Catchphrase Usage

**"Arre, Bubu!"** is Bubu's signature catchphrase and is used **exactly once per episode**, always paired with that episode's payoff word, always at the Payoff beat, always as "Arre, Bubu! ...[payoff word]!" — never delivered early, never delivered without the payoff word, never genericized or translated (it remains "Arre, Bubu!" in English-feed *and* future Hindi-feed content per `canon/bubu_franchise_vision.md`). It is simultaneously the largest/boldest on-screen text treatment of the episode and the most energetic narration delivery. A repeat viewer should be able to recognize "this is a Bubu episode" from this moment alone.

---

# 7. Publishing Workflow

## Thumbnail

Generated **separately** from the 5 in-video keyframes, using a dedicated thumbnail prompt optimized for small-preview readability (per `production/production_checklist.md` Phase 7.2 and the Thumbnail Readability category of `production/bubu_consistency_checklist.md`). The thumbnail should typically be drawn from the Payoff beat — the episode's single most saturated, most legible moment — since this is what a parent scanning a feed needs to recognize in under a second.

## Title

Formula (per `production/channel_launch_plan.md` §4): **`Bubu [Build/Payoff Word]! [Emoji] | [Pillar/Theme] for Toddlers`**

Examples:
- Episode 01: "Bubu Splash! 💦 | Water Play for Toddlers"
- Episode 05: "Bubu One! 🐾 | Counting for Toddlers"
- Episode 09: "Bubu Yum! 🍑 | Daily Routines for Toddlers"

## Description

Formula: **one sentence naming the build/payoff words** + **one curiosity-framed replay invitation**. Never includes "like and subscribe" pressure language — per `canon/bubu_franchise_vision.md` §9, Bubu is never ad-heavy or manipulative, and that standard extends to its own channel's calls-to-action.

**Episode 02+ — Bubu Grove closing line:** every description ends with the fixed closing line **"Another wonder discovered in Bubu Grove! 🌿"** — the only place "Bubu Grove" appears as a proper name in published metadata (it is never shown on-screen, per `canon/bubu_universe_bible.md` §6).

## Tags

**Episode 02+ — fixed 6-tag, 4-tier hashtag system** (extends the 5-tag system per `production/channel_launch_plan.md` §4):
1. One core brand tag: `#Bubu`
2. One pillar tag (e.g., `#WaterPlay`, `#Counting`, `#DailyRoutines`)
3. One keyword/location tag (e.g., `#Splash`, `#PebbleHill`)
4. One fixed world tag, always present: `#BubuGrove`
5-6. Two fixed category tags, always present: `#ToddlerLearning #PreschoolLearning`

Episode 01 retains the original 5-tag system (no `#BubuGrove` tag), per Episode 01 Grandfathering above.

## Playlist

Every episode is added to:
- **"Bubu — Start Here"** (Episodes 1-20, the new-viewer onboarding playlist).
- Its **pillar playlist** (one per content pillar).
- **"Pebble Hill Story"**, if the episode creates or interacts with a Wonder Pebble (the World/Treasure-thread episodes — 1, 3, 5, 8, 17, 33...).

Upload order follows the roadmap's episode order (`production/channel_launch_plan.md` §7) — publishing is never reordered for "what we think will perform better," since dependency rules (Section 2, Step 2 above) make most reordering invalid anyway.

---

# 8. Scaling Workflow

## How Episodes 1-10 Differ From Episodes 50-100

The **process** does not change from Episode 1 to Episode 1000 — Section 2's pipeline, Section 3's file structure, and every canon rule apply identically at any episode number. What changes is **what the process is building on**:

| Aspect | Episodes 1-10 | Episodes 50-100 |
|---|---|---|
| **Reference chain depth** | Scene 1 keyframes trace back to the 8 master references with almost no intermediate history. | Scene 1 keyframes still trace back to the same 8 master references (Section 4) — but Step 3 (Canon Validation) and Step 4 (Story Creation) must now also cross-check dozens of established Wonder Pebbles, glow-objects, and location states. The *generation* process is identical; the *bookkeeping* of "what already exists in this world" is much larger. |
| **Continuity surface area** | Few persisted states to track (e.g., by Episode 10: one Pebble Hill cluster, a handful of glow-objects across The Puddle and The Nook). | Many persisted states — Pebble Hill alone may hold a dozen+ pebbles by Episode 50-60 (per `seasons/season_01_master_roadmap.md`'s growth-episode list: 17, 33, 59, 76, 79, 94, 99). The Continuity Check (`production/quality_checklist.md` Step 3) becomes proportionally more important, not optional. |
| **Pillar/location coverage** | Establishing pillars and locations for the first time — most episodes are "firsts" (first pebble, first counting episode, first Daily Routines episode). | Most pillars and all 10 locations are long-established. New episodes are primarily *variations within* established territory, plus the arc-specific introductions scheduled by the roadmap (Hindi words in Arc 4, Animal Friends teases in Arc 5). |
| **Hero color management** | Few prior hero colors to avoid duplicating. | The Continuity Check's "no near-duplicate hero color vs. recent episodes" check requires checking against a much longer recent history — this is a bookkeeping load increase, not a rule change. |
| **Production cadence pressure** | Per `production/channel_launch_plan.md` §3, the launch month ramps from 3/week to daily — inventory (Episodes 11+) must be produced *ahead* of publishing from day one. | By Episodes 50-100, cadence should be steady-state (daily), with the production pipeline running comfortably ahead of the publish schedule — if it isn't, that's a Section 2 pipeline problem to fix, not a reason to skip Section 2 steps. |
| **Long-form inputs** | No long-form compilations yet (fewer than 30 published Shorts). | Episodes 50-100 are themselves the *raw material* for 10-min and 30-min compilations (`production/channel_launch_plan.md` §8) — so editing (Step 9) increasingly also means: ensure each episode's hard cut points and audio levels are clean enough to be re-assembled into a compilation later without rework. |

**The throughline:** scaling Bubu means scaling the *amount of established world* a producer must check against — never relaxing how carefully each individual episode is checked. If anything, later episodes require *more* careful Canon Validation (Step 3) and Continuity Check (`production/quality_checklist.md` Step 3), because there is more canon to contradict.

---

# 9. Future Team Handoff

This section is the answer to: *"A new person (or a fresh AI assistant with no memory of prior decisions) needs to produce Episode N. How do they do it without breaking anything?"*

## The Minimum Reading Order

A new team member does **not** need to read this entire repository. They need, in this order:

1. **This document** (`production/production_bible.md`) — the process.
2. `canon/bubu_project_canon.md` — the canon reading order and the Episode Creation Rule (this document's Section 2 is a detailed expansion of that rule).
3. `seasons/season_01_master_roadmap.md` — find the next unproduced episode slot and its dependencies.
4. The **most recently produced** episode's `episode_{NN}_full_package.md` — use as a structural template for Step 4 (Story Creation).
5. `production/quality_checklist.md` — the bar every episode must clear before it's "done."

Everything else (the individual canon layer files — identity, personality, universe, pillars, engagement, visual style, franchise vision; the reference image prompts; the consistency checklist) is consulted **as needed**, exactly as this document points to them at each step — not read cover-to-cover up front.

## The Three Things That Must Never Be Improvised

No matter how experienced the team becomes, three categories of decision are **never** made ad hoc, because they are the load-bearing walls of a 1000-episode franchise:

1. **Anything in `canon/bubu_core_identity_block.md`** — Bubu's body, palette, proportions, trunk shape, ear shape. If a new episode idea seems to *require* a change here, the idea is wrong. Full stop.
2. **Anything in `canon/bubu_universe_bible.md`'s 9 World Rules** — especially World Rule #8 ("the meadow remembers") and World Rule #9 (Audio Ownership Rule). Wonder Pebble, glow-object, and Pebble Hill tier states are **append-only history** (formalized in §10's Episode Continuity Rule) — a future episode can never contradict what a past episode established.
3. **The 5-beat structure and its signature behaviors** (Wobble, Ear-Perk & Point, "Arre, Bubu!") — these are *the* recognition mechanism. An episode that quietly drops or relocates one of these has broken the product even if every other element is perfect.

If a team member — human or AI — finds themselves about to make a decision in one of these three categories without an explicit canon update, the correct action is to **stop and raise it as a canon question**, not to proceed and document the deviation afterward. A canon change is a deliberate, repo-wide decision (editing the relevant `canon/` file, which then governs all future episodes); it is never a per-episode workaround.

## Handoff Self-Check

Before a new team member produces their first episode, they should be able to answer all of the following from memory (not by looking it up):

- What are the 5 beats, in order, and roughly how long is each?
- What three things happen *only* at the Scene 1→2 transition, and *only* there?
- What is the trunk's rotation at each of the 4 expressions?
- What is the single SFX rule, and when does it play?
- What does "the meadow remembers" mean in practice, and what is the one location it applies to most visibly?
- What score does an episode need on `production/quality_checklist.md`, and what overrides that score regardless of its value?

If any of these can't be answered, that's a signal to go back to the Minimum Reading Order above before starting production — not a reason to skip ahead and "figure it out during QA."

---

**This document, like every part of the canon it serves, is itself subject to `canon/bubu_project_canon.md`'s Precedence Rule.** If a future canon update changes a rule referenced here, this document must be updated in the same change — a stale production bible is itself a form of drift.
