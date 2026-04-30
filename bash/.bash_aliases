alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias updateapp="npm update -g && mise up --bump"
alias cacheclear="pip cache purge && pnpm store prune && mise cache clear && uv cache clean"
alias ccf="codecrafters"
alias ccft="codecrafters test"
alias ccfs="codecrafters submit"
alias nvz="nvim leetcode.nvim"

# alias mountpdc="sshfs -o allow_other e0958630@soctf-pdc-009.d1.comp.nus.edu.sg:/nfs/home/e0958630/ ~/pdc"
# alias mountdebug="sshfs -odebug,sshfs_debug,loglevel=debug  e0958630@soctf-pdc-009.d1.comp.nus.edu.sg:/nfs/home/e0958630/ /home/ian/pdc"

alias nvba="nvim ~/.bash_aliases && source ~/.bashrc"
alias nvrc="nvim ~/.bashrc && source ~/.bashrc"
alias srcb="source ~/.bashrc"

alias nv="nvim"
alias nvimdiff="nvim -d"
alias lg=lazygit
alias tm=tmux

# alias lazyvim="NVIM_APPNAME=lazyvim nvim"
# alias lazy="NVIM_APPNAME=lazyvim nvim"
# alias astro="NVIM_APPNAME=astronvim nvim"

alias sumatra="SumatraPDF.exe"

# CPP Flags for learning
# alias gcca="g++ -g3 -std=c++23 -Og -Wpedantic -Wall -Wextra -Wconversion -Werror -Wshadow -Wcast-align -Woverloaded-virtual -Wsign-conversion -Wformat=2 -Wnon-virtual-dtor -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wnull-dereference -Wuseless-cast -Wdouble-promotion -Wfloat-equal -fno-omit-frame-pointer -fsanitize=address,undefined"
# alias gcct="g++ -g3 -std=c++23 -O3 -Wpedantic -Wall -Wextra -Wconversion -Werror -Wshadow -Wcast-align -Woverloaded-virtual -Wsign-conversion -Wformat=2 -Wnon-virtual-dtor -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wnull-dereference -Wuseless-cast -Wdouble-promotion -Wfloat-equal -fno-omit-frame-pointer -fsanitize=thread,undefined"

function fzfo() {
  local selection=$(fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}')
  [ "$selection" != "" ] && nvim "$selection"
}

# alias nvcc="/usr/local/cuda/bin/nvcc"

# ========================
# Git aliases
# ========================
function gc() {
  if [ $# -eq 0 ]; then
    echo "Usage: gc [-b] <branch-name>"
    echo "  -b    Create a new local branch (no tracking)"
    echo "Available local and remote branches:"
    git branch -a
    return 0
  fi

  local create_new=0

  if [ "$1" = "-b" ]; then
    create_new=1
    shift
  elif [ "$1" = "-" ]; then
    git switch -
    return $?
  fi

  if [ $# -ne 1 ]; then
    echo "Usage: gc [-b] <branch-name>"
    return 1
  fi

  local branch="$1"

  if [ "$create_new" -eq 1 ]; then
    git switch -c "$branch"
  elif git show-ref --verify --quiet "refs/heads/$branch"; then
    git switch "$branch"
  else
    git switch -c "$branch" --track "origin/$branch"
  fi
}

# Rather than editing git config
alias gcb="git checkout -b"
alias gb="git branch"
alias gf="git fetch"
alias gp="git pull"
alias gP="git push"
alias gr="git reset --soft HEAD~1"
alias gco="git commit"
alias gcoa="git commit --amend --no-edit"
alias gs="git status -sb"
alias gl="git log --oneline --graph --color --all --decorate"
alias gpa="git format-patch HEAD^ --stdout > patchfile.patch"
#  delete all local branches that have been merged into the current branch, except master and the current branch
alias gbd='git branch --merged | grep -v "\*\|main" | xargs -n 1 git branch -d'
