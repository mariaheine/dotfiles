# My .dotfiles meow

## Tracked files:
- `.zshrc`
- `.tmux.conf`
- `.config/flatpak-packages.txt`
- `.config/ksnip/ksnip.conf`
    - app for screenshots

## Tracked dirs:

> Listed as commands because I need to repeat them each time I do updates. Maybe there is a better way to do this but I am not overengineering things now.

> 🐖 Remember to re-run those after creating some new files.

- `dot add ~/.local/share/konsole/`
- `dot add ~/.local/mybinz/`
- `dot add ~/.config/nvim/`
    - requires for roslyn net10+
        - sudo apt install -y dotnet-sdk-10.0
        - or see latest at https://learn.microsoft.com/en-us/dotnet/core/install/linux
- `dot add ~/.config/autokey/`

## Flatpak

- track: `flatpak list --app --columns=application > ~/.config/flatpak-packages.txt`
    - remember to run this from time to time
- restore: `xargs flatpak install -y flathub < ~/.config/flatpak-packages.txt`
