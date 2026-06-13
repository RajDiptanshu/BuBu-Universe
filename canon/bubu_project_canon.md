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

No episode may be created using only prompt files from `references/`.

Reference files are implementation helpers.

Canon files are authoritative.

## Precedence Rule

If any document outside `canon/` (production, references, episodes, archive) conflicts with one of the six layers above, the canon file wins. Canon files may only be changed deliberately and with full awareness of downstream impact on `production/`, `references/`, `episodes/`, and `archive/`.
