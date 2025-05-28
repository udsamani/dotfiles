/opt/homebrew/bin/brew shellenv | source
source "$HOME/.cargo/env.fish"

if status is-interactive
    if type -q zoxide
        zoxide init fish | source
    end
end

set -x LANG en_US.UTF-8
set -x LC_ALL en_us.UTF-8
set -x SOLONET_WS ws://10.100.0.1:8081

#Aliases
alias v nvim
alias cat bat
alias lg lazygit
alias g git
alias m makers

#Add Paths
fish_add_path /usr/local/bin /opt/hombrew/bin /opt/homebrew/sbin
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.local/share/solana/install/active_release/bin"
fish_add_path /opt/podman/bin
fish_add_path "$HOME/.local/share/solana/install/active_release/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.foundry/bin"
fish_add_path "$HOME/Library/pnpm"

set -x EDITOR nvim
set -x DOCKER_HOST "unix://"(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')
set -x DOCKER_CONFIG "$HOME/.docker"
set -x PROTOC /opt/homebrew/bin/protoc
set -x PNPM_HOME "$HOME/Library/pnpm"

# Rust Setup
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

# Pure Fish Configuration
set --universal pure_shorten_prompt_current_directory_length 2
set --universal pure_enable_single_line_prompt true
