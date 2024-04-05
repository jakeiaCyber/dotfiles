# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/zap-prompt"
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-syntax-highlighting"
plug "atoftegaard-git/zsh-omz-autocomplete"
#========bindings=====
bindkey '>' autosuggest-accept
# Load and initialise completion system
autoload -Uz compinit
compinit
#-=======export=======
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
# tmuxifier init
export PATH="$HOME/.tmuxifier/bin:$PATH"
#========alias========
alias python="python3"
alias pip="pip3"
alias n="nvim"
alias v="neovide"
alias s="neofetch"
alias cls="clear"
alias ya="yazi"
alias cat="bat"
# alias ls="colorls -a"
alias tnew="tmux new -s"
alias ta="tmux a -t"
alias tl="tmux ls"
alias td="tmux detach"
alias tka="tmux list-sessions | cut -d: -f1 | xargs -t -I {} tmux kill-session -t {}"
alias tk="tmux kill-session -t"
alias tlnvim=" tmuxifier load-session nvimconfig"
alias clock="tty-clock -s"
#======init==========
# yazi init
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# zoxide init
eval "$(zoxide init --cmd cd zsh)"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# tmuxifier init
eval "$(tmuxifier init -)"
# github copilot CLI init
eval "$(gh copilot alias -- zsh)"
