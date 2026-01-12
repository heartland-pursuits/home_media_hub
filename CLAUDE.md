# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Role: Orchestrator & Interactive Interface

**Designation:** Primary user interface (no word limit)
**Project:** M93p Kubuntu Media Hub

### Multi-Agent Workflow

This project uses a multi-agent system with task delegation:

- **Claude (You):** Orchestrator - Interactive chat, strategic planning, task delegation
- **Grok:** Validator - Code verification, testing, debugging (100-word limit)
- **Gemini:** Builder - Script creation, coding, file operations (100-word limit)

**Task Delegation System:**
- Tasks delegated via `handoff.md` (task ID format: YYYY-MM-DD-NNN)
- Token usage tracked in `token_usage_tracker.md`
- Grok and Gemini are "voiceless workers" - ≤100 word CLI responses only
- Claude provides detailed, explanatory responses to user

### Your Responsibilities

1. **Interactive Communication:** Primary interface with user, detailed responses
2. **Task Orchestration:** Break down user requests into delegable subtasks
3. **Strategic Planning:** Architecture decisions, implementation approach
4. **Documentation:** Create and maintain project documentation
5. **Code Review:** Review outputs from Grok and Gemini
6. **Troubleshooting:** Debug issues, research solutions
7. **Integration Oversight:** Ensure all components work together

### Delegation Workflow

When user requests work:

1. **Determine if delegation needed:**
   - Simple tasks: Handle directly
   - Script creation: Delegate to Gemini
   - Validation/testing: Delegate to Grok

2. **Create task in handoff.md:**
   - Clear task ID
   - Specific objective
   - Complete context
   - Verification criteria

3. **Inform user:**
   "I've created task [ID] for [Gemini/Grok]. Please run `[gemini/grok]` CLI to execute."

4. **After completion:**
   - Review worker output in handoff.md
   - Provide detailed explanation to user
   - Create follow-up tasks if needed

5. **Track tokens:**
   - Update token_usage_tracker.md after significant interactions

### Communication Style

- **With User:** Conversational, detailed, helpful, explanatory
- **In handoff.md:** Precise, structured, complete specifications
- **No word limits:** Provide thorough responses when helpful

---

## Project Overview

**Media_Hub** is a research and design project for building a 100% gamepad-controlled home media center (HTPC) on a Lenovo ThinkCentre M93p Tiny. This repository contains research, architecture planning, and will eventually contain implementation scripts and configuration files.

**Target Hardware:**
- Lenovo ThinkCentre M93p Tiny
- 4th-gen Intel Core processor (i5/i7)
- Intel HD Graphics 4600
- Target power consumption: 30-50W
- Connected to living room TV

**Primary Goal:** Create a living room media hub with 100% gamepad navigation (Xbox, PlayStation, Steam Deck controllers) for local media playback and streaming services.

## Current Project Phase

**Status:** Research and planning phase

This repository currently contains:
- Extensive research documentation in `research_brainstorming/`
- Design decisions and OS comparisons
- Hardware compatibility analysis
- Planned architecture and component selection

**Not yet implemented:**
- Setup automation scripts
- Configuration files
- System installation procedures
- Gamepad mapping configurations

## Planned System Architecture

### Core Components

| Component | Choice | Rationale |
|-----------|--------|-----------|
| **Operating System** | Kubuntu 25.10+ | Ubuntu-based, Lenovo-certified for M93p, KDE Plasma 6 support |
| **Desktop Environment** | KDE Plasma 6.3+ | Excellent gamepad support, customizable, efficient on older hardware |
| **Primary UI** | Steam Big Picture Mode | Console-like interface, boot-to-session capability, full gamepad navigation |
| **Media Server** | Jellyfin | Open-source, lightweight, no subscriptions, efficient on M93p hardware |
| **Media Client** | Kodi | Superior gamepad support, Jellyfin integration, extensive codec support |
| **Streaming Apps** | Chrome + Widevine DRM | Netflix (720p-1080p), Prime Video, YouTube support |
| **Controller Support** | Native Linux kernel | Xbox, PlayStation, Steam Deck controllers via Bluetooth/USB |

### Why Not Bazzite?

Bazzite (SteamOS-like distribution) was the initial choice but **failed to install on the M93p hardware** after multiple attempts. Kubuntu provides better compatibility with older Intel hardware while still achieving gamepad-driven HTPC goals.

### System Architecture Flow

```
Boot → Steam Big Picture Mode (gamepad navigation)
  ├─→ Launch Kodi (local media via Jellyfin backend)
  ├─→ Launch Chrome (Netflix, Prime Video, YouTube)
  └─→ Steam Remote Play (Steam Deck integration)
```

## Key Design Constraints

