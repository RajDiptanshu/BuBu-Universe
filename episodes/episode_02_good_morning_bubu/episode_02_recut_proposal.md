# Episode 02 — "Good Morning, Bubu!" — Recut Review & Proposal

Source reviewed: `final/bubu_ep02_good_morning_bubu_final.mp4` (12.500000s, 1080x1920, 30fps).
Method: contact-sheet sampling (`sheetA_storyflow.png` — 25 frames @ 0.5s steps;
`sheetB_transitions.png` — 21 frames across the 3 cut/seam zones) + full-timeline
waveform (`waveform.png`). No editing-plan or doc content used to form judgments.

---

## 1. Brutal Review Scorecard

Scored 1-10 (10 = broadcast-ready). All three personas independently land in the
high-30s/low-40s out of 90 — **"functions as a technical proof of concept; does not
yet read as a franchise pilot."**

### 1.1 Preschool Content Director — 36/90

| Dimension | Score | Why |
|---|---|---|
| Hook quality | 3 | First thing on screen is a flat logo card, not Bubu doing something. |
| Character appeal | 6 | Design is appealing; the cut gives Bubu almost nothing to *do* for the first 2.5s. |
| Wonder Pebble clarity | 2 | Pebble is sitting dormant on-screen from t=1.0 with zero "look, what's this?" beat. By the time it glows (t=8.0), most kids won't connect it back to the thing they half-saw 7s earlier. |
| Emotional progression | 4 | Calm→Build→Anticipation→Payoff→Loop is the right shape, but Build (4.0s, 32%) is longer than the Payoff's live footage (3.04s). The "set-up" out-runs the "punchline." |
| Audio sync | 5 | The "Pop!" word is on screen ~150ms before the pop SFX fires — small, but preschoolers actively mimic sound-effect timing. |
| Retention | 3 | 8 of 12.5s (64%) is buildup before any visual payoff. |
| Rewatchability | 5 | The gag (build→pop) is rewatch-friendly in concept, but it ends on a frozen frame, which reads as "video's over," not "watch again." |
| Loop quality | 4 | Technically seamless (dissolve works), but it dissolves peak-energy glow straight into a calm, eyes-closed pose — an emotional reset, not a recirculation. |
| Franchise value | 4 | Doesn't answer "what is the Wonder Pebble and why do I care for episode 3." |

### 1.2 YouTube Shorts Producer — 37/90

| Dimension | Score | Why |
|---|---|---|
| Hook quality | 2 | Rule #1 of Shorts: frame 1 is your thumbnail and your hook. This frame 1 is a static gold card with text — the single most "swipe past" opening possible. |
| Character appeal | 6 | Bubu reads cute even as a still — the asset is fine, the edit doesn't use it. |
| Wonder Pebble clarity | 3 | The pebble-glow *is* the thumbnail-worthy moment, and it's buried at the 64% mark. On Shorts you either lead with it or tease it in <1s. |
| Emotional progression | 4 | Too slow to "the good part" for the format. |
| Audio sync | 5 | Minor, but the money-beat (pop) is the one place sync needs to be perfect. |
| Retention | 3 | Average-view-duration graph will likely cliff before t=8s. |
| Rewatchability | 5 | Loop is present but doesn't *announce itself* — energy drops at the seam instead of snapping back up. |
| Loop quality | 5 | Functions, but a viewer is more likely to feel "that ended" than "oh, it's looping" — bad for autoplay/replay metrics. |
| Franchise value | 4 | Nothing in this cut differentiates Bubu from generic ambient preschool content. |

### 1.3 Franchise Development Executive — 35/90

| Dimension | Score | Why |
|---|---|---|
| Hook quality | 3 | Brand-first, story-second is "tech demo" structure, not "show open" structure. |
| Character appeal | 6 | Bubu's design is franchise-ready; this edit doesn't showcase range/personality. |
| Wonder Pebble clarity | 2 | This *is* the IP. If a viewer can't articulate what it is or why it matters, it's not doing its job as a franchise pillar. |
| Emotional progression | 4 | Inverted proportions (longest beat = least eventful) read as unintentional, not stylistic. |
| Audio sync | 5 | The true-peak overshoot (+0.03 dBFS, confirmed in `production_review_notes.md` §8) plus the text/SFX gap reads as "not QC'd for distribution." |
| Retention | 3 | Same retention math as above. |
| Rewatchability | 5 | — |
| Loop quality | 4 | — |
| Franchise value | 3 | A pilot needs to make the case "commission a season." This cut doesn't make that case yet. |

