# Bubu Project Canon — Read This First

This file is the entry point for the Bubu Universe project. Any session (human or AI) working on Bubu content must read this file first, then follow the canon hierarchy below **in order**. Each layer builds on and must remain consistent with the layers above it.

## Canon Reading Order

1. **[Core Identity](bubu_core_identity_block.md)** — `bubu_core_identity_block.md`
   Locked v2 visual identity. The single source of truth for Bubu's design (silhouette, proportions, palette, ears, trunk). Nothing below may contradict this.

2. **[Personality](bubu_personality_bible.md)** — `bubu_personality_bible.md`
   Who Bubu is: temperament, voice, behavior patterns. Built on top of the locked identity.

3. **[Universe](bubu_universe_bible.md)** — `bubu_universe_bible.md`
   The world Bubu exists in: setting, supporting characters, rules of the world.

4. **[Visual Style](visual_style_guide.md)** — `visual_style_guide.md`
   The visual production spec that locks down what must stay constant across all AI-generated episodes, derived from the identity, personality, and universe above.

## Precedence Rule

If any document outside `canon/` (production, references, episodes, archive) conflicts with one of the four files above, the canon file wins. Canon files may only be changed deliberately and with full awareness of downstream impact on `production/`, `references/`, `episodes/`, and `archive/`.
