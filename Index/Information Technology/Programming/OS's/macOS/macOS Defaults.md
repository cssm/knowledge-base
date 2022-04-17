- [macOS defaults](https://macos-defaults.com/#🙋-what-s-a-defaults-command)
- [Change macOS user preferences via command line | pawelgrzybek.com](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/)
- [My default config](https://github.com/japanese-goblinn/.dotfiles/blob/main/config/macos/defaults.sh)
- [OSX for Hackers: Yosemite/El Capitan Edition. This script tries not to be *too* opinionated and any major changes to your system require a prompt. You've been warned.](https://gist.github.com/brandonb927/3195465)

```bash
defaults delete com.apple.dock; killall Dock
```

```bash
defaults write com.apple.dock autohide-delay -float 0; killall Dock
```

```bash
sips -s format png input.icns --out output.png
```
