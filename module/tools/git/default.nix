# Home Manager Nix module for Git
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

{ pkgs, config, ... }:

let
  skylight-include-file = ".config/git/includes/skylight.inc";
  ghFile = "${config.home.homeDirectory}/.files.nix/module/tools/git/gh.yml";
  ghDashFile = "${config.home.homeDirectory}/.files.nix/module/tools/git/gh-dash.yml";
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    git
    gh
    gh-dash
  ];

  home.file = {
    ".config/git/template".source = ./template;
    ".config/git/ignore".source = ./ignore;
    "${skylight-include-file}".source = ./includes/skylight.inc;
  };

  xdg.configFile = {
    "gh/config.yml".source = (link ghFile);
    "gh/hosts.yml".source = ./gh-hosts.yml;
    "gh-dash/config.yml".source = (link ghDashFile);
  };

  programs.git = {
    enable = true;

    userEmail = "hi@rog.gr";
    userName = "Roger Steve Ruiz";

    aliases = {
      all = "!git add . && git ci";
      alt = "!alt() { nvim -p $(git s | awk '{ print $2 }'); }; alt";
      amend = "ci --amend";
      br = "branch";
      ch = "diff --ws-error-highlight=all --cached --";
      ci = "commit -v";
      cin = "ci --no-verify";
      co = "checkout";
      conflicts = "!con() { nvim -p $(git s | rg 'U[UAD]' | awk '{ print $2 }'); }; con";
      continue = "!git add . && git rebase --continue";
      df = "diff --ws-error-highlight=all";
      discard = "restore";
      fall = "fetch --all";
      local = "br --list";
      ls = "stash list";
      mr = "merge";
      new = "!nu() { git co -b $1; }; nu";
      out = "merge --out";
      p = "add --patch";
      pl = "pull";
      pop = "stash pop";
      ps = "push";
      s = "status -s";
      save = "stash save";
      some = "!git add $@ && git ci";
      st = "status";
      unstage = "restore --staged";
      up = "reset HEAD --patch";
      url = "config --local --get-regexp remote\\.\\.\\*\\.url";
      who = "!who() { git log --pretty='Author: %an <%ae>' | rg -i $1 | sort | uniq; }; who";
      wtb = "symbolic-ref --short -q HEAD";
      pen = "!pen() { git who $1 | sed 's/Author:/Co-Authored-By:/'; }; pen";

      catchup = "log FETCH_HEAD...HEAD --reverse --stat --pretty=format:'${(builtins.readFile ./log/long)}'";
      gist = "log --graph --pretty=format:'${(builtins.readFile ./log/short)}'";
      history = "log --reverse --stat --pretty=format:'${(builtins.readFile ./log/long)}'";
      last = "log --patch -1 --stat --pretty=format:'${(builtins.readFile ./log/long)}'";
      verbose = "log --stat --patch --pretty=format:'${(builtins.readFile ./log/long)}'";
      change-set = "!chst() { git log --reverse --pretty=format:'${(builtins.readFile ./log/change-set)}' origin/$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')..HEAD \"$@\"; }; chst";
    };

    attributes = [
      "*.pdf diff=pdf"
      "flake.lock -diff"
      "package-lock.json -diff"
      "yarn.lock -diff"
      "workspace.json -diff"
    ];

    includes = [
      {
        path = "~/${skylight-include-file}";
        condition = "gitdir:~/Developer/skylight/";
      }
    ];

    extraConfig = {
      color = {
        ui = true;
      };
      core = {
        editor = "nvim";
        quotepath = false;
        excludesFile = "~/.config/git/ignore";
        page = "more";
      };
      github = {
        user = "rogeruiz";
      };
      user = {
        signingkey = "~/.ssh/id_personal_ed25519.pub";
      };
      pull = {
        ff = "only";
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      init = {
        templatedir = "~/.config/git/template";
        defaultBranch = "main";
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        allowedSignersFile = "~/.ssh/allowed_signers";
      };
      "filter \"lfs\"" = {
        clean = "git-lfs clean %f";
        smudge = "git-lfs smudge %f";
        required = true;
      };
      commit = {
        gpgsign = true;
      };
      tag = {
        gpgsign = true;
      };
      sendemail = {
        smtpserver = "mail.gandi.net";
        smtpuser = "hi@rog.gr";
        smtpencryption = "ssl";
        smtpserverport = 465;
      };
    };
  };

}
