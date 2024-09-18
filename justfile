# Just recipes
# Copyright (C) 2024 Roger Steve Ruiz
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.
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
    *) echo '⚠️ Adding {{ tool }} not implemented!' ;;
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
