# Dotfiles - Home Manager Configuration

Simple Home Manager configuration for multiple computers with:
- **Neovim** - Modern text editor
- **Alacritty** - Terminal emulator  
- **Zsh** - Shell with oh-my-zsh
- **Git** - Version control with gh CLI
- **Tmux** - Terminal multiplexer
- **Vim** - Classic text editor
- **Rustup** - Rust toolchain manager
- **Ghostty** - Terminal emulator (Linux only by default)

## Quick Start

### Prerequisites
- [Nix](https://nixos.org/download.html) with flakes enabled
- [Home Manager](https://github.com/nix-community/home-manager)

### Installation

#### 1. Clone this repository
```bash
git clone <this-repo-url> ~/dotfiles
cd ~/dotfiles
```

#### 2. Available machine profiles

Use the profile that matches each computer:

**wingman machine:**
```nix
wingman = mkHomeConfig {
  system = "x86_64-linux";
  hostname = "wingman";
  username = "wingman";
  isWork = false;
};
```

**sushant machine:**
```nix
sushant = mkHomeConfig {
  system = "x86_64-linux";
  hostname = "sushant";
  username = "sushant";
  isWork = false;
};
```

#### 3. Update your Git configuration
Edit `nix/modules/git.nix` and set your name and email:
```nix
programs.git = {
  userName = "Your Name";
  userEmail = "your.email@example.com";
};
```

#### 4. Apply the configuration

**For wingman machine:**
```bash
home-manager switch --flake .#wingman
```

**For sushant machine:**
```bash
home-manager switch --flake .#sushant
```

## Configuration Structure

```
dotfiles/
├── flake.nix              # Main entry point with home-manager configs
├── nix/
│   ├── common.nix         # Common Nix settings (gc, experimental features)
│   ├── host-spec.nix      # Host specification options
│   ├── home/
│   │   ├── default.nix    # Main home configuration
│   │   ├── linux.nix      # Linux-specific settings
│   │   ├── darwin.nix     # macOS-specific settings
│   │   ├── work.nix       # Optional work-specific settings
│   │   └── hosts/         # Per-host overrides
│   │       ├── wingman.nix
│   │       └── sushant.nix
│   ├── modules/
│   │   ├── git.nix        # Git & gh CLI configuration
│   │   ├── zsh.nix        # Zsh shell configuration
│   │   ├── nvim.nix       # Neovim configuration
│   │   ├── alacritty.nix  # Alacritty terminal configuration
│   │   └── tmux.nix       # Tmux configuration
│   └── lib/
│       └── default.nix    # Custom library functions
└── README.md              # This file
```

## Customization

### Adding new packages
Edit `nix/home/default.nix` and add to `home.packages`:
```nix
home.packages = with pkgs; [
  # existing packages...
  neovim
  obsidian  # Add new packages here
];
```

### Adding tools to specific machines
- **Linux only**: Add to `nix/home/linux.nix`
- **macOS only**: Add to `nix/home/darwin.nix`  
- **Work machine only**: Add to `nix/home/work.nix`

Example - adding Obsidian to macOS:
```nix
# nix/home/darwin.nix
{
  home.packages = with pkgs; [
    obsidian
  ];
}
```

### Customizing tool configurations
Each tool has its own module in `nix/modules/`:
- `git.nix` - Git aliases and settings
- `zsh.nix` - Zsh shell configuration
- `nvim.nix` - Neovim keybindings and settings
- `alacritty.nix` - Terminal appearance and behavior
- `tmux.nix` - Tmux keybindings and settings

Edit these files directly to customize tool behavior.

## Updating packages

To update to the latest packages:
```bash
nix flake update
home-manager switch --flake .#wingman  # or .#sushant
```

## Rebuilding after changes

After modifying any configuration files:
```bash
home-manager switch --flake .#wingman  # or .#sushant
```

## Switching between machines

If you want to maintain separate machines:

**On wingman machine:**
```bash
home-manager switch --flake .#wingman
```

**On sushant machine:**
```bash
home-manager switch --flake .#sushant
```

## Troubleshooting

### "command not found: nix" on macOS
After installing Nix on macOS, you may need to:
```bash
. /nix/run/currentSystem/activate
```

### Git not configured after activation
Make sure to update `nix/modules/git.nix` with your name and email before running `switch`.

### Zsh not the default shell
To set Zsh as your default shell after installing with Home Manager:
```bash
chsh -s $(which zsh)
```

## Adding more modules

To add a new tool:
1. Create `nix/modules/mytool.nix`
2. Add configuration there
3. Import in `nix/home/default.nix`:
```nix
imports = [
  ../modules/git.nix
  ../modules/mytool.nix  # Add here
  # ...
];
```

## Resources

- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/unstable/)
- [NixOS Wiki](https://wiki.nixos.org/)
