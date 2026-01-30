# ~/.config/bash/bookmarks.sh

BM_FILE="$HOME/.bookmarks"

sb() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Usage: sb <name>"
        return 1
    fi
    printf '%s\t%s\n' "$name" "$PWD" > "$BM_FILE.tmp"
    if [ -f "$BM_FILE" ]; then
        grep -v "^$name\t" "$BM_FILE" >> "$BM_FILE.tmp"
    fi
    mv "$BM_FILE.tmp" "$BM_FILE"
    echo "Bookmark '$name' set to '$PWD'"
}

gb() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Usage: gb <name>"
        return 1
    fi
    local path
    path=$(awk -F'\t' "\$1 == \"$name\" {print \$2; exit}" "$BM_FILE")
    if [ -z "$path" ]; then
        echo "Bookmark '$name' not found"
        return 1
    fi
    if [ ! -d "$path" ]; then
        echo "Bookmark '$name' points to non‑existent directory: $path"
        return 1
    fi
    cd "$path"
}

lb() {
    if [ ! -f "$BM_FILE" ]; then
        echo "No bookmarks yet."
        return
    fi
    printf '%-20s %s\n' "NAME" "PATH"
    while IFS=$'\t' read -r name path; do
        printf '%-20s %s\n' "$name" "$path"
    done < "$BM_FILE"
}

rb() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Usage: rb <name>"
        return 1
    fi
    if [ ! -f "$BM_FILE" ]; then
        echo "No bookmarks to remove."
        return 1
    fi
    if ! grep -q "^$name\t" "$BM_FILE"; then
        echo "Bookmark '$name' not found"
        return 1
    fi
    grep -v "^$name\t" "$BM_FILE" > "$BM_FILE.tmp"
    mv "$BM_FILE.tmp" "$BM_FILE"
    echo "Bookmark '$name' removed"
}

