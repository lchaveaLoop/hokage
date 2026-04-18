# Gemini CLI Context for 《我在火影玩数值暴力》

## Project Overview

This repository contains the Chinese web novel **《我在火影玩数值暴力》** (Playing with Numerical Violence in Naruto).
- **Genre**: Naruto fanfiction combined with DNF (Dungeon Fighter Online) game mechanics (热血 + 悲剧 + 系统流).
- **Protagonist**: 李武 (Li Wu) - a transmigrator who brings DNF's power system into the Naruto world.
- **Core Theme**: Breaking bloodline monopoly through DNF mechanics - proving "you can become strong without bloodlines".

## Directory Overview

The workspace is structured to separate the main story chapters, character lore, and world-building guidelines:

- `正文/` (Main Text): Contains the actual story chapters written in Markdown.
- `资料库/人物传记/` (Lore/Biographies): Contains character profiles and biographies.
- `docs/plans/`: Contains writing templates and standards.

## Key Files

- `创作手册_完整版_456章_v2.0.0.md`: The World Bible. Contains rules, themes, conflict cards, and timeline anchors.
- `创作手册_1-150章生产大纲.md`: The active production outline. This is the **PRIMARY** document for guiding current chapter writing.
- `创作手册_151-800章远期里程碑.md`: Long-range milestones and ending spine (for overall direction only).
- `火影忍者时间线.md`: The official timeline, Konoha calendar, and character ages.
- `AGENTS.md` / `CLAUDE.md`: Existing AI collaboration guides containing strict writing rules and workflows.

## Usage and Development Conventions

### The Three-Layer Manual Rule (Critical Priority)
Never violate this priority order for canonical sources when generating content:
1. **Landed prose** (已落地正文): Already written chapters are immutable.
2. **Production outline** (生产大纲): `创作手册_1-150章生产大纲.md` governs active writing.
3. **World bible** (世界圣经): `创作手册_完整版_456章_v2.0.0.md` for rules and themes.
4. **Long-range milestones** (远期里程碑): Direction only, never overrules finished prose.

### File Naming Conventions
- **Chapters**: `正文/{3-digit-number}章_{Title}.md` (e.g., `正文/053章_回到木叶.md`)
- **Characters**: `资料库/人物传记/{3-digit-number}_{CharacterName}.md` (e.g., `资料库/人物传记/001_漩涡鸣人.md`)
- *Note: Numbers must be zero-padded to 3 digits.*

### AI Writing Workflow
1. **Context Context Context**: Always read the last 2-3 chapters for story continuity before writing new content.
2. **Character Check**: Reference specific character files in `资料库/人物传记/` via the `目录索引.md`.
3. **Timeline**: Verify dates and ages against `火影忍者时间线.md`.
4. **Outline Check**: Follow `创作手册_1-150章生产大纲.md` for chapter purpose, hooks, and transitions.
5. **Validation**: Check themes and rules in the World Bible (`创作手册_完整版_456章_v2.0.0.md`).

### Style & Tone Rules
- **Battle Scenes**: Must include spatial anchors (terrain, distance, cover), physical feedback (numbness, breathing), and visible skill effects. Follow the flow: `站位 → 起手 → 变招 → 命中/落空 → 身体反馈 → 场面后果`. Finishing moves require a half-beat windup.
- **System Integration**: DNF UI prompts (e.g., `【霸体护甲生成】`, `【破招判定成功】`) should be integrated naturally as narrative flavor to highlight DNF mechanics crushing Naruto jutsu logic. Do not use blockquote panels for these.
- **Emotional Beats**: Focus on action pauses, broken dialogue, and cold environment changes rather than internal self-pity monologues.
- **Protagonist Tone**: Fast, brutal, and precise in combat. Dark humor, high-status snark, and fiercely protective in daily life.

### General Interaction
- **Language**: Always respond and write in Chinese (使用中文回复).
- **Version Control**: When asked to commit, use descriptive commit messages written in Chinese. Do not commit drafts.