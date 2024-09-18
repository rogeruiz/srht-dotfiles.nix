# Home Manager Language Servers module
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

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    universal-ctags
    tree-sitter
    lua-language-server
    nixd
    yaml-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    # python312Packages.python-lsp-server
    marksman
    go
    shellcheck
    shfmt
  ];
}
