# Engagement Framework — Bubu Channel

The exact structural template for every episode. Default runtime: **12 seconds** for the 5-beat episode body (fits the 10–15s target, loops cleanly, and matches 0–2 attention spans), **plus** a mandatory 0.5s brand sting (Beat 0, see below) — total exported file runtime **10.5–15.5s**. Shorter (10s) and longer (15s) variants adjust only the Build beat's repetition count — the beat order and proportions stay fixed.

---

## Beat 0 — BUBU! Brand Sting (0.5s, mandatory, before every episode)

Every episode opens with a fixed **0.5-second brand sting**, hard-cut directly into Beat 1 (Hello) — no transition, matching the no-transitions rule. This is the mandatory, compressed form of `bubu_personality_bible.md` §7 (formerly an optional ~1.5s bumper; now required on every episode, every platform):

- Bubu mid-**Wobble**, Curious pose, same framing as Beat 1.
- "BUBU!" text snaps in, paired with a single soft chime — the *only* sound in the sting.
- Hard cut to Beat 1.

The 0.5s sting is **additional** to the 10–15s 5-beat episode below; the "10–15s" target elsewhere in canon and `production/production_bible.md` refers to Beats 1–5 only.

**Implementation — one evergreen master asset:** Beat 0 is **not** generated per episode. It exists as exactly one master file, `production/assets/bubu_brand_sting.mp4` (0.5s, byte-identical across every episode, neutral framing as described above), produced once. Every episode's assembly pipeline **prepends** this master asset via concat (`production/production_bible.md`'s editing Step 9) ahead of Beats 1-5 — Steps 5-8 (the 5 scenes/keyframes) are unchanged and never reference Beat 0. If the master asset is ever revised (e.g., a remaster), the single file is replaced and every future assembly picks it up automatically — no episode-specific work is required.

---

## The 5-Beat Structure (12s default)

| Beat | Name | Timing | Duration | What happens visually |
|---|---|---|---|---|
| 1 | **Hello** | 0:00–0:02 | 2s | Bubu appears in "Curious" expression, faces camera, gentle sway. On-screen label shows the **key word** (1 word, large text, top of frame). |
| 2 | **Build** | 0:02–0:06 | 4s | Bubu performs a small rhythmic action 2–3x (pat, point, step) toward a secondary object. Expression: "Focused." Each repetition is identical in speed/size. Key word may pulse once per repetition. |
| 3 | **Anticipation** | 0:06–0:08 | 2s | All motion stops. The payoff object becomes fully visible for the first time (or is fully revealed). Expression switches to "Surprise" — ears pop, trunk lifts. This is the lowest-energy moment — a held breath. |
| 4 | **Payoff** | 0:08–0:11 | 3s | Fast, single-direction motion: the payoff object activates (sprays/bounces/lights up/rolls) and Bubu reacts with "Delight" (trunk raised, ears flap, small hop). Hero color hits peak saturation. The episode's one sound effect plays exactly on this frame. |
| 5 | **Loop** | 0:11–0:12 | 1s | Bubu returns to the exact "Hello" pose/position (Beat 1's frame), holds for the final moment so the video can restart seamlessly. |

---

## 10s and 15s Variants

| Runtime | Adjustment |
|---|---|
| **10s** | Build beat = 2 repetitions instead of 3 (reduce Build to 2s); all other beats unchanged. |
| **15s** | Build beat = 3 repetitions at a slightly slower pace (Build extends to 6s); Payoff extends to 4s to let the hero-color moment breathe. Beat order and proportional emphasis stay identical. |

The **proportions** (short Hello, longest Build, brief Anticipation dip, strong Payoff, instant Loop) are the constant — only absolute seconds shift.

---

## The Payoff Moment (definition)

The Payoff is **always**:
- The single fastest motion in the episode
- The single most saturated frame (hero color at 0.85–0.93 saturation, Episode 02+ — `canon/visual_style_guide.md`), preceded by the Wonder Pebble's brief 0.97-1.00 turquoise flash (`canon/bubu_universe_bible.md` §4)
- Resolved through the fixed **announce → deliver → crown** hierarchy (`canon/bubu_universe_bible.md` §4): the Wonder Pebble flash announces ("Wow!"), the hero-color object delivers (the activation itself), and "Arre, Bubu! ...[payoff word]!" crowns the moment as the largest on-screen text
- Paired with the episode's **one and only** sound effect (Payoff SFX, per the Audio Ownership Rule, `canon/bubu_audio_bible.md`)
- Caused directly by Bubu's action in Beat 2 (cause → effect: Bubu's repeated pats/points/steps *are what makes* the payoff object activate)