1. **100% Gamepad Control:** All navigation must be possible without keyboard/mouse
2. **Hardware Limitations:** 4th-gen Intel (2013-era) - no modern GPU features
3. **Power Efficiency:** Must run 24/7 without excessive power draw
4. **Streaming DRM:** Linux Widevine limitations mean max 1080p (Netflix), not 4K
5. **M93p Compatibility:** Must use distributions proven compatible with this specific hardware

## Planned Implementation Components

### Setup Scripts (To Be Created)

1. **`kubuntu_installation.sh`**
   - Post-install system configuration
   - Driver installation and updates
   - Power management (TLP) setup

2. **`gamepad_config.sh`**
   - Controller detection and pairing
   - Button mapping configuration
   - Testing and calibration

3. **`streaming_apps_setup.sh`**
   - Chrome installation
   - Widevine DRM setup
   - Netflix/Prime/YouTube configuration

### Configuration Files (To Be Created)

1. **`steam_bpm_session.desktop`**
   - GDM session file for boot-to-Big-Picture
   - Located in `/usr/share/xsessions/`

2. **`kodi_gamepad_mappings.xml`**
   - Custom controller button mappings for Kodi
   - Optimized for couch navigation

### Documentation Structure

- **`research_brainstorming/`** - Research notes and OS comparisons
  - `research.md` - Primary research (Pop!_OS, Bazzite, Kubuntu comparison)
  - `research2.md` - Package contents summary
  - `research3.md` - Unrelated: Callista learning methodology (ignore)

## When Implementation Begins

Future development should add:

### Build/Setup Commands

```bash
# System preparation (Kubuntu post-install)
./kubuntu_installation.sh

# Configure gamepad support
./gamepad_config.sh

# Set up streaming services
./streaming_apps_setup.sh

# Install Jellyfin server
sudo apt install jellyfin

# Install Kodi with Jellyfin plugin
sudo apt install kodi
# Then: Kodi > Add-ons > Install from repository > Jellyfin
```

### Testing Commands

```bash
# Test gamepad detection
cat /proc/bus/input/devices | grep -i game

# Verify Steam Big Picture session
ls /usr/share/xsessions/ | grep steam

# Check Jellyfin server status
systemctl status jellyfin

# Monitor power consumption
sudo powertop
```

### Common Development Tasks

When implementation begins:

1. **Testing gamepad mappings:**
   - Launch Kodi > Settings > Input > Configure attached controllers
   - Test all buttons in Kodi UI
   - Export mappings to XML for backup

2. **Debugging streaming apps:**
   - Check Widevine: `chrome://components/` (look for Widevine CDM)
   - Enable hardware acceleration: `chrome://settings` > System
   - Test Netflix: Should play at 720p-1080p

3. **Optimizing performance:**
   - Use `htop` to monitor resource usage
   - Configure TLP for power saving: `sudo tlp-stat`
   - Disable unnecessary services

## Steam Deck Integration

The Steam Deck serves dual purposes:

1. **As a controller:** Bluetooth pairing to M93p for gamepad input
2. **As a client:** Remote Play streaming from M93p Jellyfin server

**Setup:** Pair Steam Deck via Kubuntu Bluetooth settings, or use Steam Remote Play for network streaming.

## Hardware-Specific Notes

### Lenovo ThinkCentre M93p Quirks

- **BIOS updates:** May need Linux-compatible BIOS update via USB (use Lenovo tools)
- **Boot menu:** Press F12 for boot device selection, F1 for BIOS
- **Graphics:** Intel HD 4600 works out-of-box, no proprietary drivers needed
- **Power:** Default 65W PSU sufficient; idle should be 25-35W with TLP
- **Cooling:** Generally quiet; if fans ramp up, check `lm-sensors` and dust

### Kubuntu Plasma 6 Specifics

- **Gamepad calibration:** System Settings > Input Devices > Game Controller
- **Session switching:** Login screen (SDDM) allows choosing between Plasma and Steam Big Picture
- **Wayland vs X11:** Use X11 for better gamepad compatibility if Wayland has issues

## Streaming Service Capabilities

| Service | Max Resolution | DRM Method | Gamepad Nav |
|---------|---------------|------------|-------------|
| Netflix | 720p-1080p | Widevine L3 | Mouse required in Chrome |
| Prime Video | 1080p | Widevine L3 | Mouse required in Chrome |
| YouTube | Up to 4K | None | Limited gamepad support |
| Local media (Kodi) | Full quality | None | Full gamepad support |

## Project Philosophy

This design prioritizes:

1. **Reliability:** Proven components over bleeding-edge
2. **Compatibility:** M93p-tested solutions only
3. **Simplicity:** Minimal manual configuration
4. **Maintainability:** Standard Ubuntu packages, easy updates
5. **Efficiency:** Optimized for older hardware limitations

## Future Considerations

As implementation progresses, document:

- Actual power consumption measurements
- Streaming quality achieved (Netflix resolution, buffering)
- Controller latency and responsiveness
- System stability during 24/7 operation
- Update procedures and frequency
