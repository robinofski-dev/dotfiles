#!/bin/sh

set -eu

REPO_URL="${CHEZMOI_REPO_URL:-https://github.com/robinofski-dev/dotfiles.git}"
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

if [ "$(uname -s)" != "Darwin" ]; then
  echo "This bootstrap flow currently targets macOS."
  exit 1
fi

if ! xcode-select -p >/dev/null 2>&1; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install || true
  echo "Finish the Command Line Tools installation, then rerun ./bootstrap.sh."
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  echo "Homebrew was not found after installation."
  exit 1
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "Installing chezmoi..."
  brew install chezmoi
fi

if [ -f "$SCRIPT_DIR/dot_zshrc" ] && [ -d "$SCRIPT_DIR/.git" ]; then
  echo "Applying local dotfiles repo with chezmoi..."
  chezmoi init --apply --source="$SCRIPT_DIR"
else
  echo "Applying dotfiles repo from $REPO_URL..."
  chezmoi init --apply "$REPO_URL"
fi
