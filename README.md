# dotfiles

Configs for the tools I use, linked into `$HOME` by `install.sh`.

## Install

```sh
./install.sh
```

The script links `ghostty`, `nvim`, `skhd`, `tmux` and `zsh` into
`${XDG_CONFIG_HOME:-$HOME/.config}`, links the zsh startup files to `$HOME`,
and links `.clang-format` to `$HOME/.clang-format`. Existing files are moved to
`<name>.backup.<timestamp>` first.

The bootstrap repo runs this installer automatically.

## Versions

Last tested with:

| Tool                                  | Version  |
| ------------------------------------- | -------- |
| [Neovim](https://neovim.io)           | `0.12.6` |
| [Ghostty](https://ghostty.org)        | `1.4.0`  |
| [tmux](https://github.com/tmux/tmux)  | `3.8`    |

## License

Unless noted otherwise, files in this repository are licensed under the MIT
License (LICENSE). Some files are adapted from third-party sources and remain under
their original licenses, as noted in their headers:

- `ghostty/shaders/cursor_warp.glsl`: adapted from
  [sahaj-b/ghostty-cursor-shaders](https://github.com/sahaj-b/ghostty-cursor-shaders)
  (MIT, Copyright (c) 2026 Sahaj Bhatt)
