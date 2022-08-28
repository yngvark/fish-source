# Fish source

Fish source ("`fs`") is like `source`. It executes the output of a command in the current Fish shell.


## Usage

Example:

We have a file `some-command` somewhere in the $PATH, and it contains this:

```fish
cd /
```

If you run this command from the directory `/tmp`

```fish
/tmp $ fs some-command
```

then your shell will now be in the root directory:

```fish
/ $
```

Just like `source`.

## Why?

TL;DR: `source` in Fish shell ignores $PATH, but `fs` does not.

Fish's [documentation](https://fishshell.com/docs/current/cmds/source.html) states

> fish will search the working directory to resolve relative paths **but will not search [`PATH`](https://fishshell.com/docs/current/language.html#envvar-PATH)**.

This is very unhandy, as being able to source the output of all commands in `$PATH` is very useful. `fs` solves this.

## Installation

### Using [fisher](https://github.com/jorgebucaran/fisher)

```sh
fisher install yngvark/fs
```

### Directly

Put [fs.fish](fisher-plugin/functions/fs.fish) into `~/.config/fish/functions`:

```shell
wget https://raw.githubusercontent.com/yngvark/fish-source/main/functions/fs.fish -O ~/.config/fish/functions/fs.fish
```

