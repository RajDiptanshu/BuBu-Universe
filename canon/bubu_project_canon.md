# Bubu Project Canon — Read This First

This file is the entry point for the Bubu Universe project. Any session (human or AI) working on Bubu content must read this file first, then follow the canon hierarchy below **in order**. Each layer builds on and must remain consistent with the layers above it.

## Strategic Foundation

Before production work, read **[Franchise Vision](bubu_franchise_vision.md)** — `bubu_franchise_vision.md`.
This is a **strategic** document (not a production document): it defines what success looks like in 5 years — audience, positioning, language strategy, format strategy, merchandise, educational goals, and what Bubu must never become. The 6-layer production hierarchy below exists to serve this vision; if a production decision seems to conflict with the vision, the vision should inform how the canon is interpreted (though it does not override the locked identity/personality/universe layers without deliberate review).

## Canon Reading Order (Production Hierarchy)

1. **[Identity](bubu_core_identity_block.md)** — `bubu_core_identity_block.md`
   Defines **what Bubu looks like**. Locked v2 visual identity — silhouette, proportions, palette, ears, trunk. Nothing below may contradict this.

2. **[Personality](bubu_personality_bible.md)** — `bubu_personality_bible.md`
   Defines **who Bubu is** — temperament, voice, signature behaviors. Built on top of the locked identity.

3. **[Universe](bubu_universe_bible.md)** — `bubu_universe_bible.md`
   Defines **where Bubu lives** — setting, locations, rules of the world, franchise mechanics (e.g., Wonder Pebbles).

4. **[Content Pillars](content_pillars.md)** — `content_pillars.md`
   Defines **what kinds of stories can be told** — the 8 teaching/topic pillars every episode draws from.

5. **[Engagement Framework](engagement_framework.md)** — `engagement_framework.md`
   Defines **how stories are structured** — the 5-beat template, timing, and loop mechanics every episode follows.

6. **[Visual Style](visual_style_guide.md)** — `visual_style_guide.md`
   Defines **how stories look** — the visual production spec (camera, color, composition, motion) derived from layers 1-5.

All six layers are **mandatory canon**, not optional references — layers 4 and 5 carry the same authority as layers 1-3.

## Episode Creation Rule

Before creating any episode, load:

1. `bubu_core_identity_block.md`
2. `bubu_personality_bible.md`
3. `bubu_universe_bible.md`
4. `content_pillars.md`
5. `engagement_framework.md`
6. `visual_style_guide.md`

Plus two **supplementary canon files** introduced by the Phase 1 Canon Lock (2026-06-14), consulted alongside layers 3 and 5 above:

- `wonder_pebble_taxonomy.md` — which Wonder Pebble (Flagship or Generic) appears in this episode, per `bubu_universe_bible.md` §4 and §10's continuity bookkeeping.
- `bubu_audio_bible.md` — the episode's audio cues (brand sting, discovery twinkle, Payoff SFX), per `bubu_universe_bible.md` World Rules #6 and #9.

No episode may be created using only prompt files from `references/`.

Reference files are implementation helpers.

Canon files are authoritative.

## Precedence Rule

If any document outside `canon/` (production, references, episodes, archive) conflicts with one of the six layers above, the canon file wins. Canon files may only be changed deliberately and with full awareness of downstream impact on `production/`, `references/`, `episodes/`, and `archive/`.

## Canon Update Log

### 2026-06-14 — Episode 02+ canon update

Applied deliberately, ahead of Episode 02 production, optimized for preschool retention, character recognition, and franchise building:

