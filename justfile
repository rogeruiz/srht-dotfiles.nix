# ==========================================================
#    _____               __     _____          _______ __
#  _|     |.--.--.-----.|  |_  |     \.-----. |_     _|  |_
# |       ||  |  |__ --||   _| |  --  |  _  |  _|   |_|   _|
# |_______||_____|_____||____| |_____/|_____| |_______|____|
# ==========================================================

alias help := default

[private]
@default:
    just --list

[doc('Build x86_64 Darwin configuration')]
[macos]
build-darwin:
    @echo "🛠️ Rebuilding x86_64 Darwin"
    darwin-rebuild switch --flake ".#x86_64" --fallback

# Used internally to add files via Git for other scripts.
[private]
add-files tool:
    #!/usr/bin/env bash
    set -euo pipefail

    echo "➕ Attempting to add files for {{ tool }}"
    case "{{ tool }}" in
        "sketchybar")
            git add -v ./module/tools/sketchybar/
            ;;
        *) echo 'Adding {{ tool }} not implemented!' ;;
    esac

[doc('Update flake channel from registry')]
update:
    @echo "🛰️ Updating ./flake.lock and committing it to the repository"
    nix flake update --commit-lock-file

[doc('Develop my Sketchybar configuration')]
[macos]
dev-sketchybar: (add-files "sketchybar") build-darwin
    @echo "🔃 Reloading SketchyBar"
    sketchybar --reload