### 1.4 What feels amateur
1. The 0.5s solid-gold "BUBU!" card uses a completely different background/palette than the rest of the episode — looks like a stock intro bumper spliced onto a separate piece of art.
2. Scene 2's 4-second "Build" is visually static (same pose/composition across all ~8 sampled frames from t=2.5–6.0) — the escalation is carried entirely by text size (100→120→140), which feels like padding when isolated from motion.
3. The final ~1s is a frozen frame during what's supposed to be the emotional peak — a classic "ran out of animation" tell, and it repeats on every loop.

### 1.5 What feels unprofessional
1. **The logo stinger is the loudest sound in the video.** The waveform's single tallest peak is brand_sting at t=0–0.5 — louder than the "wow/pop" climax. The branding outweighs the story's biggest moment.
2. **Pop SFX lands ~150ms after the word "Pop!" appears on screen** — a money-beat that's slightly out of sync.
3. **True peak +0.03 dBFS** (confirmed, §8 of the production notes) — clipping risk on the loudest, most important beat.
4. The Wonder Pebble transitions from "inert prop" to "glowing magic item" with no on-screen acknowledgment that it *is* a Wonder Pebble — looks like a continuity oversight rather than a reveal.

### 1.6 What breaks immersion
1. Scene0→Scene1 hard cut: gold card → green garden, zero visual bridge.
2. Loop seam dissolves peak-glow directly into a calm/eyes-closed pose — a jarring mood reset that calls attention to the seam.
3. The freeze-frame stillness during the supposed "most alive" moment of the episode.

### 1.7 What would cause a parent or child to swipe away
1. **First 0.5–1s**: a static logo card with no character motion — nothing to hold a thumb that's already mid-scroll.
2. **0–8s (64% of runtime)**: nothing visually "happens" — by the time the pebble glows, most feed viewers have already decided.
3. For a child specifically: 4 seconds of near-zero visual change (the Build) is an eternity at this age — attention will drift mid-scene even with the tap sounds carrying it.

---

## 2. New Runtime Recommendation

**12.5s → 14.0s** (+1.5s).

This is a *small, footage-only* extension — no new renders. It buys just enough room
to (a) shorten the static Build, (b) give Anticipation and the Loop-landing more
weight, (c) cut the dead freeze time on the Payoff roughly in half, and (d) add a
soft transition on the one cut that currently breaks immersion — all funded entirely
out of existing per-clip spare footage (totals below).

| Clip | Used (old) | Used (new) | Available | Spare remaining |
|---|---|---|---|---|
| scene_00 | 0.5s | 0.5s | 3.0417s | 2.54s |
| scene_01 | 2.0s | 2.7s | 3.0417s | 0.34s |
| scene_02 | 4.0s | 2.8s | 4.0417s | 1.24s |
| scene_03 | 1.5s | 2.3s | 4.0417s | 1.74s |
| scene_04 | 4.0s (3.04 live+0.96 frz) | ~3.42s (3.04 live+~0.38 frz) | 3.0417s live (full) | 0 (unchanged — full clip used) |
| scene_05 | 0.5s | 2.7s | 3.0417s | 0.34s |

Every scene stays within its source clip's real footage — nothing is invented.

---

## 3. New Scene Timing Table

| # | Beat | Source clip | New source trim | New duration | New export window | Old export window | Δ |
|---|---|---|---|---|---|---|---|
| 0 | Brand "BUBU!" | scene_00.mp4 | 2.5–3.0 | 0.5s | 0.0–0.5 *(last 0.4s cross-dissolves into S1)* | 0.0–0.5 | 0 |
| 1 | Nook / Bubu + pebble visible | scene_01.mp4 | 0.0–2.7 | 2.7s | 0.1–2.8 *(first 0.4s is the dissolve from S0)* | 0.5–2.5 | +0.7 |
| 2 | Build (3 taps) | scene_02.mp4 | 0.0–2.8 | 2.8s | 2.8–5.6 | 2.5–6.5 | -1.2 |
| 3 | Anticipation | scene_03.mp4 | 0.0–2.3 | 2.3s | 5.6–7.9 | 6.5–8.0 | +0.8 |
| 4 | Payoff / Wow (live + freeze) | scene_04.mp4 | full 3.0417 + tpad ~0.38 freeze | ~3.42s | 7.9–11.3 *(live 7.9–10.94, freeze 10.94–11.3)* | 8.0–12.0 | -0.6 |
| 5 | Loop landing | scene_05.mp4 | 0.34–3.0417 *(final 2.7s — preserves the original closing frame the loop-seam targets)* | 2.7s | 11.3–14.0 *(final 0.2s = loop-seam dissolve into S1 frame-1)* | 12.0–12.5 | +2.2 |
| | **Total** | | | **14.4 raw − 0.4 crossfade = 14.0** | | **12.5** | **+1.5** |

