#!/bin/bash
# ==============================================================================
# Project: Homelab Logger CLI
# Description: A lightweight Bash tool for timestamped logging and Git sync.
# Author: kord1an
# License: MIT
# ==============================================================================

# Configuration
# Default directory for logs. Change this if needed.
HL_LOG_DIR="$HOME/Repos/homelab-logs"

# Main logging function
hl() {
    local date_stamp=$(date +%Y-%m-%d)
    local time_stamp=$(date +%H:%M)
    local log_file="$HL_LOG_DIR/$date_stamp.md"

    # Ensure log directory exists
    if [ ! -d "$HL_LOG_DIR" ]; then
        echo -e "\033[0;31mError: Log directory $HL_LOG_DIR does not exist.\033[0m"
        echo "Please create it or update the HL_LOG_DIR variable."
        return 1
    fi

    # Initialize daily log file if not present
    if [ ! -f "$log_file" ]; then
        echo "# 📔 Daily Log - $date_stamp" > "$log_file"
        echo "" >> "$log_file"
        echo -e "\033[0;33m✨ Created new log file: $log_file\033[0m"
    fi

    # Logic: No arguments = Open Editor | Arguments = Append Log
    if [ -z "$1" ]; then
        # Detect available editor (VS Code -> Nano -> Vi)
        if command -v code &> /dev/null; then
            code "$log_file"
        elif command -v nano &> /dev/null; then
            nano "$log_file"
        else
            vi "$log_file"
        fi
    else
        # Append the log entry with timestamp
        echo "- **$time_stamp** - $*" >> "$log_file"
        echo -e "\033[0;32m✔ Logged:\033[0m $time_stamp - $*"
    fi
}

# Git synchronization function
hlsync() {
    # Check if the directory is a git repository
    if [ ! -d "$HL_LOG_DIR/.git" ]; then
        echo -e "\033[0;31mError: $HL_LOG_DIR is not a git repository.\033[0m"
        return 1
    fi

    echo -e "\033[0;34m🔄 Syncing logs with remote repository...\033[0m"
    
    # Execute git commands in the log directory
    (
        cd "$HL_LOG_DIR" || return
        git add .
        git commit -m "Log update: $(date '+%Y-%m-%d %H:%M')"
        git push
    )
    
    if [ $? -eq 0 ]; then
        echo -e "\033[0;32m🚀 Sync complete!\033[0m"
    else
        echo -e "\033[0;31m❌ Sync failed. Check git status.\033[0m"
    fi
}
