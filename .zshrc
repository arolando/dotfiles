[[ -f ~/dotfiles/.zsh/aliases.zsh ]] && source ~/dotfiles/.zsh/aliases.zsh
[[ -f ~/dotfiles/.zsh/functions.zsh ]] && source ~/dotfiles/.zsh/functions.zsh
[[ -f ~/dotfiles/.zsh/starship.zsh ]] && source ~/dotfiles/.zsh/starship.zsh
[[ -f ~/dotfiles/.zsh/nvm.zsh ]] && source ~/dotfiles/.zsh/nvm.zsh
[[ -f ~/dotfiles/.zsh/wsl2fix.zsh ]] && source ~/dotfiles/.zsh/wsl2fix.zsh
[[ -f ~/dotfiles/.zsh/goto.zsh ]] && source ~/dotfiles/.zsh/goto.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Direnv
eval "$(direnv hook zsh)"

# Load Starship
eval "$(starship init zsh)"

