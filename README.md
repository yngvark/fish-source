## Update: I'm no longer using this, I'm testing out using bass instead

The behavior is a bit different from `source`, as source runs the content of a script, while `fs` runs the script, pipes the output to a file, and then runs the output. So the script being run through `fs` must use `echo export A=hello` instead  of using `export A=hello`.

Ideally, we want to use a pure `source`. We can do this instead by using the [bass](https://github.com/edc/bass) plugin. Setup:

```fish
fisher install edc/bass
alias fs="bass source"
funcsave fs
```

The alias stuff is just so we don't have to write the lengthy `bass source mycommand` when we want to source `mycommand`.

# Fish source

Fish source ("`fs`") emulates `source`. It executes the output of a command in the current Fish shell.


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

### Alternative

Install the the [bass](https://github.com/edc/bass) plugin, and use `bass source mycommand`.

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

