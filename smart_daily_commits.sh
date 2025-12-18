#!/bin/bash

# ================= CONFIG =================
REPO_PATH="/Users/vicky/Documents/Git-Repos/Daily-practice"
BRANCH="main"
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/daily_log.txt"

export PATH="/usr/bin:/bin:/usr/local/bin"

cd "$REPO_PATH" || exit 1
mkdir -p "$LOG_DIR"

# ================= DAY BASED COMMIT COUNT =================
DAY=$(date +%u)   # 1=Mon ... 7=Sun

case $DAY in
  1) COMMITS=5 ;;   # Monday
  2) COMMITS=20 ;;  # Tuesday
  3) COMMITS=24 ;;  # Wednesday
  4) COMMITS=32 ;;  # Thursday
  5) COMMITS=45 ;;  # Friday
  6) COMMITS=15 ;;  # Saturday
  7) exit 0 ;;      # Sunday → NO commits
esac

# ================= COMMIT MESSAGES =================
commit_messages=(
  "Daily practice update"
  "Minor refactor"
  "Improve logging"
  "Update documentation"
  "Cleanup scripts"
  "Maintenance update"
  "Fix small typo"
  "Config update"
)

# ================= MAKE COMMITS =================
for ((i=1; i<=COMMITS; i++))
do
  timestamp=$(date "+%Y-%m-%d %H:%M:%S")

  echo "Update $i at $timestamp" >> "$LOG_FILE"
  git add "$LOG_FILE"

  msg=${commit_messages[$((RANDOM % ${#commit_messages[@]}))]}
  git commit -m "$msg ($i/$COMMITS)"

  sleep 1
done

git push origin "$BRANCH"

