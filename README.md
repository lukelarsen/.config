# My .config File
There are config files for Karabiner, nvim, and Wezterm.

## Installing Things
- Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Wezterm
```
brew install --cask wezterm
```

- Git
```
brew install git
```

- Meslo Nerd Font
```
brew install font-meslo-lg-nerd-font
```

- Neovim
```
brew install neovim
```

- Powerlevel10k
```
brew install powerlevel10k
```

- zsh Auto Suggestions
```
brew install zsh-autosuggestions
```

- zsh Syntax Hihglighting
```
brew install zsh-syntax-highlighting
```

- Eza
```
brew install eza
```

- Zoxide
```
brew install zoxide
```

- Ripgrep
```
brew install ripgrep
```

- Node
```
brew install node
```

## Using
Clone in to your home directory.

Symlink for zshrc
```
ln -s "$HOME/.config/zsh/zshrc" "$HOME/.zshrc"
```

Configure Powerlevel10k
```
p10k configure
```
Choose 'Lean' and '8 Colors'
