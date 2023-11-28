if status is-interactive
    # Git config
    git config --global core.editor "vim"

    # Golang
    set GOPATH "$HOME/.local/go"

    # Rust
    fish_add_path "$HOME/.cargo/bin"

    # TeX
    fish_add_path "$HOME/.local/texlive/2023/bin/x86_64-linux"
end