This direct causal link (Bubu does something 2–3 times → the world responds) is the core "why" behind every episode — it teaches cause-and-effect while delivering the emotional payoff.

### "Pop!" Visual Definition

Where "Pop!" is used as a build or payoff word (`canon/content_pillars.md`), it always renders as the same three-part visual event, regardless of pillar: (1) the object **fills with its target color** instantly (no gradual fade); (2) the object performs a **~12% scale-bounce** — briefly enlarging then snapping back to its original size within 0.2s; (3) **2-3 small round particle dots** radiate outward from the object and fade within 0.3s. The object itself remains on screen throughout — "Pop!" is a burst of emphasis on an object that stays, never a disappearance.

---

## How the Loop Works

- Beat 5 ends on a frame **visually identical to Beat 1's starting frame** (same Bubu pose, same camera position, same background state — only the payoff object's new state may persist quietly in the background, not in focus).
- Because there are no cuts and the end frame matches the start frame, looping the file directly (no transition needed) feels like Bubu "doing it again" — which is the intended replay trigger.
- The on-screen key word **disappears by the end of Beat 2** and does not reappear during Beats 3–5, so the looping restart (Beat 5 → Beat 1) feels like a clean reset, not a repeated label.

---

## Action Word Vocabulary (Episode 02+)

Early episodes draw on-screen/build/payoff words from a small, recognizable **core action-word set**: **Tap! · Pop! · Splash! · Wow!** (full pillar mapping in `canon/content_pillars.md`).

- **"Wow!" is the universal discovery word.** It fires the instant the episode's Wonder Pebble flashes turquoise at the Anticipation→Payoff transition (`canon/bubu_universe_bible.md` §4) — *before* the pillar-specific payoff word. The Payoff beat's on-screen/spoken pattern becomes **"Wow!... [pillar payoff word]!"** (e.g., "Wow!... Splash!"), immediately followed by "Arre, Bubu! ...[payoff word]!" per `bubu_personality_bible.md` §6.
- The remaining words (Tap!, Pop!, Splash!) are pillar-appropriate **build or payoff words** synced 1:1 with their on-screen text pulse and (where applicable) trunk function. They are a recommended starting vocabulary for the character-recognition phase, not an exhaustive permanent list.
- **No verbal introductions:** these action words, "Bubu!" (Beat 0/Beat 1), and "Arre, Bubu!" (Payoff) are the *only* spoken/on-screen vocabulary. Bubu never delivers a self-introduction (e.g., "Hi, I'm Bubu the Elephant!") — see `bubu_personality_bible.md`'s Voice Constraint and `production/production_bible.md`'s Voice section.

---

## Action Word Expansion Roadmap

The 4-word core set (Tap! / Pop! / Splash! / Wow!) is **Phase 1** of a deliberately staged vocabulary rollout — new words are introduced only after the existing set is well-established, never all at once, so character/format recognition is never diluted:

| Phase | Episodes | New words introduced | Mechanism |
|---|---|---|---|
| **Phase 1 — Core 4** | 2-10 | Tap! · Pop! · Splash! · Wow! | Established via the standard Build/Payoff sync described above. No new words added in this phase — repetition builds recognition. |
| **Phase 2 — Pillar expansion** | 11-30 | Zoom! (Things That Go) · Hop! (Playground) · Glow! (Colors/Shapes) · Shine! (Counting/Shapes) | Each new word is introduced **one at a time**, tied to its pillar's existing payoff motion (no new motion is invented for a word) — first appearance is always in that pillar's Build beat, paired with the Wonder Pebble "Wow!" pattern already established in Phase 1. Reinforced via short sung **chants** (call-and-response between Bubu and narrator), per the Audio Evolution Roadmap (`canon/bubu_audio_bible.md`). |
| **Phase 3 — Song-structure vocabulary** | 31+ | Spin! · Roll! · Count! and further pillar-specific words, introduced gradually | Once Phase 2's words are established, new words are introduced inside **original nursery-rhyme-structure songs** (`canon/bubu_audio_bible.md`) rather than as isolated Build/Payoff labels — by this phase the format itself is familiar enough to support short musical sequences without losing legibility for first-time viewers. |

**Rules that apply at every phase:**
- A new word is never introduced in the **same episode** as a Flagship Wonder Pebble reveal (`canon/wonder_pebble_taxonomy.md`) — vocabulary novelty and collectible novelty are staggered, never stacked.
- "Wow!" remains the universal discovery word at every phase — it is never replaced or rotated out.
- No verbal-introduction exception is ever created for new words — all expansion vocabulary follows the same 1-2 word, large-text, action-synced pattern as the Phase 1 set.
