if not status is-login
	if not set -q TMUX
    tmux has-session -t base; and tmux attach-session -t base; or tmux new-session -s base; and kill %self
	end
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

# opam configuration
source /home/josee/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
direnv hook fish | source



source $HOME/.config/fish/aliases.fish

set -gx EDITOR "nvim"

starship init fish | source
