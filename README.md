# Dotfiles - Home Manager Configuration

Minimal Home Manager setup for two Linux personal computers, one Linux work machine, and one macOS work machine:
- wingman
- sushant
- work-ubuntu
- work-mac

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
- For the work Mac, use:
```bash
nix run github:nix-community/home-manager/master -- switch -b backup --flake .#work-mac
```
- For work Ubuntu, use:
```bash
nix run github:nix-community/home-manager/master -- switch -b backup --flake .#work-ubuntu
```

## Profiles

- `wingman` (primary Linux machine)
- `sushant` (second Linux machine)
- `work-ubuntu` (Linux work machine, git/gh unmanaged)
- `work-mac` (macOS work machine)
- `fedora` (compat alias -> `wingman`)

## Per-machine overrides

Put machine-specific config in:
- `nix/home/hosts/wingman.nix`
- `nix/home/hosts/sushant.nix`
- `nix/home/hosts/work-ubuntu.nix` (optional)

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
