# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Chinese web novel project: **《我在火影玩数值暴力》** (Playing with Numerical Violence in Naruto).

**Genre**: Naruto fanfiction with DNF (Dungeon Fighter Online) game mechanics
**Protagonist**: 李武 (Li Wu) - a transmigrator who brings DNF's power system into the Naruto world
**Core Theme**: Breaking bloodline monopoly through DNF mechanics - proving "you can become strong without bloodlines"

## Repository Structure

```
正文/                          # Main story chapters (numbered: 001章_标题.md)
资料库/人物传记/               # Character biographies and profiles
创作手册_完整版_456章_v2.0.0.md  # World bible + index
创作手册_1-150章生产大纲.md     # Active production outline
创作手册_151-800章远期里程碑.md # Long-range milestones
火影忍者时间线.md               # Naruto timeline reference (Konoha calendar)
AGENTS.md                      # Collaboration guide for AI agents
```

## File Naming Conventions

**Chapter files**: `正文/{序号}章_{标题}.md`
- Example: `正文/053章_回到木叶.md`
- Use 3-digit zero-padded numbers (001, 002, etc.)

**Character files**: `资料库/人物传记/{序号}_{角色名}.md`
- Example: `资料库/人物传记/001_漩涡鸣人.md`

## Writing Guidelines

1. **Story continuity**: New chapters must connect with previous chapters - always read the last 2-3 chapters before writing new content
2. **Character consistency**: Follow character profiles in `资料库/人物传记/` and personality guidelines in the creation manual
3. **Timeline accuracy**: Reference `火影忍者时间线.md` for Konoha calendar dates and character ages
4. **Tone balance**: Mix hot-blooded action with tragic undertones and human struggles
5. **World bible first**: Use `创作手册_完整版_456章_v2.0.0.md` for rules, conflict tables, and theme control
6. **Production first for active arcs**: Use `创作手册_1-150章生产大纲.md` to guide landed chapters
7. **Long-range only for direction**: Use `创作手册_151-800章远期里程碑.md` to control future arcs without overruling finished prose
8. **Core conflict**: DNF mechanics vs Naruto bloodline system - protagonist proves strength without bloodlines

## Key Reference Files

- **创作手册_完整版_456章_v2.0.0.md**: World bible, conflict cards, system rules, and timeline anchors
- **创作手册_1-150章生产大纲.md**: Active production outline for the current writing range
- **创作手册_151-800章远期里程碑.md**: Long-range milestones and ending spine
- **火影忍者时间线.md**: Official Naruto timeline with Konoha calendar system
- **AGENTS.md**: Project overview and collaboration notes

## Content Restrictions

- Avoid excessive violence and gore descriptions
- Keep content appropriate for web novel platforms
- Respect established character personalities from the creation manual

## Git Workflow

This project uses standard git workflow. Chapter files are tracked and committed as they are completed or revised.