**Transition changes:**
- **Scene0→1**: hard cut → **0.4s cross-dissolve**. This is the fix for the
  gold-card→garden palette jump (the #1 "amateur" and "swipe-away" finding). Funded
  by trimming 0.4s off Scene5's gain (Scene5 still nets +1.8s vs. old).
- **Scene3→4**: **keep as a hard cut.** This is the reveal — a snap is correct here;
  don't soften it.
- **Loop seam (end→S1 frame-1)**: keep the existing 0.2s fade technique, retargeted
  to the new 14.0s timeline (final window 13.8–14.0).

**Build trim detail (Scene2, 4.0s→2.8s):** keep all 3 "Tap!" pulses (the core gag),
just compress and re-time them — see audio table. Visual content lost is the
*least-eventful* portion of the static Build, identified directly from sheetA
(all 8 sampled frames in the old 2.5–6.5 window are near-identical).

**Freeze reduction (Scene4):** the live footage (3.0417s) is untouched — only the
`tpad` clone duration shrinks from 0.9583s to ~0.38s, cutting dead-frame time at the
emotional peak by more than half (0.96s → 0.38s, i.e., from 8% to ~2.7% of runtime).

---

## 4. New Audio Timing Table

| Layer | Source | Processing | Old export time | New export time | Old level | New level | Why changed |
|---|---|---|---|---|---|---|---|
| 1 | brand_sting.wav | atrim 0:0.5 | 0.0 | 0.0 | 1.0 | **0.6** | Waveform shows this as the *loudest* peak in the whole mix — louder than the climax. Pulling it back makes the Payoff the sonic high point, where it belongs. |
| 2 | music_bed.mp3 | atrim + piecewise vol, delay | 0.5–12.5 (duck 6.5–8.0) | 0.5–14.0 (duck **5.6–7.9**, recover by 14.0) | 0.08–0.20 | 0.08–0.20 (unchanged shape, retimed to new Anticipation window) | Duck window now matches new Scene3 (Anticipation). |
| 3 | tap.wav ×3 | full, adelay | 3.5 / 4.5 / 5.5 | **2.8 / 3.7 / 4.6** | 1.0 | 1.0 | Re-spaced to fit the compressed 2.8s Build (0.9s pulses). |
| 4 | chant_tap_pop.wav | atrim 0:1.7 | 3.5 | **2.8** | 0.5 | 0.5 | Stays aligned with tap #1. |
| 5 | wonder_pebble_discovery.wav | atrim 0:0.5 | 7.6 | **7.9** | 0.8 | 0.8 | Moved to the new Scene4 start (Scene3→4 hard cut is the reveal trigger). |
| 6 | wow_swell.wav | atrim 0:0.5 | 7.6 | **7.9** | 0.7 | 0.7 | Same — coincides with discovery twinkle at Scene4 start, as originally designed. |
| 7 | pop.wav | full | 8.25 | **8.4** | 1.3 | 1.3 | **Retimed to land exactly when the "Pop!" word appears on screen** (new "Wow!"=7.9–8.4, "Arre Bubu...Pop!"=8.4–11.5) — fixes the 150ms text/SFX gap. |
| 8 | chant_tap_pop.wav | atrim 1.7:2.0 | 8.25 | **8.4** | 0.5 | 0.5 | Pairs with pop.wav, same fix. |
| — | **alimiter** | final mix | limit=0.95 | **limit=0.85** | — | — | Addresses the confirmed +0.03 dBFS true-peak overshoot (production notes §8) — gives the now-uncontested climax clean headroom. |

**Text overlay retiming (follows the same logic, no copy changes):**

| Old window | Text | New window |
|---|---|---|
| 0.0–0.5 | "BUBU!" | 0.0–0.5 |
| 0.5–2.5 | "Bubu!" | 0.5–2.8 |
| 3.5–4.5 / 4.5–5.5 / 5.5–6.5 | "Tap!" (100/120/140) | 2.8–3.7 / 3.7–4.6 / 4.6–5.5 |
| *(none, 6.5–7.6 breather)* | — | *(none, 5.5–7.9 breather — Anticipation stays text-free, as originally designed)* |
| 7.6–8.1 | "Wow!" (90) | 7.9–8.4 |
| 8.1–12.0 | "Arre, Bubu! ...Pop!" (95) | 8.4–11.5 |

Leaving 11.5–14.0 (2.5s) as the only text-free *and* SFX-free stretch — pure
character + music "settle" before the loop, addressing the loop-seam mood-whiplash
finding (§1.6.2) by giving the energy somewhere to land before it dissolves into
Scene1's calm pose.

---

## 5. New Assembly Plan

Delta against the existing `assemble_episode02_final.sh` — same toolchain, same
fixes (fontconfig config, `FONT_REL`, blurred-canvas reframe, tpad freeze, xfade
loop-seam), retimed:

1. **Per-clip trims** — update the 6 `trim_clip`/reframe calls to the new windows
   in §3 (clip01: 0.0–2.7, clip02: 0.0–2.8, clip03: 0.0–2.3, clip05: 0.3417–3.0417;
   clip00 and clip04's live portion unchanged).
2. **clip04 freeze** — change `tpad=stop_mode=clone:stop_duration=0.958333` →
   `stop_duration≈0.38` (frame-exact value to be tuned at render time, same
   "(suggested)→tuned" pattern used for §9.4's fontsize in the current build),
   cap unchanged in form (`-t <new S4 duration>`).
3. **Scene0→1 cross-dissolve** — after building clip00.mp4 and clip01.mp4, replace
   the simple concat-list entry for these two with an `xfade=transition=fade:
   duration=0.4:offset=<clip00_dur-0.4>` pair (same pattern already used for the
   loop-seam), producing a combined `clip01_seamed.mp4`; feed that into the concat
   list in place of clip00+clip01. Scene2–5 stay on the existing hard-cut
   `concat_list.txt` path.
4. **Loop-seam** — same `loop_target.png`→`loop_target.mp4`→`xfade` mechanism,
   `offset` updated to `13.8` (new total 14.0 − 0.2) so it still targets clip01's
   frame 1.
5. **VF_TEXT chain** — same 7 `drawtext` calls, `enable='between(t,...)'` windows
   updated per §4's text table. No fontfile/fontsize/copy changes beyond what's
   already in the current build (the 95px fix carries forward).
6. **Audio mix** — same 8-input `amix` structure; update `adelay`/`atrim`/offset
   values per §4, change layer-1 `volume` 1.0→0.6, change final `alimiter`
   0.95→0.85.
7. **Re-measure on export**: total duration (expect 14.000000s), loudness
   (`loudnorm` — re-check true peak is now ≤ -1 dBFS with the tighter limiter),
   and re-run the same 3-image spot-check (story-flow sheet, transition sheet,
   waveform) to confirm the Scene0→1 dissolve, the shortened freeze, and the
   rebalanced brand-sting/pop relationship are visually/audibly correct.

No step here requires new image or video generation, touches Bubu's design, or
alters the Wonder Pebble's established rules/appearance — every change is a trim
window, a transition, a timing offset, or a mix level.

---

## 6. Publish / Recut Recommendation

**RECUT — do not publish the current export as the Episode 02 pilot.**

The current file is a clean, spec-compliant *technical* assembly (confirmed in
`production_review_notes.md`), but on the actual viewing experience it scores
35-37/90 across all three professional lenses, driven by one structural problem
(64% buildup before any payoff, with the longest single beat being the least
visually eventful) and a cluster of small polish issues (opening hard-cut palette
clash, logo louder than climax, 150ms text/SFX gap, true-peak overshoot, dead
freeze-frame at the emotional peak). All of these are timing/mix/transition issues
— exactly the category the recut in §§2–5 addresses, entirely within the existing
6 clips' footage.

**One finding the recut *cannot* fix**, flagged for the next production cycle (not
blocking this recut): the Wonder Pebble has no "discovery" moment — it's simply
present on screen from t≈1.0 with no beat that calls attention to it before it
later glows. Fixing this properly needs a small piece of new animation/footage
(e.g., Bubu noticing/picking up the pebble in Scene 1), which is out of scope here
per the "no regeneration" constraint. Recommend scoping this for Episode 02's
*next* iteration or as a brief insert shot.

**Estimated impact of the §2–5 recut** (same scoring rubric, directional):

| Dimension | Before | After (est.) |
|---|---|---|
| Hook quality | 2-3 | 5-6 (dissolve removes the jarring open; "Bubu!" reads sooner) |
| Retention | 3 | 5-6 (buildup-to-payoff ratio drops from 64%/36% to ~56%/44%) |
| Audio sync | 5 | 8 (pop/text aligned, true peak fixed) |
| Loop quality | 4 | 6 (more settle time before the dissolve softens the mood-reset) |
| Franchise value | 3-4 | 4-5 (still capped by the pebble-clarity gap) |

Net: the recut moves this from "technical proof of concept" to "presentable pilot
cut with one known, scoped content gap" — worth doing before any external review,
but the Wonder Pebble discovery beat should be tracked as a follow-up rather than
treated as solved by this pass.

---

## 7. Addendum — Status After Image-Layer Correction (v3 Regeneration)

This proposal was built from `final/bubu_ep02_good_morning_bubu_final.mp4`, assembled
from the now-superseded `videos/scene_0N.mp4` clips. Per
`episode_02_regeneration_audit.md`, those clips were generated from a rotated/
mismatched set of source PNGs and are being replaced. `higgsfield_video_prompts_v3.md`
now defines the regeneration (literal filename mapping: `scene_0N.png` -> Scene 0N,
sole-PNG character lock, no separate reference pack). This section cross-checks
§§2-6 above against that regeneration.

### What carries forward unchanged

- **§2 runtime target (12.5s -> 14.0s) and the §3 trim windows for Scenes 00, 01,
  03, and 05.** v3 keeps the same per-scene duration targets as the prompts that
  produced the original clips' actual lengths (the 3.0417s / 4.0417s tiers). Since
  Higgsfield's actual output length tracks the duration target rather than the
  prompt's content, the same available/spare footage amounts should reappear in the
  v3 outputs, and these four scenes' trim windows should still fit.
- **All of §4** — audio/text retiming, the Scene0->1 cross-dissolve, the loop-seam
  offset (13.8), the freeze reduction (0.96s -> 0.38s on Scene 4), brand_sting level
  (1.0 -> 0.6), and the limiter tightening (0.95 -> 0.85). None of this depends on
  per-scene visual content, only on the overall 14.0s timeline.
- **The Wonder Pebble "no discovery beat" gap (§6)** — Scene 01's content is
  unchanged in v3 (same source image and motion as before), so this remains an open,
  non-blocking follow-up exactly as scoped above.

### What changed as a result of this cross-check

- **`higgsfield_video_prompts_v3.md` Scene 02 was revised.** It previously
  front-loaded its 2 additional taps into the first ~0.5s of the clip, then held
  static for the remainder — which would have reproduced this proposal's #1
  "static Build" complaint (§1.4) in the new footage. It now spaces all 3
  tap/sparkle beats ~0.9s apart across the first ~1.8s, which lines up directly with
  this proposal's existing tap.wav timing (+0/+0.9/+1.8s from Build-start =
  2.8/3.7/4.6 in the new timeline) — no change to the §4 audio table was needed.
- **Scene 04's v3 content (gasp -> Delight transition, brightness peaking at ~0.5s
  in) lines up well with the pop.wav retiming** (Scene4-start + 0.5s, §4) — flagged
  here as a positive interaction, no change made.

### Still required before assembly resumes

- Generate all 6 v3 clips, then re-run sheetA/sheetB/waveform sampling against the
  new assembly to confirm §3/§4 still hold — especially Scene 02 (new action) and
  Scene 04 (new gasp -> Delight arc), whose *content* changed even where duration
  targets did not.
- `higgsfield_video_prompts_v3.md` flags Scene 03's keyframe as calm/content rather
  than "Surprise," and as already showing the bright-flood/glow that Scene 04 is
  meant to reveal. Under the extended 2.3s Anticipation window (§3), that glow is
  now on screen longer *before* Scene 04 — open question for the next pass: does
  that read as earlier "Wonder Pebble clarity" (addressing §1.1/§1.2), or does it
  blunt the Scene3->4 reveal (§1.6, "good, that's the reveal beat")? Worth checking
  against the regenerated footage rather than deciding from the old contact sheets.
