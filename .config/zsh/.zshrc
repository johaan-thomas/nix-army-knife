# zshrc file

autoload -U colors && colors
PS1='%B%F{green}%n%F{blue}@%F{cyan}%M%F{blue}:%~ %(?.%F{green}.%F{red})%#%f%b '
RPROMPT='%(?..%F{red}[%?]%f)%1(j.%F{green}[%j].)%f '
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
export HISTFILE="$XDG_DATA_HOME/zsh_history"
# setopt inc_append_history
setopt share_history
setopt hist_ignore_dups       # Ignore consecutive duplicates
setopt hist_ignore_space      # Ignore commands starting with space
setopt hist_find_no_dups      # Don't show duplicates when searching
setopt long_list_jobs       # Show PID in job list

setopt interactive_comments # Allow comments in interactive shell
setopt no_beep
# setopt prompt_subst         # Enable prompt substitution

set -o emacs
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt correct
# unsetopt PROMPT_SP 2>/dev/null

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -C -d "$XDG_CACHE_HOME/zsh/zcompdump"
# _comp_options+=(globdots)

# Edit command in $EDITOR with Ctrl+X Ctrl+E
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

for i in $SHELLDOTDIR/auto/*sh; do
  [ -f $i ] && . $i
done

## keybinds
bindkey -s '^h' '^ucd ~\n'
bindkey -s '^o' '^uyz\n'
bindkey -s '^g' '^uzi\n'

## syntax highlighting
# zsh_hightlight=/opt/plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# [ -r "$zsh_hightlight" ] && source $zsh_hightlight
# zsh_suggestions=~/opt/zsh-autosuggestions/zsh-autosuggestions.zsh
# [ -r "$zsh_suggestions" ] && source $zsh_suggestions
