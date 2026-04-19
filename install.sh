#!/usr/bin/env bash
# Home Manager installation script for this dotfiles repo

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$REPO_DIR/flake.nix"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Home Manager Dotfiles Setup${NC}"
echo "=============================="
echo ""

# Check if nix is installed
if ! command -v nix &> /dev/null; then
    echo -e "${RED}Error: Nix is not installed${NC}"
    echo "Please install Nix from https://nixos.org/download.html"
    exit 1
fi

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SYSTEM="linux"
    if [[ "$USER" == "wingman" ]]; then
        CONFIG="wingman"
    elif [[ "$USER" == "sushant" ]]; then
        CONFIG="sushant"
    else
        echo -e "${RED}Unsupported Linux user: $USER${NC}"
        echo "Use one of: wingman, sushant"
        exit 1
    fi
    echo -e "${YELLOW}Detected: Linux profile '$CONFIG'${NC}"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    SYSTEM="darwin"
    CONFIG="sushant"
    echo -e "${YELLOW}Detected: macOS${NC}"
else
    echo -e "${RED}Unsupported OS: $OSTYPE${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}Before proceeding, please:${NC}"
echo "1. Update your Git name and email in nix/modules/git.nix"
echo ""

read -p "Have you updated nix/modules/git.nix with your Git config? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Please update nix/modules/git.nix first, then run this script again."
    exit 1
fi

echo ""
echo -e "${GREEN}Applying Home Manager configuration...${NC}"
home-manager switch --flake ".#$CONFIG"

echo ""
echo -e "${GREEN}✓ Setup complete!${NC}"
echo ""
echo "Your home environment has been configured with:"
echo "  • Neovim"
echo "  • Alacritty"
echo "  • Zsh with oh-my-zsh"
echo "  • Git with gh CLI"
echo "  • Tmux"
echo "  • Vim"
echo "  • Rustup"
if [[ "$SYSTEM" == "linux" ]]; then
    echo "  • Ghostty"
fi
echo ""
echo "To rebuild after making changes:"
echo "  home-manager switch --flake .#$CONFIG"
echo ""
echo "For more information, see README.md"
