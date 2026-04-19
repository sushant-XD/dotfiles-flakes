# Configuration Files Setup

This repository now automatically manages your config files through symlinks.

## What's Been Set Up

### Neovim (.config/nvim)
✅ **Your config is now in the repo and symlinked**
- Location: `.config/nvim/`
- Contents copied:
  - `init.lua`
  - `lua/` directory with all your configs
  - `lazy-lock.json`
  - `colorscheme.txt`
  - `Readme.md`

**How it works:** When you activate home-manager, the entire `~/.config/nvim` gets symlinked to `dotfiles/.config/nvim`, so your Neovim setup follows you across machines.

### Tmux (.config/tmux)
✅ **Your config is now in the repo and symlinked**
- Location: `.config/tmux/`
- Contents copied:
  - `.tmux.conf`

**How it works:** `~/.tmux.conf` is symlinked to `dotfiles/.config/tmux/.tmux.conf`

### Alacritty (.config/alacritty)
✅ **Directory created and ready**
- Location: `.config/alacritty/`
- Add your `alacritty.toml` here to manage terminal settings

### Zsh (optional)
✅ **Directory created for optional zsh configs**
- Location: `.config/zsh/`
- To use custom zsh config:
  1. Add `.zshrc` or other files to `.config/zsh/`
  2. Uncomment the zsh symlinking in `nix/modules/zsh.nix`

## How to Use

### 1. Make changes to your configs
Edit the config files directly in the dotfiles repo:
```bash
vim ~/.config/nvim/init.lua
vim .config/tmux/.tmux.conf
# etc.
```

Or edit in-place and commit the changes back:
```bash
# If you edit in ~/.config/nvim locally:
cp -r ~/.config/nvim/* dotfiles/.config/nvim/
git add .config/nvim/
git commit -m "Update nvim config"
```

### 2. Activate the configuration
After making changes, regenerate your home-manager config:

**Linux (Fedora):**
```bash
home-manager switch --flake .#fedora
```

**macOS (Work):**
```bash
home-manager switch --flake .#work-mac
```

### 3. On a new machine
When you clone this repo on a new machine:
1. Update your username in `flake.nix`
2. Run the install script:
   ```bash
   ./install.sh
   ```
3. All your configs will be automatically set up!

## File Structure

```
dotfiles/
├── .config/
│   ├── nvim/              # Neovim config (FULLY MANAGED)
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   └── lua/
│   ├── tmux/              # Tmux config (FULLY MANAGED)
│   │   └── .tmux.conf
│   ├── alacritty/         # Alacritty config (ready for you to add)
│   └── zsh/               # Zsh config (optional)
├── nix/
│   └── modules/
│       ├── nvim.nix       # ← Symlinks ~/.config/nvim
│       ├── tmux.nix       # ← Symlinks ~/.tmux.conf
│       ├── alacritty.nix  # ← Symlinks ~/.config/alacritty
│       └── zsh.nix        # ← Optional zsh config
└── flake.nix
```

## Benefits

✅ **Version control:** All your configs are in git
✅ **Cross-machine:** Same setup on Linux & macOS
✅ **Easy sync:** Just pull the latest configs
✅ **No conflicts:** Home-manager manages the symlinks
✅ **Reproducible:** New machine = instant setup

## Making Changes

### To add a new config file:
1. Place it in the appropriate `.config/` directory
2. Update the corresponding Nix module if needed
3. Run `nix run .#fedora -- switch` to activate

### To edit an existing config:
Edit the file directly in the dotfiles repo, then:
```bash
home-manager switch --flake .#fedora  # or .#work-mac
```

### To add new tools:
1. Create `nix/modules/mytool.nix` 
2. Import it in `nix/home/default.nix`
3. Optionally create `.config/mytool/` for config files
4. Add symlinking to the module (like nvim, tmux examples)
