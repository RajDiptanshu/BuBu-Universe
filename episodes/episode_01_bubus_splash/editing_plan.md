# Episode 01 — "Bubu's Splash" — Editing Plan

**Pillar:** Water Play | **Hero color:** Turquoise `#4FD1C5` | **Build-beat word:** Tap | **Payoff word:** Splash | **Target runtime:** 10-12s | **Final runtime:** 12s

---

## 1. Scene Order & Timing

| Order | Scene | Beat | Duration | Timecode |
|---|---|---|---|---|
| 1 | Scene 1 | Hello | 2s | 0:00–0:02 |
| 2 | Scene 2 | Build | 4s | 0:02–0:06 |
| 3 | Scene 3 | Anticipation | 2s | 0:06–0:08 |
| 4 | Scene 4 | Payoff | 3s | 0:08–0:11 |
| 5 | Scene 5 | Loop | 1s | 0:11–0:12 |
| | | **Total** | **12s** | within 10-12s target ✅ |

All 5 clips are assembled as a single continuous timeline with **hard cuts only between Scene 5 → Scene 1** (the loop point). Scenes 1-2-3-4-5 should otherwise feel like one continuous static shot — no transition effects (no crossfades, wipes, or zooms) anywhere.

---

## 2. Scene 5 Trim Note

Per `video_prompts.md`, Scene 5 is generated at each tool's minimum supported duration (typically 2s) and then **trimmed down to ~1s** in editing:

- Keep the **final ~1s** of the generated clip — the portion where Bubu is closest to its calm "Curious" resting pose and the puddle has fully faded back to pale blue-gray.
- The very last frame of this trimmed segment should be as close as possible to the first frame of Scene 1 — this match is what makes the hard cut back to Scene 1 read as a seamless loop rather than a jump cut.
- If the trimmed transition still feels like a jump, nudge the trim point by a few frames in either direction until Bubu's pose/puddle color best matches Scene 1's opening frame.

---

## 3. Sound Effects (Single-SFX Rule)

Per the production single-SFX rule (only ONE sound effect for the whole episode, occurring only at the Payoff beat):

| Beat | SFX? | Notes |
|---|---|---|
| Scene 1 — Hello | None | — |
| Scene 2 — Build | None | The 3 "taps" are carried by **music percussion ticks** (see Section 4), not a separate SFX layer. |
| Scene 3 — Anticipation | None | Brief held silence in narration/SFX — music may dip in volume here to heighten contrast before the payoff. |
| Scene 4 — Payoff | **1 SFX: "Splash"** | A single bright, cheerful water-splash sound, triggered exactly at the moment the trunk strikes the puddle (start of 0:08–0:11, i.e. ~0:08.0). This is the episode's only dedicated sound effect. |
| Scene 5 — Loop | None | — |

**Splash SFX selection notes:** choose a short (≤0.5s), clean, non-startling splash sound — bright and "plinky" rather than a deep/heavy splash, to match the toddler-friendly tone and the turquoise color-reveal. Avoid layering any secondary splash/drip tail sounds, which could read as a second SFX.

---

## 4. Music

A single continuous background music track runs under the entire 12s, looping seamlessly from Scene 5 back into Scene 1.

- **Overall character:** warm, gentle, major-key, playful — consistent with the soft pastel visual tone.
- **Build-beat rhythm ticks (Scene 2, 0:02–0:06):** the music includes 3 light percussion ticks (e.g., soft xylophone, wood block, or marimba "plink"), evenly spaced and synced to each of Bubu's 3 trunk taps and the "Tap! Tap! Tap!" narration / "Tap!" text pulses. **These ticks are part of the music bed, not a separate SFX** — per the single-SFX rule, only the Scene 4 splash counts as an SFX.
- **Anticipation dip (Scene 3, 0:06–0:08):** music either holds a sustained, quiet note/drone or dips slightly in volume/density, creating the "held breath" feeling that sets up the Payoff.
- **Payoff swell (Scene 4, 0:08–0:11):** music swells/brightens at 0:08.0, landing in sync with the splash SFX and the "Splash!" text/narration — this is the episode's musical and visual peak.
- **Loop resolve (Scene 5, 0:11–0:12):** music eases back toward its opening phrase/volume so that the loop point (end of Scene 5 → start of Scene 1) is musically seamless as well as visually seamless.

---

## 5. On-Screen Text Timing

Per the on-screen-text rule (text only in Beats 1, 2, and 4):

| Timecode | Text | Behavior |
|---|---|---|
| 0:00–0:02 | "Bubu!" | Fades in, center-upper negative space; fades out by end of Scene 1 (or carries briefly into Scene 2's start before clearing). |
| 0:02 / 0:03.3 / 0:04.6 (approx., 3 evenly-spaced pulses within 0:02–0:06) | "Tap!" | Appears, grows slightly, and fades — once per tap, synced to narration "Tap!" and the music's percussion ticks. |
| 0:06–0:08 | *(none)* | No text during Anticipation. |
| 0:08 | "Splash!" | Large, appears at the instant of impact (synced with SFX + music swell), held through the droplet settle (~0:08–0:11). |
| 0:11–0:12 | *(none)* | No text during Loop — "Tap!"/"Splash!" have already cleared, "Bubu!" does not reappear. |

---

## 6. Narration Timing

| Timecode | Narration | Notes |
|---|---|---|
| 0:00–0:02 | "Bubu!" | Warm, single word, matches on-screen text. |
| 0:02–0:06 | "Tap! Tap! Tap!" | One word per tap (~every 1.2-1.3s), matching on-screen pulses and music ticks. |
| 0:06–0:08 | *(silence)* | No narration — maximizes contrast before the payoff. |
| 0:08–0:11 | "Splash!" | Bright, exclamatory, timed to the impact (0:08.0), matches on-screen text and SFX. |
| 0:11–0:12 | *(optional soft contented hum/exhale, no words)* | Purely optional; if used, keep it very quiet and wordless so it doesn't compete with the loop back into "Bubu!". |

---

## 7. Assembly Checklist

- [ ] Confirm all 5 clips maintain identical framing/composition (Bubu 40-55% of frame height, eyes ~40% from top, center-left) with no drift between clips.
- [ ] Confirm Scene 5's trimmed end frame visually matches Scene 1's opening frame closely enough that the hard cut reads as a loop, not a jump.
- [ ] Place the single "Splash" SFX precisely at 0:08.0 (trunk-impact frame of Scene 4).
- [ ] Verify no other SFX exists anywhere in the timeline.
- [ ] Sync music percussion ticks to the 3 taps in Scene 2 and the music swell to the splash in Scene 4.
- [ ] Sync on-screen text per Section 5 (only Beats 1, 2, 4).
- [ ] Sync narration per Section 6, including the silent gap in Scene 3.
- [ ] Confirm final timeline totals 12s (within the 10-12s target).
- [ ] Export at 9:16 vertical for Shorts/Reels.
