if status is-interactive
    starship init fish | source
    zoxide init fish | source
    # Commands to run in interactive sessions can go here
end

# uv
fish_add_path "/home/raphaelac/.local/bin"
# flyctl
fish_add_path $FLYCTL_INSTALL/bin
