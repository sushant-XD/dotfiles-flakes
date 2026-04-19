# Dotfiles - Home Manager Configuration

Minimal Home Manager setup for two Linux personal computers:
- wingman
- sushant

## Quick Start

### 1. Clone
```bash
git clone <this-repo-url> ~/dotfiles
cd ~/dotfiles/dotfiles
```

### 2. Linux permission fix (if needed)
If Nix gives permission denied errors on `/nix/store` or `/nix/var/nix`, run:
```bash
sudo chown -R $(whoami) /nix
```

### 3. Apply config with nix run
Use this command format:
```bash
nix run github:nix-community/home-manager/master -- switch -b backup --flake .#fedora
```

Notes:
- `fedora` is an alias to the `wingman` profile.
- For the second machine, use:
```bash
nix run github:nix-community/home-manager/master -- switch -b backup --flake .#sushant
```

## Profiles

- `wingman` (primary Linux machine)
- `sushant` (second Linux machine)
- `fedora` (compat alias -> `wingman`)

## Per-machine overrides

Put machine-specific config in:
- `nix/home/hosts/wingman.nix`
- `nix/home/hosts/sushant.nix`

## Rebuild after changes
```bash
nix run github:nix-community/home-manager/master -- switch -b backup --flake .#fedora
```

or on second machine:
```bash
nix run github:nix-community/home-manager/master -- switch -b backup --flake .#sushant
```

## Update flake inputs
```bash
nix flake update
```

## Troubleshooting

If `home-manager` command is not in PATH, keep using `nix run ...` command above.
