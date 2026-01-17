# Homelab Logger CLI 📓

> A lightweight, bash-based tool for sysadmins and homelab enthusiasts to keep track of their work without leaving the terminal.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Bash](https://img.shields.io/badge/language-Bash-green.svg)

## 🚀 Why?

As a homelab operator, I often found myself fixing a complex issue (like a Proxmox cluster network failure) and forgetting the exact steps I took two weeks later. Switching context to a GUI note-taking app breaks the flow. 

**Homelab Logger (`hl`)** solves this by allowing you to append timestamped notes directly from your terminal.

## ✨ Features

- **Zero Friction:** Type `hl "fixed firewall rule"` to log instantly.
- **Auto-Timestamping:** Every entry gets a `HH:MM` timestamp automatically.
- **Daily Files:** Automatically creates a new Markdown file for each day (e.g., `2026-01-17.md`).
- **Git Sync:** Built-in `hlsync` command to backup your logs to a private GitHub repository.
- **Smart Editor:** Typing just `hl` opens today's log in VS Code (or Nano/Vi).

## 🛠️ Installation

### Step 1: Clone the repository

Clone the tool to your home directory (hidden folder recommended).

```bash
git clone https://github.com/kord1an/homelab-logger-cli.git ~/.homelab-logger-cli
```

### Step 2: Enable in Shell
Add the source command to your configuration file (`.bashrc` or `.zshrc`) to load it automatically.

```bash
echo 'source ~/.homelab-logger-cli/hl.sh' >> ~/.bashrc
source ~/.bashrc
```

### Step 3: Configuration (Optional)
The default log location is `~/homelab-logs`.
To change it, edit `~/.homelab-logger-cli/hl.sh` and update the `HL_LOG_DIR` variable.



## 📖 Usage

### Quick Log
Append a note with the current timestamp:
```bash
hl "Disabled ASPM on Intel NIC to fix hardware hang"
```
*Output in file:*
`- **22:45** - Disabled ASPM on Intel NIC to fix hardware hang`

### Edit Mode
Open today's log file in your default editor:
```bash
hl
```

### Cloud Backup
Push changes to your private log repository:
```bash
hlsync
```

## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.
😉
