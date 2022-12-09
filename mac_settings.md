# Mac environment settings
## Install Homebrew
- Run the following cli:
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install iTerm2
- There are several ways to install iTerm2, we try to install via Homebrew for a further management of the applications on our mac.
- Install with homebrew cask:
```
$ brew cask install iterm2
```

## Install Oh-My-Zsh
- Run:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Styling iTerm2 with agnoster, solorized-dark theme
### Setting up zsh
- Edit `~/.zshrc`.
- Change the variable `ZSH_THEME` to `ZSH_THEME="agnoster"`.
- Relaunch your iTerm, and you will see a new style of zsh with some fonts not well-displayed.

### Installing missing fonts
- To use the agnoster theme, we need to install powerline font:

```
$ git clone https://github.com/powerline/fonts.git --depth=1
$ cd fonts
$ ./install.sh
$ cd ..
$ rm -rf fonts
```
### Add a profile for iTerm2
- `iTerm2` > `Preferences...` > `Profiles` > `+` > Naming your profile.
- Swtich to color panel and choose `color presets` > `import` solorized-dark theme from where you download to.
- Switch to text panel and set the font to menslo for powerline
- You will see your iTerm2 perfectly works.
