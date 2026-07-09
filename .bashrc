# ~/.bashrc - Configuração de Terminal (Tema Verde, Azul & Amarelo)

[[ $- != *i* ]] && return

__build_ps1() {
    local C_GREEN='\[\033[1;32m\]'
    local C_BLUE='\[\033[1;34m\]'
    local C_YELLOW='\[\033[1;33m\]'
    local C_RESET='\[\033[0m\]'

    local branch
    local git_info=""

    if branch=$(git branch --show-current 2>/dev/null || git rev-parse --short HEAD 2>/dev/null); then
        git_info=" ${C_YELLOW}(${branch})"
    fi
    
    PS1="${C_GREEN}\u ${C_BLUE}\w${git_info} ${C_GREEN}➜ ${CLR_RESET}${C_RESET}"
}

PROMPT_COMMAND=__build_ps1

export CLICOLOR=1
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gcl='git clone'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
elif [ -f /etc/bash_completion.d/git-prompt ]; then
    source /etc/bash_completion.d/git-prompt
fi