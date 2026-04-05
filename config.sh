#!/usr/bin/env bash
# claude-autowake configuration
# Edit these values to customize your schedule.

# ── Schedule ──────────────────────────────────────────────────────────
# Ping times in HH:MM (24-hour) format.
# Must be >= 5 hours apart. install.sh will validate this.
PING_TIMES=("06:00" "11:05" "16:10")

# Minutes before the first ping to wake the Mac from sleep.
WAKE_LEAD_MINUTES=3

# Only run on weekdays (Mon–Fri). Set to true to skip weekends.
WEEKDAYS_ONLY=false

# ── Claude CLI ────────────────────────────────────────────────────────
CLAUDE_BIN="claude"

# Model to use — haiku is cheapest, just enough to start the window.
CLAUDE_MODEL="haiku"

# Messages to send — one is picked at random each ping.
# Feel free to add, remove, or customize these.
PING_MESSAGES=(
    "hi"
    "good morning"
    "hey there"
    "rise and shine"
    "wakey wakey"
    "top of the morning"
    "hello world"
    "gm"
    "yo"
    "howdy"
    "greetings"
    "sup"
    "hola"
    "bonjour"
    "aloha"
    "ahoy"
    "hey hey"
    "morning sunshine"
    "lets go"
    "ready to roll"
    "reporting for duty"
    "up and at em"
    "new day new tokens"
    "ping"
    "wake up call"
)

# Extra flags to pass to the claude CLI (e.g., "--dangerouslySkipPermissions").
CLAUDE_EXTRA_FLAGS=""

# Optional: cd into this directory before running claude.
# Leave empty to use a temp directory.
PING_WORKING_DIR=""

# ── Caffeinate ────────────────────────────────────────────────────────
# Keep Mac awake after the first ping.
# "auto" = calculated from ping times (first-to-last span + 10 min buffer).
# Or set a number of seconds manually (e.g., 43200 = 12 hours).
CAFFEINATE_SECONDS="auto"

# ── Logging ───────────────────────────────────────────────────────────
LOG_DIR="$HOME/.claude-autowake/logs"

# Max log files to keep (oldest are pruned on each run).
MAX_LOG_FILES=30
