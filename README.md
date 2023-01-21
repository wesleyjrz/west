# [we]st - Wesley's simple terminal

My build of the simple terminal (the best terminal emulator).

This is a very complete build of the simple terminal, with a lot of useful
patches.

![emojis-and-ligatures](https://github.com/wesleyjrz/west/assets/60184588/e8a43440-07db-4699-9001-7f2a4f5d6c00)

![neovim-ligatures](https://github.com/wesleyjrz/west/assets/60184588/9f256497-2feb-4791-b9f0-14bb0616dcc2)

## Dependencies

- `harfbuzz` (font ligatures)

### Fonts

- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
- [NotoColorEmoji](https://github.com/googlefonts/noto-emoji)

## Try it out with Nix Flakes

```
$ nix run github:wesleyjrz/west
```

### Or build the package with nix-build

```
$ nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
```

NOTE: You may use the `nix-build` script as well.

## Install

```
$ git clone https://github.com/wesleyjrz/west.git
$ cd west
$ sudo make install
```
NOTE: Don't forget to [merge your Xresources](https://wiki.archlinux.org/title/X_resources).

### Using Nix Flakes

Add `st.url = "github:wesleyjrz/west";` to your inputs and install
`inputs.st.packages."${system}".west`

## Keybindings

- **scrollback** with `alt-↑/↓`, `alt-pageup/down` or with the mouse scroll.
  * Or use Vim keys like a Giga Chad: `alt-k/j` to scroll up/down and `alt-u/d`
    to scroll faster.
- **zoom** holding `shift` and using `alt-k` to zoom in and `alt-j` to zoom
  out. Reset zoom with `alt-shift-g`.
- **copy text** with `alt-c` and **paste** with `alt-v` or
  `shift-insert`. Default `ctrl-shift-c/v` keys are also supported.
- **open another terminal** with `alt-shift-return`.

You can see all the available shortcuts with `man st`.

## lukesmithxyz unique features (using dmenu)

- **follow urls** by pressing `alt-l`
- **copy urls** in the same way with `alt-y`
- **copy the output of commands** with `alt-o`

## Patches

- alpha
- anygeometry
- boxdraw
- clipboard
- font2
- ligatures
- live reload
- newterm
- patch_column (doesn't cut text while resizing)
- right click paste
- scrollback
- selectioncolors
- st desktop entry
- sync patch
- xresources

## Xresources

You may configure you terminal with custom theme, fonts, selection colours or
any other available options by editing your Xresources file. More information
about Xresources [here](https://wiki.archlinux.org/title/X_resources).

There's an example Xresources file available.

### live-reload

To merge your Xresources and reload st to see your changes on-the-fly, alias
this command on your shell:

```
xrdb merge <xresources> && kill -USR1 $(pidof st)
```

## NOTES

- `boxdraw_braille` is disabled by default, you may want to change it in
  `config.def.h`

## TODO

- [ ] Add support for `--title=` and `--class=` arguments (because I like to test
      various terminal emulator and the majority of them uses these options to
      set title and class)

## Credits

- [lukesmithxyz](https://github.com/LukeSmithxyz/st) -- for convincing me to use `st` and for the cool features with dmenu
- [siduck](https://github.com/siduck/st) -- for the awesome build I've used as a base
- [nimaipatel](https://github.com/nimaipatel) -- for the [patch_column](https://github.com/nimaipatel/st/blob/all/patches/7672445bab01cb4e861651dc540566ac22e25812.diff) patch

## License

MIT
