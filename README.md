Neovim Plugin for the Papyrus scripting language
=============================================

A file type plugin for Neovim that includes syntax highlighting
for the Papyrus scripting language used in TES5: Skyrim.

There is also quickfix mode support to run the Papyrus compiler
and parse its error messages.

For information on the Papyrus language, visit the Creation Kit website at
http://www.creationkit.com/

Installation
------------

Install with [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'mkusm/nvim-papyrus'
```

Or with [lazy.nvim](https://github.com/folke/lazy.nvim):

Add this to your `init.lua or plugins.lua`:

```lua
{
    "mkusm/nvim-papyrus",
    config = function()
        vim.g.skyrim_install_path = 'D:\\SteamLibrary\\steamapps\\common\\Skyrim Special Edition'
    end
}
```
To enable quickfix compiler support, you must set the `skyrim_install_path`
variable to the path in which Skyrim is installed, eg (in your `.lua` config):

```lua
    vim.g.skyrim_install_path = 'D:\\SteamLibrary\\steamapps\\common\\Skyrim Special Edition'
```

If the variable is set, this will configure the `:make` command to compile the
script in the current buffer using default compiler flags. Any output
(including error messages) will be sent to the quickfix list viewable via
`:copen`.

*Note* Use backslashes in the path, even if using WSL. nvim-papyrus will convert them
to forward slashes as needed.

You can also set the `makeprg` option manually, the error message support will
still be available.


License
-------

All parts of this plugin are under the public domain. I request that you drop
me a note if you redistribute this with modifications, but you are under no
legal obligation to do so.


Authors
-----------------

Sirtaj Singh Kang

Infernio

mkusm
