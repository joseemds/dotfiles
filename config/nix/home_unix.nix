{ config, pkgs, ... }:

{
  home.username = "josee";
  home.homeDirectory = "/home/josee";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
		coreutils
		neovim
		tree
		tokei
		hyperfine

		fd
		ripgrep
		eza
		fzf
		bat
		htop
		ffmpeg
		pandoc
		pv
		rsync
		rclone
		tokei
		watchexec
		hyperfine
		mc
		irssi
		inxi
		atuin
		glow
		fish
		asdf-vm
		yt-dlp
		direnv
		ast-grep
		zathura
		texlive
		tmux
		youtube-dl
		du-dust
		stgit
		delta
		difftastic
		wiki-tui
		anki-bin
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

		home.shellAliases = {
			 g="git";
			 gst="git status";
			 gdc="git diff --cached";
			 gl="git pull";
			 gup="git pull --rebase";
			 gp="git push";
			 gd="git diff";
			 gc="git commit -v";
			 gca="git commit -v -a";
			 gcmsg="git commit -m";
			 gco="git checkout";
			 gcm="git checkout master";
			 gr="git remote";
			 grv="git remote -v";
			 grmv="git remote rename";
			 grrm="git remote remove";
			 grset="git remote set-url";
			 grup="git remote update";
			 grbi="git rebase -i";
			 grbc="git rebase --continue";
			 grba="git rebase --abort";
			 gb="git branch";
			 gba="git branch -a";
			 gcount="git shortlog -sn";
			 gcl="git config --list";
			 gcp="git cherry-pick";
			 glg="git log --stat --max-count=10";
			 glgg="git log --graph --max-count=10";
			 glgga="git log --graph --decorate --all";
			 glo="git log --oneline";
			 gss="git status -s";
			 ga="git add";
			 gm="git merge";
			 grh="git reset HEAD";
			 grhh="git reset HEAD --hard";
			 gclean="git reset --hard; and git clean -dfx";
			 gwc="git whatchanged -p --abbrev-commit --pretty=medium";
			 gg="git gui citool";
			 gga="git gui citool --amend";
			 gk="gitk --all --branches";
			 gsts="git stash show --text";
			 gsta="git stash";
			 gstp="git stash pop";
			 gstd="git stash drop";
			 grt="cd (git rev-parse --show-toplevel; or echo '.')";
			 ggpur="git pull --rebase origin (current_branch)";
			 ggpush="git push origin (current_branch)";
			 ggpnp="git pull origin (current_branch); and git push origin (current_branch)";
			 gpsup="git push --set-upstream origin (current_branch)";
			 gunwip="git log -n 1 | grep -q -c wip; and git reset HEAD~1";
			 ls="eza";
			 l="ls -lbF";
			 ll="ls -la";
			 llm="ll --sort=modified";
			 la="ls -lbhHigUmuSa"; 
			 lx="ls -lbhHigUmuSa@";
			 tree="eza --tree";
			 lS="eza -1"; 
			};
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/josee/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };
	
	home.sessionPath = ["$HOME/.cargo/bin" "$HOME/.local/bin"];

	programs.git = {
		enable = true;
		userName = "Jose Eduardo Monteiro";
		userEmail = "mds.josee@gmail.com";
		difftastic.enable = true;
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

	programs.fish = {
		enable = true;
		plugins = with pkgs.fishPlugins; [{name="tide"; src = tide.src; }];
		interactiveShellInit = ''
		. "$HOME/.nix-profile/share/asdf-vm/asdf.sh"
		source "$HOME/.nix-profile/share/asdf-vm/asdf.fish"

		'';
	};

	programs.tmux = {
		enable = true;
		terminal = "tmux-256color";
		plugins = with pkgs.tmuxPLugins [
			vim-tmux-navigator
			urlview
			yank
			sensible
		];
	};

	programs.home-manager.enable = true;
}
