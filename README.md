##  My dotfiles

You will need to have [Homebrew](https://brew.sh/) installed.

If you don't have homebrew installed use this command and follow the instructions:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

When homebrew is installed you can verify your installation by using this command:

```bash
brew doctor
```

Run this command to install all needed packages to enable the dotfiles:
```bash
brew install git font-jetbrains-mono-nerd-font oh-my-posh stow yazi neofetch neovim ghostty lazygit
```

In the terminal position your self to the home directory.
##### cd ~

Clone the repository to your home directory using [git](https://git-scm.com/).

```bash
git clone https://github.com/marko0905/.dotfiles
```

Position your self to the .dotfiles.
##### cd ~/.dotfiles

Use [stow](https://www.gnu.org/software/stow/) to make symlinks for all files in .dotfiles.
If its a fresh install use this stow command
```bash
stow .
```
or if you are using a seasoned configuration use this command to replace the existing configuration with the symlinks from .dotfiles
```bash
stow --adopt .
```

Now the configuration is finished. The [zsh](https://www.zsh.org/) shell is updated to my personal configuration using [Zinit](https://github.com/zdharma-continuum/zinit) as the ZSH package manager and [oh-my-posh](https://ohmyposh.dev/) as a custom prompt engine.
Also included in the dotfiles are located in .config directory:
 * my [neovim](https://neovim.io/) / cli text editor configuration
 * my [yazi](https://yazi-rs.github.io/) / cli file manager configuration
 * my oh-my-posh configuration
 * [neofetch](https://github.com/dylanaraps/neofetch) / A command-line system information tool configuration
 * [Ghostty](https://ghostty.org/) / My preferred terminal emulator configuration
 * [lazygit](https://github.com/jesseduffield/lazygit) / A simple terminal UI for git commands

#### If changes are made use git to update the repository