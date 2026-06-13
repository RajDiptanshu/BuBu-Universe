# Migration Summary

Migration of the Bubu project from
`C:\Users\tansh\Downloads\toddler_storyboard_analysis\bubu_channel`
into the `BuBu-Universe` repository.

**Migration date:** 2026-06-14
**Mode:** Copy only — originals left untouched in the source folder. Two files renamed during archival (see below). No file contents modified.

## Canon

| Original Path | New Path | Migration Date | Classification Reason |
|---|---|---|---|
| `bubu_channel\bubu_core_identity_block.md` | `canon\bubu_core_identity_block.md` | 2026-06-14 | Layer 1 of canon hierarchy — locked v2 visual identity, single source of truth for Bubu's design |
| `bubu_channel\bubu_personality_bible.md` | `canon\bubu_personality_bible.md` | 2026-06-14 | Layer 2 of canon hierarchy — Bubu's temperament, voice, behavior |
| `bubu_channel\bubu_universe_bible.md` | `canon\bubu_universe_bible.md` | 2026-06-14 | Layer 3 of canon hierarchy — world/setting/supporting characters |
| `bubu_channel\visual_style_guide.md` | `canon\visual_style_guide.md` | 2026-06-14 | Layer 4 of canon hierarchy — visual production spec derived from identity/personality/universe |
| `bubu_channel\content_pillars.md` | `canon\content_pillars.md` | 2026-06-14 | Foundational channel doc referenced by every episode |
| `bubu_channel\engagement_framework.md` | `canon\engagement_framework.md` | 2026-06-14 | Structural template every episode must follow |

(also new in `canon/`: `bubu_project_canon.md`, created as the canon entry point during this migration)

## Production

| Original Path | New Path | Migration Date | Classification Reason |
|---|---|---|---|
| `bubu_channel\production_checklist.md` | `production\production_checklist.md` | 2026-06-14 | Explicit production rule |
| `bubu_channel\bubu_consistency_checklist.md` | `production\bubu_consistency_checklist.md` | 2026-06-14 | Explicit production rule |
| `bubu_channel\pilot_episode_ideas.md` | `production\pilot_episode_ideas.md` | 2026-06-14 | Planning/pipeline doc for selecting future episodes |

## References

| Original Path | New Path | Migration Date | Classification Reason |
|---|---|---|---|
| `bubu_channel\bubu_master_prompt.md` | `references\bubu_master_prompt.md` | 2026-06-14 | Canonical master reference-image prompt used as character-lock for other prompts |
| `bubu_channel\bubu_reference_generation.md` | `references\bubu_reference_generation.md` | 2026-06-14 | Image generation specification — batch reference-image prompts |
| `bubu_channel\bubu_front_view_prompt.md` | `references\bubu_front_view_prompt.md` | 2026-06-14 | View prompt |
| `bubu_channel\bubu_side_view_prompt.md` | `references\bubu_side_view_prompt.md` | 2026-06-14 | View prompt |
| `bubu_channel\bubu_three_quarter_view_prompt.md` | `references\bubu_three_quarter_view_prompt.md` | 2026-06-14 | View prompt |
| `bubu_channel\bubu_curious_expression_prompt.md` | `references\bubu_curious_expression_prompt.md` | 2026-06-14 | Expression prompt |
| `bubu_channel\bubu_delight_expression_prompt.md` | `references\bubu_delight_expression_prompt.md` | 2026-06-14 | Expression prompt |
| `bubu_channel\bubu_focused_expression_prompt.md` | `references\bubu_focused_expression_prompt.md` | 2026-06-14 | Expression prompt |
| `bubu_channel\bubu_surprise_expression_prompt.md` | `references\bubu_surprise_expression_prompt.md` | 2026-06-14 | Expression prompt |

## Episodes

| Original Path | New Path | Migration Date | Classification Reason |
|---|---|---|---|
| `bubu_channel\episode_01_full_package.md` | `episodes\episode_01_bubus_splash\episode_01_full_package.md` | 2026-06-14 | Episode package — title, description, hashtags for Episode 01 |
| `bubu_channel\episode_01_bubus_splash\scene_breakdown.md` | `episodes\episode_01_bubus_splash\scene_breakdown.md` | 2026-06-14 | Episode package component |
| `bubu_channel\episode_01_bubus_splash\image_prompts.md` | `episodes\episode_01_bubus_splash\image_prompts.md` | 2026-06-14 | Episode package component |
| `bubu_channel\episode_01_bubus_splash\video_prompts.md` | `episodes\episode_01_bubus_splash\video_prompts.md` | 2026-06-14 | Episode package component |
| `bubu_channel\episode_01_bubus_splash\editing_plan.md` | `episodes\episode_01_bubus_splash\editing_plan.md` | 2026-06-14 | Episode package component |

## Archive (renamed during archival)

| Original Path | New Path | Migration Date | Classification Reason |
|---|---|---|---|
| `bubu_channel\character_bible.md` | `archive\character_bible_v1.md` | 2026-06-14 | Superseded by canon hierarchy (`bubu_core_identity_block.md` + `visual_style_guide.md` now cover this scope); renamed to `_v1` to mark as a prior version |
| `bubu_channel\prompt_library.md` | `archive\prompt_library_v1.md` | 2026-06-14 | Explicit archive rule; renamed to `_v1` to mark as a prior version |

## Notes

- `seasons/` was created for future use; no files were classified into it during this migration.
- All originals remain in place at `C:\Users\tansh\Downloads\toddler_storyboard_analysis\bubu_channel` — nothing was deleted.
- File contents were not modified; this migration only copied, renamed (archive only), and organized files.
