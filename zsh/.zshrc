bindkey -e

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh


function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}


export MANPAGER="bat -plman"
export EDITOR=nvim

alias l='eza  --icons --group-directories-first -F'
alias ll='eza --icons --group-directories-first --git -lhF'
alias la='eza --icons --group-directories-first --git -lahF'
alias lt='eza --icons -F --tree --level=2'

COPYTOOL="pbcopy"

# fzf file search (CTRL-T)
export FZF_CTRL_T_OPTS="
    --walker file,dir
    --walker-skip .git,node_modules,target
    --preview 'if [ -d {} ]; then eza --icons -F --tree --level=2 --color=always {}; else bat --color=always --style=numbers --line-range=:500 {}; fi'
    --bind \"ctrl-y:execute-silent(echo -n {} | "$COPYTOOL")+abort\"
    --bind 'ctrl-/:change-preview-window(hidden|)'
    --header 'CTRL-Y: Copy Path | CTRL-/: Toggle Preview'"

# fzf command history (CTRL-R)
export FZF_CTRL_R_OPTS="
    --preview=""
    --bind \"ctrl-y:execute-silent(echo -n {} | "$COPYTOOL")+abort\"
    --header 'CTRL-Y: Copy Command'"

# fzf cd (ALT-C)
export FZF_ALT_C_OPTS="
    --walker-skip .git,node_modules,target
    --preview 'eza --icons -F --tree --level=2 --color=always {}'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | "$COPYTOOL")+abort'
    --bind 'ctrl-/:change-preview-window(hidden|)'
    --header 'CTRL-Y: Copy Path | CTRL-/: Toggle Preview'"

# zi options
export _ZO_FZF_OPTS="
    --no-sort
    --height 40%
    --layout=reverse
    --preview 'eza --icons -F --tree --level=2 --color=always {2..}'
    --bind 'ctrl-/:change-preview-window(hidden|)'"

source $HOME/.bash_aliases
alias update="brew update && brew upgrade"
alias nvba="nvim ~/.bash_aliases && exec zsh"
alias nvrc="nvim ~/.zshrc && exec zsh"


autoload -U +X bashcompinit && bashcompinit
[[ -x /opt/homebrew/bin/terraform ]] && complete -o nospace -C /opt/homebrew/bin/terraform terraform

export GPG_TTY=$(tty)


# Added by Antigravity
export PATH="~/.antigravity/antigravity/bin:$PATH"

export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# eval "$(fzf --zsh)" # disabled as zim already does this
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
