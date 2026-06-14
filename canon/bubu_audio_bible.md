# Bubu Audio Bible

**Purpose:** This is the **complete audio specification** for Bubu episodes — every sound that is allowed to exist in Bubu's world, what it means, where it goes, and how loud it is. It is a supplementary canon file (`canon/bubu_project_canon.md`'s Episode Creation Rule), consulted alongside `canon/bubu_universe_bible.md` (World Rules #6 and #9) and `canon/engagement_framework.md` (beat timing).

**Core design test for every sound:** *"If this sound played on its own, with no picture, would a child immediately know which moment of a Bubu episode it belongs to?"* If a sound could plausibly belong to more than one moment, it violates the Audio Ownership Rule (#9 below) and must be redesigned before use.

---

## 0. The Two-Layer Sound Model (World Rule #6)

Every episode's audio is built from exactly **two layers**, never more:

1. **The continuous layer** — one music bed (`audio/music_bed.mp3`), running gently from the start of Beat 1 to the end of Beat 5, looping seamlessly back to its own start so the episode's Loop→Hello transition is audio-seamless too. This layer also carries the **Wonder Pebble discovery twinkle** (§2) as a brief musical accent — never a separate "sound." From Episode 2 onward, it may also carry **rhythmic chant vocals** built from the episode's action words (e.g., "Tap tap tap... Tap tap tap... Splash!"), woven into the music bed exactly like the twinkle — music, not narration (World Rule #10, the Audio Evolution Rule; full spec in §3).
2. **The single notable-sound layer** — exactly **one Payoff SFX** (§3 of `production/production_bible.md`'s Audio Workflow), placed precisely at the Payoff frame.

Beat 0's brand-sting chime (§1) sits *outside* both layers — it occupies its own isolated 0.5s, with the music bed silent, so it is never confused with either layer.

---

## 1. BUBU! Brand Sting — Audio Specification

**Asset:** `audio/brand_sting_chime.wav` (new — to be produced)

| Property | Specification |
|---|---|
| **Duration** | 0.5s exactly, matching Beat 0's runtime (`canon/engagement_framework.md`) |
| **Sound profile** | A single soft, warm chime — one struck/plucked tone (e.g., a glockenspiel or marimba note) with a gentle natural decay filling the full 0.5s. No attack transient sharp enough to startle (World Rule #5, "nothing stays scary" — even a 0.5s sound must respect this). |
| **Pitch** | One fixed pitch, chosen once and never varied — recommended a major-key tonic or major-third note matching the music bed's key, so the sting feels like "the start of the song" rather than an unrelated jingle. |
| **Pairing** | Plays in exact sync with the "BUBU!" text snap-in (`bubu_personality_bible.md` §7) — text and chime hit the same frame. |
| **Isolation** | This is the **only** sound during Beat 0. The music bed is silent (0%) throughout the sting and fades in only once Beat 1 begins (see §4 Music Behavior). |
| **Implementation** | Baked permanently into the evergreen master asset `production/assets/bubu_brand_sting.mp4` (`canon/engagement_framework.md` Beat 0) — produced once, reused byte-identical in every episode via concat. No per-episode audio work. |

---

## 2. Wonder Pebble Discovery Sound — Specification

**Asset:** `audio/pebble_discovery.wav` (new — to be produced)

| Property | Specification |
|---|---|
| **Signature cue** | A short, bright "twinkle" — 2-4 quick ascending bell/chime tones (a rising arpeggio), total duration ≈0.3s, matching the Wonder Pebble's 0.3s turquoise flash window (`canon/bubu_universe_bible.md` §4). |
| **Placement** | Spans the Anticipation→Payoff boundary (e.g., 7.8s-8.1s in the 12s default), exactly aligned with the turquoise flash. Ends with a minimum 0.15s gap before the Payoff SFX begins (§3), so the two never overlap. |
| **Layer** | Woven into the **music bed** as a momentary accent (World Rule #6 amendment) — it is mixed as part of the continuous layer, not as a second "notable sound." Practically: the twinkle is mixed in parallel with the music bed at this timestamp, both ducked together (see §4 Ducking), so the combined result reads as "the music sparkling for a moment," not as an additional SFX hit. |
| **Emotional goal** | *Anticipation lifting into recognition* — the twinkle is the audio equivalent of the pebble's flash "announcing" the wonder (`bubu_universe_bible.md` §4's announce→deliver→crown hierarchy) a beat before the Payoff SFX "delivers" it. It should feel like the moment a held breath turns into a smile — bright and quick, never a fanfare. |
| **Consistency** | Identical across every episode, every pillar — like the turquoise flash itself, this is a **fixed franchise-wide cue**. It is never pitched, re-themed, or replaced per-pillar. |

---

## 3. Action Word Audio System

Action words reach the audience in two independent ways, both available from Episode 2 — an episode may use either, both, or neither, with no change to its visual or timing structure:

- **Narration** (optional) — each word as a short, clearly-enunciated spoken word, synced 1:1 with its on-screen text pulse (`canon/engagement_framework.md`).
- **Chant vocals** (Audio Evolution Rule, World Rule #10 — see below) — the same words sung/chanted rhythmically and mixed directly into the music bed, as part of the continuous layer (§0).

### Phase 1 core words (Episodes 2-10)

| Word | Audio treatment | Sync point |
|---|---|---|
| **Tap!** | Spoken once per Build repetition (e.g., "Tap! Tap! Tap!"), paired with `audio/tap.wav` percussion ticks — one tick per repetition, on the music bed's beat. | Each Build repetition (Beat 2) |
| **Pop!** | Spoken with a light, bouncy inflection; paired with `audio/pop.wav` when "Pop!" is the **payoff** word (when it's a *build* word, no SFX — only the spoken word + music tick, preserving the single-SFX rule). | Build repetition or Payoff frame, per pillar |
| **Splash!** | Spoken with an open, energetic inflection; paired with `audio/splash.wav` as the Payoff SFX. | Payoff frame (Beat 4) |
| **Wow!** | Spoken brightly, slightly *before* the pillar payoff word ("Wow!... Splash!"), riding on the Wonder Pebble discovery twinkle (§2) — see `audio/wow_swell.wav` below. | Anticipation→Payoff boundary, immediately preceding the pillar payoff word |

**New asset — `audio/wow_swell.wav`** (new, to be produced): a very brief (≈0.4s) upward swell in the music bed's own instrumentation (strings/pads, *not* a new instrument) timed to lift underneath the spoken "Wow!" and the discovery twinkle together. This is a **music-bed variation**, not a separate SFX — it is the music layer's way of "leaning into" the discovery moment for one beat, then settling back into its normal dynamic for the Payoff SFX and "Arre, Bubu!" line.

### Chant Vocals (Audio Evolution Rule, World Rule #10 — Episodes 2+)

Starting with Episode 2, the Build and Payoff words of §3's core vocabulary may additionally be delivered as a **rhythmic chant**, sung/spoken on the music bed's own beat and mixed into the continuous layer (§0) — for example:

> Tap tap tap...
> Tap tap tap...
> Splash!

| Property | Specification |
|---|---|
| **Layer** | Part of the **music bed** (continuous layer, §0) — mixed in parallel with the music bed's instrumentation, ducked together with it (§4 Ducking). Never the notable-sound layer, and never a substitute for the single Payoff SFX. |
| **Relationship to narration** | Independent of narration (§3 above). An episode may carry chant vocals with no spoken narration, spoken narration with no chant, both together, or neither — none of these choices change the episode's visual structure, beat timing, or Audio Ownership Rule mappings (§5). |
| **Word source** | Reuses the same Build/Payoff words already on screen (Phase 1 core: Tap!/Pop!/Splash!/Wow!, and later Phase 2/3 words per the Action Word Expansion Roadmap) — chants never introduce vocabulary that isn't already part of that episode's on-screen text. |
| **Rhythm** | Chant repetitions align with the Build beat's repetition count (1-3, World Rule #3) and the music bed's tempo — "Tap tap tap..." lands on the same ticks as the `tap.wav` percussion (§3), so chant and percussion reinforce rather than compete. |
| **Production cost** | No new asset categories — chant vocals are recorded once per chant phrase and mixed into the relevant `music_bed.mp3` variant, the same reusable-asset model as `wow_swell.wav` and the discovery twinkle. |

### Song Fragments (Song Fragment Rule, World Rule #11)

Any chant-vocal sequence (above) that demonstrates **exceptional retention** may be promoted to an **evergreen musical fragment** — a short, fixed melodic phrase reused identically wherever that action-word sequence recurs.

Examples: "Tap Tap Tap Splash," "Pop Pop Pop Wow."

| Property | Specification |
|---|---|
| **Promotion trigger** | Demonstrated exceptional retention (analytics review), not a production-time decision — fragments are identified retroactively from what already works, never designed speculatively in advance. |
| **Before promotion** | An ordinary chant vocal (above) — governed by the same layer, ducking, and word-source rules as any other chant. |
| **After promotion** | An evergreen asset, like `wow_swell.wav` or the discovery twinkle — fixed melody, fixed words, reused byte-identical (or loudness-matched) across every episode that uses that action-word sequence. |
| **Audio Ownership** | Once promoted, a fragment falls under the Audio Ownership Rule (§5 / World Rule #9) — its melody is permanently tied to its specific action-word sequence and is never reused for a different sequence. |
| **Relationship to full songs** | A fragment is the smallest unit that may later be expanded into a full song (§8, Episodes 31-100 "Musical Motifs") — promoting a fragment does not itself create a song. Song creation remains a separate, future phase. |

### Phase 2 / Phase 3 words (audio approach only — see §6 Roadmap)

The Action Word Expansion Roadmap (`canon/engagement_framework.md`) introduces Zoom!, Hop!, Glow!, Shine! (Episodes 11-30) and Spin!, Roll!, Count! and others (Episodes 31+). Each new word follows the **same** spoken-word + existing-asset pattern above — a new word is never given a bespoke new SFX. Where a new word is a *build* word, it pairs with `tap.wav`'s existing percussion tick; where it is a *payoff* word, it pairs with the episode's single Payoff SFX (which may itself be a new asset chosen per pillar, per `production/production_bible.md`'s SFX guidance — "richest version appropriate to the episode").

---

## 4. Audio Mixing Standards

### Music Behavior

- **One continuous music bed** (`audio/music_bed.mp3`) runs from the start of Beat 1 to the end of Beat 5, looping seamlessly Beat 5 → Beat 1.
- **Silent during Beat 0** — the brand sting (§1) is the only sound; music fades in from 0% to its base level over the first ~0.3s of Beat 1, so the sting reads as fully isolated.
- **Base level: ~20%** during Beats 1-2 (Hello, Build), with percussion ticks synced to Build repetitions (per `production/production_bible.md`).
- **Ducks to ~8%** through Beat 3 (Anticipation) — "the world holds its breath" (World Rule #4) — and stays ducked through the first half of Beat 4 to leave room for the discovery twinkle (§2) and the Payoff SFX (§3).
- **Swells briefly** (the `wow_swell.wav` variation, §3) at the Anticipation→Payoff boundary, underneath "Wow!" and the discovery twinkle.
- **Recovers to ~20%** by the end of Beat 4 / through Beat 5, landing exactly at its starting level so the Beat 5→Beat 1 loop is audio-seamless.

### SFX Behavior

- **Exactly one Payoff SFX per episode** (World Rule #6), drawn from the pillar-appropriate asset (`splash.wav`, `pop.wav`, etc., or a future pillar-specific asset per `production/production_bible.md`'s "richest version" guidance).
- The Payoff SFX is the **loudest single element** of the episode — boosted relative to the music bed (e.g., the Episode 01 v2 baseline used a 1.3x boost).
- **No SFX exists outside the Payoff frame** — Build repetitions are carried by music-bed percussion ticks (§ Music Behavior), never by SFX hits.

### Ducking

| Beat | Music level | Notes |
|---|---|---|
| 0 (Sting) | 0% (silent) | Brand-sting chime only |
| 1 (Hello) | Fade-in 0% → 20% over ~0.3s | |
| 2 (Build) | 20% | Percussion ticks per repetition |
| 3 (Anticipation) | Duck to 8% | "World holds its breath" |
| 4 (Payoff), first ~0.3s | 8% → brief swell (`wow_swell.wav`) | Discovery twinkle + "Wow!" |
| 4 (Payoff), remainder | Recover toward 20%, Payoff SFX at full boosted level on top | |
| 5 (Loop) | 20% | Settles for seamless loop back to Beat 1 |

### Loudness Targets

- **Integrated loudness target: -16 LUFS to -14 LUFS** for the final mixed file — consistent with platform normalization (YouTube Shorts) so Bubu episodes neither sound quiet next to other content nor get auto-attenuated.
- **True peak ceiling: ≤ -1 dBFS** — enforced via a limiter on the final mix (e.g., `alimiter`), preventing clipping at the Payoff SFX's boosted level.
- These targets apply to the **full exported file**, Beat 0 through Beat 5 — the brand sting must not be noticeably louder or quieter than the body when measured by ear, even though it is mixed in isolation.

### Timing Standards

- **Payoff SFX sync tolerance:** within ±2 frames (≈67ms at 30fps) of the Payoff beat's visual activation — checked at QA (`production/quality_checklist.md`).
- **Wonder Pebble discovery twinkle:** occupies the fixed 0.3s flash window at the Anticipation→Payoff boundary (`canon/bubu_universe_bible.md` §4) — never drifts earlier/later per episode.
- **Minimum gap rule:** at least 0.15s of silence-from-the-twinkle's-end before the Payoff SFX begins, so "Wow!" (announce) and the Payoff SFX (deliver) are perceptibly sequential, never simultaneous — mirrors the visual announce→deliver→crown hierarchy.
- **Brand-sting chime:** occupies the full 0.5s of Beat 0, baked into the master asset — no per-episode timing decisions.

---

## 5. Audio Ownership Rule — Full Specification (World Rule #9)

Every signature sound has **exactly one meaning and exactly one place** it is allowed to occur. None of the following are ever reused, reordered, or repurposed:

| Sound | Asset | Owned moment | Never used for... |
|---|---|---|---|
| Brand-sting chime | `audio/brand_sting_chime.wav` | Beat 0 only, baked into `bubu_brand_sting.mp4` | Any in-episode moment, any other transition |
| Build-repetition tick | `audio/tap.wav` (or equivalent) | One tick per Build repetition, Beat 2 only | Payoff emphasis, Anticipation, Loop |
| Wonder Pebble discovery twinkle | `audio/pebble_discovery.wav` | The 0.3s Anticipation→Payoff flash window only | A second "Wow!" later in the episode, Build-beat emphasis |
| "Wow!" swell | `audio/wow_swell.wav` (music-bed variation) | Underneath the discovery twinkle only | General music-bed energy, Loop beat |
| Payoff SFX | `splash.wav` / `pop.wav` / pillar-appropriate | The Payoff frame only, once | Build repetitions, Anticipation, Loop |
| "Arre, Bubu! ...[word]!" | (narration) | The Payoff beat only, paired with the payoff word | Beat 0, Hello, or as a generic catchphrase elsewhere |

**Why this matters at scale:** as the franchise grows into toys, apps, and books (`canon/bubu_franchise_vision.md`), each of these sounds will eventually exist *outside* video — a toy that plays the discovery twinkle when a physical Wonder Pebble is "found," an app that plays the brand-sting chime on launch. If any of these sounds had ever been reused for multiple meanings on-screen, that audio-to-meaning mapping would be ambiguous the moment it's taken out of its original context. Locking ownership now means every future audio touchpoint inherits an unambiguous "sound = meaning" vocabulary for free.

---

## 6. New Assets Required (one-time production)

| Asset | Used for | Produced when |
|---|---|---|
| `audio/brand_sting_chime.wav` | Beat 0 brand sting | Before Episode 02 — baked into `production/assets/bubu_brand_sting.mp4` |
| `audio/pebble_discovery.wav` | Wonder Pebble discovery twinkle | Before Episode 02 |
| `audio/wow_swell.wav` | "Wow!" music-bed swell | Before Episode 02 |

All three are **one-time, evergreen assets** — produced once, reused byte-identical (or loudness-matched) across all future episodes. No new audio assets are required for Episodes 2-10 beyond these three plus the existing `audio/music_bed.mp3`, `audio/tap.wav`, `audio/pop.wav`, and `audio/splash.wav`.

---

## 7. Episode 02 Audio Plan (illustrative — Episode 02 itself is not created here)

This section demonstrates how the above specification applies to a single episode, using Episode 02's planned **First Wonder Pebble** (`canon/wonder_pebble_taxonomy.md` #1) in the **Colors** pillar (easiest pillar, per `canon/content_pillars.md`'s generation-ease ranking) — build word **Tap!**, payoff word **Pop!**. This is an **audio plan only**; no scenes, prompts, or video work are implied or created.

| Time | Beat | Audio events |
|---|---|---|
| -0.5s – 0.0s | Beat 0 (Sting) | `brand_sting_chime.wav` (0.5s, full level). Music bed silent. "BUBU!" spoken. |
| 0.0s – 0.3s | Beat 1 start | Music bed fades in 0% → 20%. |
| 0.0s – 2.0s | Beat 1 (Hello) | Music bed steady at 20%. Narration: "Bubu!" |
| 2.0s – 6.0s | Beat 2 (Build) | Music bed at 20% with 3 percussion ticks (`tap.wav`) at 3.0s / 4.0s / 5.0s. Narration: "Tap! Tap! Tap!" (one per repetition, escalating slightly in energy per the Episode 01 Final precedent). |
| 6.0s – 7.8s | Beat 3 (Anticipation) | Music bed ducks to 8%. No narration. Silence apart from the ducked bed. |
| 7.8s – 8.1s | Anticipation→Payoff boundary | `pebble_discovery.wav` twinkle (0.3s) + `wow_swell.wav` music-bed swell. Narration: "Wow!" Wonder Pebble flashes turquoise on screen in sync. |
| 8.25s | Payoff SFX | `pop.wav` (Payoff SFX, boosted ~1.3x), with the minimum 0.15s gap after the twinkle ends (8.1s → 8.25s). Hero-color object (Colors pillar fill) activates in sync. |
| 8.1s – 11.0s | Beat 4 (Payoff) | Music bed recovers from 8% toward 20% across this window. Narration: "Pop!" immediately followed by "Arre, Bubu! ...Pop!" — the episode's loudest narration moment. |
| 11.0s – 12.0s | Beat 5 (Loop) | Music bed settles at 20%, ready for seamless loop back to 0.0s (Beat 1). |

**Cross-checks against this Audio Bible:**
- Two-layer model (§0): music bed (continuous) + one Payoff SFX (`pop.wav`) — ✓.
- Brand sting isolated, music silent during Beat 0 — ✓.
- Discovery twinkle inside the 0.3s flash window, ≥0.15s before Payoff SFX — ✓ (7.8-8.1s twinkle, 8.25s SFX = 0.15s gap).
- Loudness target -16 to -14 LUFS integrated, true peak ≤ -1 dBFS — applied at final mix/limiter stage, same as the Episode 01 Final pipeline's `alimiter` step.
- Audio Ownership Rule (§5) — every sound above maps to exactly one row of the ownership table.

---

## 8. Audio Evolution Roadmap

The roadmap is staged to match the **Action Word Expansion Roadmap** (`canon/engagement_framework.md`) — new audio complexity is introduced only as far as the existing visual/vocabulary system has already expanded, never ahead of it. **No songs are created at any stage of this roadmap** — song production is a separate, future phase.

### Episodes 2-10 — Existing Assets Only

- Uses only the assets defined in §6: `music_bed.mp3`, `tap.wav`, `pop.wav`, `splash.wav`, plus the three new evergreen assets (`brand_sting_chime.wav`, `pebble_discovery.wav`, `wow_swell.wav`).
- Audio production cost per episode is **near-zero** beyond mixing — every sound is a reused asset, placed according to the fixed timing in §4 and §7.
- Goal: lock the two-layer model, the brand sting, and the discovery twinkle as instantly-recognizable, before introducing any new audio vocabulary.
- **Chant vocals optional from Episode 2** (Audio Evolution Rule, §3): Phase 1 core words may be mixed into the music bed as a rhythmic chant (e.g., "Tap tap tap... Tap tap tap... Splash!"), independent of whether spoken narration is also used. This reuses Phase 1 vocabulary only — it does not pull forward any Phase 2/3 vocabulary or any new asset category.

### Episodes 11-30 — Chants (Call-and-Response)

- Extends the chant-vocal mechanism introduced in Episodes 2-10 (Audio Evolution Rule, §3) to **new** vocabulary — where Episodes 2-10 chant only the existing Phase 1 words, this stage introduces audio support for the Action Word Expansion Roadmap's Phase 2 words (Zoom!, Hop!, Glow!, Shine!).
- Each new word is introduced via a short **chant**: a simple call-and-response between Bubu (or the on-screen text/narration) and the narrator — e.g., narrator: "What does Bubu do?" / payoff beat: "Zoom!" — recorded as short, reusable vocal phrases layered *on top of* the existing music bed, not as new musical compositions.
- Chants are **not songs**: no verse/chorus structure, no melody distinct from the music bed's existing key/tempo — they are spoken/chanted phrases that reuse the Phase 1 timing model (build-word repetitions, payoff-word + "Arre, Bubu!").
- Production cost stays low: each new word requires one short recorded phrase, reused across every episode that uses that word, exactly like `tap.wav`/`pop.wav`/`splash.wav` today.

### Episodes 31-100 — Musical Motifs (Pre-Song Groundwork)

- Each content pillar is assigned a short (2-3 note) **musical motif**, played by the music bed during that pillar's Payoff swell (replacing/extending `wow_swell.wav` with a pillar-flavored variant of the same swell, at the same loudness and timing).
- Any pillar that already has a **promoted Song Fragment** (§3, World Rule #11) by this stage should use that fragment's melody as the basis for its motif — this is the natural convergence point between Episodes 2-30's chants/fragments and Episodes 31-100's motifs.
- Motifs are designed to be **forward-compatible with future songs** — each motif is a fragment simple enough to later become a song's hook, without requiring any rework of the Episodes 2-100 audio mixes when that future phase begins.
- **Explicitly out of scope for this roadmap:** full original songs, verse/chorus structures, or any new vocal recording beyond short motif instrumentation. This phase only prepares the *musical material* — actual song creation remains a separate, future phase, to be scoped only once Episodes 31-100 are underway and the motifs have been validated for retention.
- Maintains calm-preschool identity: motifs are short, gentle, and live entirely within the existing music bed's instrumentation — no new instruments, no tempo changes, no increase in overall loudness beyond the §4 targets.

### Why this roadmap protects retention and cost

- **Calm preschool identity:** every stage reuses the same two-layer model, the same loudness targets, and the same "one Payoff moment" rule — nothing about the audio ever becomes louder, busier, or more complex than Episodes 2-10 established.
- **High retention:** new audio elements (chants, motifs) are always introduced *alongside* an already-familiar visual/vocabulary expansion (per the Action Word Expansion Roadmap), so repeat viewers experience them as "a little more of what I already know," not a format change.
- **Low production cost:** at every stage, new audio = a small number of short, reusable recorded assets (one phrase or motif per new word/pillar), mixed into the existing two-layer structure — never a bespoke per-episode score.
