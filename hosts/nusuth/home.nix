{ config, pkgs, ... }:

{
	programs.home-manager.enable = true;
  home.username = "josee";
  home.homeDirectory = "/home/josee";

  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
		ripgrep
		fd
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
		glow
		zathura
		du-dust
		duf
		difftastic
		delta
		wiki-tui
		gopls
		anki-bin
		process-compose
		yt-dlp
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
			 la="ls -lbhHigUmuSa"; 
			 lx="ls -lbhHigUmuSa@";
			 tree="eza --tree";
			 lS="eza -1"; 
			};

	home.sessionPath = ["$HOME/.local/bin"];

	programs.fish = {
		enable = true;
		plugins = with pkgs.fishPlugins; [{name="tide"; src = tide.src; }];
		shellInit = ''
			set -U fish_features all
		'';
	};

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
  home.sessionVariables = {
    EDITOR = "nvim";
  };

	programs.mise = {
		enable = true;
		enableBashIntegration = true;
		enableFishIntegration = true;
	};

	programs.atuin = {
		enable = false;
		enableFishIntegration= true;
		enableBashIntegration = true;
	};

	programs.tmux = {
		enable = true;
		shell = "${pkgs.fish}/bin/fish";
		escapeTime = 10;
		terminal = "screen-256color";
		sensibleOnTop = true;
		extraConfig = ''
			set -ag terminal-overrides ",xterm-256color:RGB"
		'';
	};

	programs.ssh = {
		enable = true;
	};


	services.ssh-agent = {
		enable = true;
		keys = [
			"~/.ssh/id_ed25519"

		];
	}

	programs.go = {
		enable = true;
	};
}
