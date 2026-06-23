| Shortcut | Action           |
| -------- | ---------------- |
| ⌘ ↑ / ↓ | Ctrl Home / End  |
| ⌘ ← / → | Home / End       |
| ⌥ ← / → | Advance one word |
| Fn Del  | Delete           |
| ⌘ R     | Refresh          |
| ⌘ L     | Browser bar      |
| ⌘ ⌥  V  | Move file here   |



# Raycast Settings (can be exported)
- Hyper key (Caps Lock)
- Hyper-Left for Split Left
- Hyper-Right for Split Right
- Hyper-Up for Maximise
- Hyper-Down for Reasonable Size
- Hyper-O for Obsidian
- Hyper-T for Ghostty
- Hyper-V for VSCode
- Hyper-S for Slack
- Hyper-F for Firefox
- Hyper-C for Chrome
- Hyper-W for Switch Windows

# Alt-Tab settings
- Use Shift-Tab for previous app
- Use ⌘ + Tab to switch between apps
- Show on screen with cursor


# Mac Settings
- Disable Spotlight shortcut (⌘ Space) in System Preferences > Keyboard > Keyboard Shortcuts > Spotlight
- Disable Alt Tab shortcut (⌘ Tab) in System Preferences > Keyboard > Keyboard Shortcuts > Keyboard
- Enable Trackpad > Tap to Click
- Increase trackpad tracking speed
- Reduce click strength


# Disable press and hold enabled for Vim (if required)

`defaults domains | tr ',' '\n' | grep "com.jetbrains" | xargs -I {} defaults write {} ApplePressAndHoldEnabled -bool false`

`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`
`defaults write com.google.antigravity ApplePressAndHoldEnabled -bool false`


# VSC back and forward with mouse (if required)
LogiOptions set M4 and M5 to Ctrl - and Ctrl Shift - 
Set M4 to Navigate apsps


# Firefox
Under `about:config`, 
set `usewheel.with_meta.action` to 3
to enable Ctrl Scroll with mouse


# install using `brew bundle install`

```
# --- Core CLI Tools & Yazi Deps ---
brew "fzf"
brew "uv"
brew "bat"
brew "zoxide"
brew "yazi"
brew "tmux"
brew "neovim"
brew "tokei"
brew "tldr"
brew "fnm"
brew "stow"
brew "eza"
brew "lazygit"
brew "gdu"
brew "difftastic"
brew "ripgrep"
brew "fd"
brew "ffmpeg"
brew "sevenzip"
brew "jq"
brew "poppler"
brew "resvg"
brew "imagemagick"
brew "zim"
brew "starship"
# brew "awscli"
# brew "lazydocker"


# --- Desktop Customisation ---
cask "alt-tab"
cask "raycast"
cask "stats"
cask "logitech-options" # legacy version
# cask "scroll-reverser"
# cask "karabiner-elements"

# --- Desktop Apps ---
cask "firefox"
cask "google-chrome"
cask "obsidian"
cask "ghostty"
# cask "skim"
# cask "flowvision"
# cask "libreoffice"

# --- IDE ---
cask "visual-studio-code"
# cask "webstorm"
# cask "pycharm"
# cask "antigravity"

# --- Fonts ---
# cask "font-symbols-only-nerd-font"
```
