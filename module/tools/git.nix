{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    gh
  ];

  home.file = {
    ".config/git/template".source = ../../config/git/template;
    ".config/git/ignore".source = ../../config/git/ignore;
  };

  programs.git = {
    enable = true;

    userEmail = "hi@rog.gr";
    userName = "Roger Steve Ruiz";

    aliases = {
      all = "!git add . && git ci";
      alt = "!alt() { nvim -p $(git s | awk '{ print $2 }'); }; alt";
      amend = "ci -amend";
      br = "branch";
      ch = "diff --cached --";
      ci = "commit -v";
      cin = "ci --no-verify";
      co = "checkout";
      conflicts = "!con() { nvim -p $(git s | rg 'U[UAD]' | awk '{ print $2 }'); }; con";
      continue = "!git add . && git rebase --continue";
      df = "diff";
      discard = "checkout --";
      fall = "fetch --all";
      local = "br --list";
      ls = "stash list";
      mr = "merge";
      new = "!nu() { git co -b $1; }; nu";
      out = "merge --out";
      p = "add --patch";
      pl = "pull";
      pop = "stash pop";
      ps = "ps";
      s = "status -s";
      save = "stash save";
      some = "!git add $@ && git ci";
      st = "status";
      unstage = "reset HEAD";
      up = "reset HEAD --patch";
      url = "config --local --get-regexp remote\\.\\.\\*\\.url";
      who = "!who() { git log | rg 'Author: ' | rg -i $1 | sort | uniq; }; who";
      wtb = "!wtb() { git br -l | rg '\\*' | awk '{ print $2 }'; }; wtb";

      gist = "log --graph --pretty=format:'${(builtins.readFile ../../config/git/log/short)}'";
      history = "log --reverse --stat --pretty=format:'${(builtins.readFile ../../config/git/log/long)}'";
      catcup = "log FETCH_HEAD...HEAD --reverse --stat --pretty=format:'${(builtins.readFile ../../config/git/log/long)}'";
      verbose = "log --stat --patch --pretty=format:'${(builtins.readFile ../../config/git/log/long)}'";
      last = "log --patch -1 --stat --pretty=format:'${(builtins.readFile ../../config/git/log/long)}'";
    };

    attributes = [
      "*.pdf diff=pdf"
      "flake.lock -diff"
      "package-lock.json -diff"
      "yarn.lock -diff"
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
      "commit" = {
        gpgsign = true;
      };
      tag = {
        gpgsign = true;
      };
    };
  };

}
