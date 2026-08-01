# matoi/homebrew-tap

Homebrew formulae maintained by matoi.

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
