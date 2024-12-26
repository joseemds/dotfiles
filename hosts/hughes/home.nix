{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }
    ];
    loginShellInit = ''
      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      	fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      end

      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      	fenv source /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      end
    '';
  };

  home.shellAliases = {
    g = "git";
    gst = "git status";
    gdc = "git diff --cached";
    gl = "git pull";
    gup = "git pull --rebase";
    gp = "git push";
    gd = "git diff";
    gc = "git commit -v";
    gca = "git commit -v -a";
    gcmsg = "git commit -m";
    gco = "git checkout";
    gcm = "git checkout master";
    gr = "git remote";
    grv = "git remote -v";
    grmv = "git remote rename";
    grrm = "git remote remove";
    grset = "git remote set-url";
    grup = "git remote update";
    grbi = "git rebase -i";
    grbc = "git rebase --continue";
    grba = "git rebase --abort";
    gb = "git branch";
    gba = "git branch -a";
    gcount = "git shortlog -sn";
    gcl = "git config --list";
    gcp = "git cherry-pick";
    glg = "git log --stat --max-count=10";
    glgg = "git log --graph --max-count=10";
    glgga = "git log --graph --decorate --all";
    glo = "git log --oneline";
    gss = "git status -s";
    ga = "git add";
    gm = "git merge";
    grh = "git reset HEAD";
    grhh = "git reset HEAD --hard";
    gclean = "git reset --hard; and git clean -dfx";
    gwc = "git whatchanged -p --abbrev-commit --pretty=medium";
    gg = "git gui citool";
    gga = "git gui citool --amend";
    gk = "gitk --all --branches";
    gsts = "git stash show --text";
    gsta = "git stash";
    gstp = "git stash pop";
    gstd = "git stash drop";
    grt = "cd (git rev-parse --show-toplevel; or echo '.')";
    ggpur = "git pull --rebase origin (current_branch)";
    ggpush = "git push origin (current_branch)";
    ggpnp = "git pull origin (current_branch); and git push origin (current_branch)";
    gpsup = "git push --set-upstream origin (current_branch)";
    gunwip = "git log -n 1 | grep -q -c wip; and git reset HEAD~1";
    ls = "exa";
    l = "ls -lbF";
    ll = "ls -la";
    la = "ls -lbhHigUmuSa";
    lx = "ls -lbhHigUmuSa@";
    tree = "exa --tree";
    lS = "exa -1";
  };

  home.stateVersion = "24.05";
  home.sessionPath = ["/opt/homebrew/bin" "$HOME/.cargo/bin" "$HOME/.local/bin" "/run/current-system/sw/bin"];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.file = {".local/bin".source = ../../scripts;};
  xdg.configFile = {
    nvim = {
      source = ~/dotfiles/config/nvim;
      recursive = true;
    };
  };

  programs.neovim.enable = true;

  home.packages = [
    pkgs.coreutils
    pkgs.ripgrep
    pkgs.tree
    pkgs.tokei
    pkgs.hyperfine
    pkgs.bat
    pkgs.htop
    pkgs.jq
    pkgs.lua5
    pkgs.niv
    pkgs.nodejs
    pkgs.atool
    pkgs.httpie
    pkgs.nodePackages.pnpm
    pkgs.curl
    pkgs.direnv
    pkgs.bat
    pkgs.fd
    pkgs.lsd
    pkgs.du-dust
    pkgs.stgit
    pkgs.gh
    pkgs.lazygit
    pkgs.delta
    pkgs.difftastic
    pkgs.wiki-tui
    pkgs.anki-bin
    pkgs.lazydocker
    pkgs.zathura
    pkgs.openssl
    pkgs.mtm
    pkgs.jujutsu
    pkgs.eza
    pkgs.llm
    (pkgs.nerdfonts.override {
      fonts = [
        "Mononoki"
        "Lilex"
        "Iosevka"
      ];
    })
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Jose Eduardo Monteiro";
    userEmail = "mds.josee@gmail.com";
    difftastic.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      core.excludesFile = "~/.gitignore_global";
      merge.conflictstyle = "zdiff3";
      push.autoSetupRemote = true;
      rerere.enable = true;
      diff.algorithm = "histogram";
      log.date = "iso";
      rebase.updateRefs = "true";
      merge.tool = "nvimdiff";
    };
  };

  programs.mise = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.atuin = {
    enable = false;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    escapeTime = 10;
    terminal = "screen-256color";
    sensibleOnTop = true;
    extraConfig = "	set -ag terminal-overrides \",xterm-256color:RGB\"\n";
  };

  programs.jujutsu.enable = true;
}
