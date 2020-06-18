tmux-fuc
========

Search Frequently Used Commands

# Description

This tpm plugin shows your frequently used commands (fuc) with peco style. You can quickly search fuc.

# Requirements

* [tmux](https://tmux.github.io/)
* [peco](https://github.com/peco/peco)
* [tpm](https://github.com/tmux-plugins/tpm)
* xclip or pbcopy

# Install

Install tpm and add the following line to your `~/.tmux.conf`

```bash
set-option -g @plugin 'knakayama/tmux-fuc'
```

then, press `Prefix + I` in tmux session.

# Usage

First, create your fuc repository like [this](https://github.com/knakayama/my-fuc), and clone the repository to your machine.

```bash
$ git clone path/to/fuc/repo ~/.fuc
```

Default fuc directory path is `~/.fuc`. If you wanto to change the path, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @fuc-path 'path/to/fuc/dir'
```

Default key binding is `Prefix + e`. If you change this key binding, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @fuc-key 'x' # or your favorite key binding
```

After everything is setup, the selected script-line is copied to the clipboard.
To use other  buffers/registers than clipboard, or other tool than xclip/bpcopy
set fuc-copy-command to something other than the auto-detect value of either:
```
set-option -g @fuc-copy-command 'pbcopy -'
set-option -g @fuc-copy-command 'xclip -sel clipboard -i'
```

# License

MIT

# Author

[knakayama](https://github.com/knakayama)

# Contributors

[dotmpe](https://github.com/dotmpe)
