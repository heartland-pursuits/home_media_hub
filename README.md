# Media Hub - AI-Orchestrated Home Entertainment Console

> **An AI Orchestration Project for Home Entertainment System Design and System Administration Learning**

## Project Overview

This project demonstrates **AI-orchestrated system design** for building a gamepad-controlled home entertainment console on a Lenovo ThinkCentre M93p Tiny running Kubuntu 25.10.

**This is NOT a traditional coding project.** This is a showcase of:
- AI agent orchestration and delegation
- System architecture design
- Desktop UI/UX development
- Infrastructure automation through AI collaboration

## Credits

**Project Lead & Architect:** Joshua
- System design and architecture
- AI orchestration and task delegation  
- UI/UX design philosophy
- Infrastructure planning

**Implementation:**
- **Claude (Sonnet 4.5):** Primary orchestrator, strategic planning, documentation
- **Gemini:** Script creation, automation, code generation
- **Grok:** Validation, testing, debugging, system diagnostics

## Project Goals

1. **100% Gamepad-Controlled HTPC**
   - Zero mouse/keyboard requirement
   - Console-like user experience
   - Anti-Xbox design philosophy (minimal, zero redundancy)

2. **Learning Platform**
   - System administration skills
   - Desktop UI/UX development
   - AI orchestration workflows
   - Linux desktop customization

3. **Home Entertainment Hub**
   - Streaming services (Netflix, Prime, YouTube)
   - Retro gaming (RetroArch + network ROM library)
   - Music services
   - AI assistant integration

## Architecture

### Hardware
- Lenovo ThinkCentre M93p Tiny
- Intel Core i5/i7 (4th gen)
- Intel HD Graphics 4600
- 8BitDo Ultimate Wireless Controller

### Software Stack
- **OS:** Kubuntu 25.10 (KDE Plasma 6)
- **Theme:** Layan (dark mode)
- **Icons:** Papirus-Dark (128px, TV-optimized)
- **Desktop:** 4 virtual desktops (Streaming, Games, Music, AI & Social)
- **Gamepad Mapper:** AntiMicroX
- **Media Backend:** Jellyfin + Kodi
- **ROM Library:** SSHFS-mounted Batocera system (166 NES, 145 SNES, 111 Genesis ROMs)

### AI Orchestration Workflow

```
User (Joshua)
    │
    ├─→ Claude (Orchestrator)
    │       ├─→ Gemini (Builder) - Script creation, automation
    │       └─→ Grok (Validator) - Testing, debugging, verification
    │
    └─→ Task Delegation via handoff.md
```

## Design Philosophy

**Zero Redundancy Principle:**
- Each app has ONE location only
- No duplicates across desktops, panels, or menus
- Minimal UI surface, maximum functionality

**Anti-Xbox Design:**
- Reject nested menus and bloated interfaces
- Direct access: One button press per app
- Clean decision trees for gamepad navigation

## Project Status

### Completed Phases

- ✅ Phase 1: Foundation (OS installation, package management)
- ✅ Phase 2: Theme & Desktop Configuration
  - Layan theme preserved
  - Papirus-Dark icons applied (TV-optimized)
  - 4 virtual desktops configured

### In Progress

- ⏳ Phase 3: Gamepad Configuration (AntiMicroX mapping)
- ⏳ Phase 4: App Launchers & PWAs
- ⏳ Phase 5: Panel Design

### Planned

- 📋 Phase 6: RetroArch Integration
- 📋 Phase 7: Streaming Service Setup
- 📋 Phase 8: Final Polish & Testing

## Documentation

- [Orchestration Playbook](ORCHESTRATION.md) - Task templates and delegation patterns
- [Session Logs](docs/sessions/) - Detailed phase documentation
- [Architecture Docs](docs/architecture/) - System design decisions

## What Makes This Project Unique

1. **AI Orchestration Showcase:** Demonstrates effective multi-agent AI delegation
2. **Practical Learning:** Real-world system administration and UI/UX development
3. **Design-First Approach:** User experience drives technical decisions
4. **Zero Redundancy Philosophy:** Clean, minimal interface design
5. **Transparent Process:** Full documentation of orchestration workflow

## License

This project uses dual licensing to protect intellectual property while allowing educational use:

- **Code/Scripts:** Apache 2.0 (see [LICENSE-CODE.md](LICENSE-CODE.md))
- **Documentation/Methodology:** CC BY-NC-ND 4.0 (see [LICENSE-DOCUMENTATION.md](LICENSE-DOCUMENTATION.md))  
- **Copyright:** All rights reserved (see [COPYRIGHT.md](COPYRIGHT.md))

**Commercial use requires explicit permission.**

### What This Means

✅ **You CAN:**
- Study the orchestration methodology  
- Learn from the architectural decisions
- Use for personal/educational projects (with attribution)

❌ **You CANNOT (without permission):**
- Use commercially
- Modify and redistribute the methodology
- Claim the orchestration framework as your own

For commercial licensing inquiries: [Contact info]

## Acknowledgments

- AI Models: Anthropic Claude (Sonnet 4.5), Google Gemini, xAI Grok
- Community: KDE Plasma, Papirus Icons, Layan Theme
