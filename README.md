# matoi/homebrew-tap

Homebrew formulae maintained by matoi.

## view-file

Format-aware file viewer for terminals and macOS GUI sessions. Install it and
its runtime dependencies with:

```sh
brew install matoi/tap/view-file
```

## lesspipe-plus

`lesspipe` with support for preserving explicitly configured executable paths
and restricting automatically discovered parser commands with
`LESSPIPE_ALLOWED_COMMANDS`.

It conflicts with Homebrew's `lesspipe` formula because both install the same
commands. Replace the core formula as follows:

```sh
brew uninstall lesspipe
brew install matoi/tap/lesspipe-plus
```

## lv-plus

`lv` with optional features including C/Migemo search.

The formula conflicts with Homebrew's `lv` formula because both install the
`lv` and `lgrep` commands. Replace the core formula with `lv-plus` as follows:

```sh
brew uninstall lv
brew install matoi/tap/lv-plus
```

To switch back:

```sh
brew uninstall lv-plus
brew install lv
```
