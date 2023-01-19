if not status is-login
	exec tmux
end

if status is-interactive
end


fish_add_path -a $HOME/.local/bin
fish_add_path -a $HOME/.cargo/bin

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/josee/.ghcup/bin $PATH # ghcup-env

# pnpm
set -gx PNPM_HOME "/home/josee/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
