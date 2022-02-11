fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path /opt/homebrew/opt/java/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path /opt/homebrew/opt/neovim/bin/
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path /usr/local/bin/
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.cargo/target/release
fish_add_path $HOME/.bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/QEMU/qemu/build

set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx CARGO_TARGET_DIR $HOME/.cargo/target
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/curl/lib/pkgconfig"
set -gx GRAVEYARD $HOME/.Trash
set -gx BARTIB_FILE $HOME/tracking.bartib
set -gx JDTLS_HOME $HOME/.local/opt/jdtls-launcher/jdtls

if status --is-interactive
    abbr --add --global ls 'exa'
    abbr --add --global lst 'exa -T'
    abbr --add --global bat 'bat -p'
    abbr --add --global npm 'pnpm'
    abbr --add --global gst 'git status'
    abbr --add --global gad 'git add'
    abbr --add --global gcm 'git commit'
    abbr --add --global glg 'git log --oneline'
    abbr --add --global magnetfinder 'magnetfinder --proxy socks5://localhost:9050 --all --sort seeds --query'

    zoxide init fish | source
    starship init fish | source
    _kn init --shell fish | source
	direnv hook fish | source
end
