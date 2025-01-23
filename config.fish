function setup-key-bindings
    # vi bindings - from https://fishshell.com/docs/current/interactive.html#vi-mode-commands
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

if status is-interactive
    # Git config
    git config --global core.editor "vim"
    git config --global init.defaultBranch "main"

    # Golang
    set GOPATH "$HOME/.local/go"

    # Rust
    fish_add_path "$HOME/.cargo/bin"

    # TeX
    fish_add_path "$HOME/.local/texlive/2023/bin/x86_64-linux"

    # neovim
    fish_add_path "$HOME/.local/nvim/nvim-linux64/bin"
    set EDITOR "nvim"

    set -g fish_key_bindings setup-key-bindings
end

function conda-start
    eval /home/logan/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
