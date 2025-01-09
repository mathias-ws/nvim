# nvim

My neovim configuration. Hopefully it works:P

## Dependencies

These operative system packages are required for all the plugins and
functionality to work. Other dependencies are automatically installed by Mason.

- NPM
- ripgrep
- git

## Latex

For latex to work the following MacOS packages must be installed:

- brew install --cask skim
- brew install --cask mactex-no-gui

## Work and personal configuration

To separate concerns and to use only the needed plugins a work mode has been implemented.
This has fewer plugins and LSPs. To activate it export the `NVIM_ENV` variable to `"work"`.

```bash
export NVIM_ENV="work"
```
