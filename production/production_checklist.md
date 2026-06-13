# Production Checklist — Idea to Published Short

Follow this exact order for every episode. Steps reference the other files in this folder.

---

## Phase 1 — Pre-Production

- [ ] **1.1** Select episode from `pilot_episode_ideas.md` (or extend using `content_pillars.md` variable slots for episodes 21+).
- [ ] **1.2** Confirm: pillar, hero color, key word, payoff object/motion — write these 4 items down before generating anything.
- [ ] **1.3** Fill in the 5-beat storyboard table (per `engagement_framework.md` timing) with episode-specific details, following the structure in `episode_01_full_package.md` as a template.
- [ ] **1.4** Write the on-screen text labels for Beats 1, 2, and 4 (1–2 words each, per the rules).

---

## Phase 2 — Prompt Assembly

- [ ] **2.1** For each of the 5 beats, assemble the full image prompt using the `prompt_library.md` Quick Assembly Template (Master + Style + Camera + Expression + Pillar + episode details + Negative).
- [ ] **2.2** For each of the 5 beats, write the corresponding video prompt (motion description only — image prompts define appearance, video prompts define movement, per `episode_01_full_package.md` examples).
- [ ] **2.3** Double-check every prompt includes the fixed hex palette and the correct one of the 4 expressions for that beat.

---

## Phase 3 — Asset Generation (Image First, Then Video)

- [ ] **3.1** Generate Beat 1 keyframe image first — this is the "reference frame" for the episode. Regenerate until Bubu's proportions, ears, trunk, and palette match `character_bible.md` exactly.
- [ ] **3.2** Using the Beat 1 keyframe as a visual reference (img2img / character-lock / reference-image feature of your tool), generate keyframes for Beats 2, 3, 4, and 5 — only the expression, trunk position, and payoff-object state should change; everything else must match Beat 1.
- [ ] **3.3** Visual consistency check across all 5 keyframes: same ear size/shape, same body color, same background composition, same camera framing. Regenerate any frame that drifts before proceeding.
- [ ] **3.4** Generate video clips for each beat using image-to-video (Kling/Veo/Higgsfield/etc.), using the Beat keyframe as the starting frame and the corresponding video prompt for motion.
- [ ] **3.5** Review each video clip for: static camera (no drift/zoom artifacts), correct motion per beat, no extra limbs/objects appearing mid-clip. Regenerate if any artifact appears.

---

## Phase 4 — Audio

- [ ] **4.1** Select/compose the continuous background music track (instrumental, matches pillar's tempo character per `04_content_pillars.md` notes where applicable).
- [ ] **4.2** Select the episode's **single** sound effect (payoff sound) — confirm it does not play anywhere except the Beat 4 payoff frame.
- [ ] **4.3** Sync music rhythm hits to Beat 2's repeated actions (mallet/percussion tick per repetition).

---

## Phase 5 — Assembly / Editing

- [ ] **5.1** Concatenate the 5 beat video clips in order (1→2→3→4→5) with **no transition effects** (hard joins only — the visual continuity should already match).
- [ ] **5.2** Overlay on-screen text labels at the correct timestamps (Beat 1: key word in; Beat 2: pulses x2–3; Beat 4: payoff word). Text style: large, rounded friendly font, high-contrast color, positioned in the reserved upper-third negative space, never overlapping Bubu or the payoff object.
- [ ] **5.3** Layer background music under the full timeline; insert the single payoff SFX exactly on the Beat 4 payoff frame.
- [ ] **5.4** Trim/verify total runtime is 10–15 seconds (default 12s).
- [ ] **5.5** Confirm Beat 5's final frame matches Beat 1's opening frame closely enough for a seamless loop when the platform auto-replays.

---

## Phase 6 — QA Pass

- [ ] **6.1** Watch full episode at actual size (vertical phone-sized preview) — confirm readability of text and clarity of the payoff at small scale.
- [ ] **6.2** Verify against `character_bible.md` Do/Don't list — no tusks, no wrinkles, no extra accessories, correct palette.
- [ ] **6.3** Verify against `visual_style_guide.md` — object count ≤5, background complexity ≤3/10, single hero color, static camera throughout.
- [ ] **6.4** Confirm only one sound effect plays, and only at the payoff.
- [ ] **6.5** Confirm on-screen text is 1–2 words only, no other text/dialogue anywhere.

---

## Phase 7 — Export

- [ ] **7.1** Export vertical 9:16, minimum 1080x1920, MP4 (H.264), 30fps.
- [ ] **7.2** Export a thumbnail frame using the dedicated thumbnail prompt (per episode package) — separate from the in-video frames, optimized for small preview readability.
- [ ] **7.3** File naming convention: `bubu_ep{NN}_{pillar}_{keyword}.mp4` (e.g., `bubu_ep01_waterplay_splash.mp4`).

---

## Phase 8 — Metadata & Publish

- [ ] **8.1** Title: follow the pattern `Bubu [Action]! [emoji] [Pillar Theme] | Learn with Bubu` (see `episode_01_full_package.md` example).
- [ ] **8.2** Description: 1–2 short sentences naming the key word and inviting replay (per episode package template).
- [ ] **8.3** Hashtags: reuse the core hashtag set from `episode_01_full_package.md`, swap in 1–2 pillar/keyword-specific tags per episode.
- [ ] **8.4** Upload as a YouTube Short (vertical, ≤60s).
- [ ] **8.5** Set as part of the channel's Shorts playlist/feed in publishing order (Colors/Shapes/Counting easy-batch first per `pilot_episode_ideas.md`, then expand pillars).

---

## Phase 9 — Post-Publish

- [ ] **9.1** Log the episode (number, pillar, hero color, key word, retention-rank if from pilot list) in a running episode tracker for continuity across 100+ episodes.
- [ ] **9.2** Note any prompt adjustments that improved consistency — fold confirmed improvements back into `prompt_library.md` so future episodes benefit.
- [ ] **9.3** After every ~10 episodes, re-check a sample against `character_bible.md` to catch any gradual design drift before it compounds across the series.