1. **Every episode contains a Wonder Pebble**, present from Scene 1 (`bubu_universe_bible.md` §4, World Rule #8).
2. **Wonder Pebbles flash a fixed, franchise-wide turquoise (`#4FD1C5`)** — distinct from each episode's rotating hero color, which still applies to that episode's pillar-specific payoff object. Pebbles are **found throughout Bubu Grove** — the meadow world's proper name (`bubu_universe_bible.md` §4, §6).
3. **Each Wonder Pebble's turquoise flash triggers the episode's discovery moment**, at the Anticipation→Payoff transition (`bubu_universe_bible.md` §4, `engagement_framework.md`).
4. **Episode 02+ vibrancy bump**: background, foreground/secondary, and hero/payoff saturation ranges all increase 20-30% (Bubu's own fixed palette is exempt). Episode 01 is not retroactively changed (`visual_style_guide.md`).
5. **Mandatory 0.5s "BUBU!" brand sting** ("Beat 0") opens every episode, hard-cutting into Scene 1 — supersedes the previously-optional ~1.5s Intro Sequence. Total runtime becomes 10.5-15.5s (`engagement_framework.md`, `bubu_personality_bible.md` §7).
6. **Core action word vocabulary** — Tap! / Pop! / Splash! / Wow! — established for early episodes; "Wow!" is the universal discovery word tied to the Wonder Pebble flash (`content_pillars.md`, `engagement_framework.md`).
7. **No verbal self-introductions** (e.g., "Hi, I'm Bubu the Elephant!") — explicit Voice Constraint added (`bubu_personality_bible.md`).

Downstream files (`production/production_bible.md` and later) should be reconciled against these changes before Episode 02 begins production.

### 2026-06-14 — Phase 1 Canon Lock (Final Pre-Production Decisions + Additions)

Applied as the final pre-production lock before Episode 02, resolving all 8 open issues from the Episode 02+ canon update plus 4 additional refinements:

1. **Saturation ranges finalized**: background 0.24-0.42, foreground/secondary 0.65-0.82, **hero/payoff object 0.85-0.93** (final, supersedes any earlier 0.88-0.96 draft), Wonder Pebble turquoise flash 0.97-1.00 as the sole exception above the hero band (`visual_style_guide.md`).
2. **Wonder Pebble flash timing**: a 0.3s window spanning the Anticipation→Payoff boundary, with a minimum 0.15s gap before the hero-color object's activation (`bubu_universe_bible.md` §4).
3. **Payoff hierarchy** — announce (pebble flash, "Wow!") → deliver (hero-color object, no text) → crown ("Arre, Bubu! ...[word]!", always largest) — fixed across every pillar (`bubu_universe_bible.md` §4, `engagement_framework.md`).
4. **Scene 0 implementation**: one evergreen master asset `production/assets/bubu_brand_sting.mp4` (0.5s, byte-identical), prepended via concat at editing Step 9; Steps 5-8 unchanged (`engagement_framework.md`, `production_bible.md`).
5. **Wonder Pebble continuity**: Flagship + Generic pebble model, with a permanent Flagship claim log; Pebble Hill density tiers — Sparse (Episodes 1-10), Moderate (Episodes 11-50), Dense/field (Episodes 51+) (`bubu_universe_bible.md` World Rule #8 and §10; full taxonomy in `wonder_pebble_taxonomy.md`).
6. **"Pop!" visual definition**: color-fill + ~12% scale-bounce (snap back within 0.2s) + 2-3 radiating particle dots fading within 0.3s; object remains on screen (`engagement_framework.md`, `content_pillars.md`).
7. **Episode 01 grandfathering**: Episode 01 is permanently exempt from items 1-6 of the prior canon update, not retroactively edited; an optional remaster is possible only after Episode 25, non-blocking (`production_bible.md`).
8. **Bubu Grove external usage**: metadata-only — fixed description closing line "Another wonder discovered in Bubu Grove! 🌿" and `#BubuGrove` as a 6th fixed tag (5-tag → 6-tag system); "Bubu Grove" is never shown on-screen (`production_bible.md`).
9. **Action Word Expansion Roadmap**: staged vocabulary rollout — Phase 1 (Episodes 2-10, core 4 words), Phase 2 (Episodes 11-30, pillar-expansion words via chants), Phase 3 (Episodes 31+, new words via original nursery-rhyme-structure songs) (`engagement_framework.md`).
10. **Audio Ownership Rule** (new World Rule #9): every signature sound (brand-sting chime, Wonder Pebble discovery twinkle, Payoff SFX, "Arre, Bubu!") has exactly one meaning and one moment, never reused elsewhere; World Rule #6 amended to formalize the discovery twinkle as a music-bed accent, not a second "notable sound" (`bubu_universe_bible.md` World Rules #6, #9; full spec in `bubu_audio_bible.md`).
11. **Episode Continuity Rule** (new §10): formalizes what persists (Pebble Hill tier, Flagship claim log, hero-color non-repetition window) vs. what resets every episode (locations, Bubu's pose, Generic pebbles) (`bubu_universe_bible.md` §10).

This entry locks the universe ahead of Episode 02 production. New canon files introduced by this update: `canon/wonder_pebble_taxonomy.md`, `canon/bubu_audio_bible.md`.
