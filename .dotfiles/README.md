# My .dotfiles meow

## Tracked files:
- `.zshrc`
- `.tmux.conf`
- `.config/flatpak-packages.txt`

## Tracked dirs:

> Listed as commands because I need to repeat them each time I do updates. Maybe there is a better way to do this but I am not overengineering things now.

- `dot add ~/.local/share/konsole/`
- `dot add ~/.local/mybinz/`
- `dot add ~/.config/nvim/`
- `dot add ~/.config/autokey/`

## Flatpak

- track: `flatpak list --app --columns=application > ~/.config/flatpak-packages.txt`
    - remember to run this from time to time
- restore: `xargs flatpak install -y flathub < ~/.config/flatpak-packages.txt`
