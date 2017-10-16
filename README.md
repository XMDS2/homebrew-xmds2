# XMDS2

This repository lets you install XMDS2 on MacOS using homebrew.

## Installation

Get [brew](https://brew.sh/).

Run in a terminal:

`brew install xmds2/xmds2/xmds2`

Why so many xmds2s?
This tells brew to find xmds2.rb at github.com/xmds2/homebrew-xmds2.
Eventually, the command will be replaced with `brew install xmds2` when it's submitted to the main package list.

## Updating XMDS2 version

Edit `HomebrewFormula/xmds2.rb` and replace the `tar.gz` file with the newest version. Update the SHA256 as well. To do this:

```shell
curl -O https://.../xmds-*.tar.gz
openssl sha256 xmds-*.tar.gz
```

Make sure that all of the dependencies are correct, and update the Pypi links to the latest versions. (These should all point to `tar.gz` files). Run ` brew install --verbose --debug xmds` to test the new package.

Ensure the installer works on a fresh MacOS install.

Run `brew test`.

Create a pull request (here or at the official brew package list.

## Information

Project information: [xmds.org](xmds.org)

Source code: [Sourceforge](https://sourceforge.net/projects/xmds/)

