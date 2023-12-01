# zipclip
A command line utility for bundling a directory into your clipboard. Paste paste paste.

# Installation

One way:

- download zipclip.sh as `~/.zipclip.sh`
- run `chmod +x ~/.zipclip.sh`
- add `alias zc="$HOME/.zipclip.sh"` to your `.bashrc`

# Usage

`zc` followed by the directory path you want to zip and copy to the clipboard. If no directory is specified, the current directory will be used.

By default, the created & copied zip file is deleted.

- To zip and copy the current directory: zc
- To zip and copy a specific directory: zc /path/to/directory
- `-k` keep the zip file after copying to the clipboard. `zc -k /path/to/directory`
