<h1 align="center">
	<a href="https://github.com/fehawen/dotfiles">
		<img alt="fehawen-macos-rice-dotfiles" src="https://user-images.githubusercontent.com/36552788/52960403-0184bd00-3399-11e9-8aed-c194079dbddd.png" width="960">
	</a>
	<br>
</h1>

<h4 align="center">
<a href="https://github.com/koekeishiya/chunkwm" target="_blank">ChunkWM</a>, <a href="https://github.com/koekeishiya/skhd" target="_blank">SKHD</a>, <a href="https://github.com/neovim/neovim" target="_blank">NeoVim</a> and <a href="https://sw.kovidgoyal.net/kitty/" target="_blank">Kitty</a> with <a href="https://github.com/fehawen/dotfiles/tree/master/bash_prompt" target="_blank">fehawen</a> bash prompt.
</h4>

## About

Just getting my good ol' rice n' spice on.

## Install

Although each subfolder contains a `setup.sh` that you can run, the `makefile` provides an easier alternative.

```bash
# Setup bash prompt
make bash-setup

# Setup chunkwm and skhd configs
make chunkwm-setup

# Setup hyper terminal config
make hyper-setup

# Setup neovim config
make neovim-setup

# Setup vs-code config
make vscode-setup

# Setup all the above
make all
```

For further details, see `README.md` in subfolders, where present.
