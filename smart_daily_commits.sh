#!/bin/bash

# Set your actual repo path
REPO_PATH="/Users/ja20465253/Documents/repos/Daily-practice"
cd "$REPO_PATH" || { echo "❌ Repo path not found!"; exit 1; }


# Create a list of realistic commit messages
commit_messages=(
    "Update deployment script"
    "Refactor logging module"
    "Improve error handling"
    "Update README with latest info"
    "Add new environment variables"
    "Fix typo in documentation"
    "Optimize build process"
    "Add debug logs"
    "Update changelog"
    "Improve script comments"
)

# Create or rotate dummy files
file_prefix="update_log"
mkdir -p logs

# Loop to make 50 commits
for i in {1..50}
do
    file="logs/${file_prefix}_$((i % 10)).txt"
    echo "Log entry $i on $(date)" >> "$file"

    git add "$file"

    # Pick a random commit message
    msg=${commit_messages[$RANDOM % ${#commit_messages[@]}]}
    git commit -m "$msg #$i"

    # Random delay between 1–5 seconds
    sleep $((RANDOM % 5 + 1))
done

# Push all commits
git push origin main  # Change 'main' to your branch name if needed

echo "✅ 50 smart commits pushed successfully!"

