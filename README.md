# Dotfiles bootstrap

This repository is managed with [chezmoi](https://www.chezmoi.io/) and is set up to rebuild a fresh macOS machine with:

- `~/.zshrc`, WezTerm, and Starship config
- a tracked `~/.Brewfile`
- one-time bootstrap scripts for Homebrew, Oh My Zsh, and Zsh plugins

## Restore a fresh Mac

If you have cloned the repo locally:

```sh
./bootstrap.sh
```

If you want to bootstrap directly from GitHub without cloning first:

```sh
curl -fsSL https://raw.githubusercontent.com/robinofski-dev/dotfiles/main/bootstrap.sh | sh
```

The script installs Xcode Command Line Tools if needed, installs Homebrew, installs `chezmoi`, and then runs `chezmoi init --apply`.

## Keep the package list up to date

The tracked `dot_Brewfile` is intentionally curated. It should contain the tools and apps you actually want restored after a reset, not every package that happens to be installed today.

If you want to review your full current Homebrew inventory, dump it to a temporary file from this repo root:

```sh
brew bundle dump --describe --force --file /tmp/Brewfile
```

Then copy over only the entries that are worth keeping long-term in `dot_Brewfile`.
