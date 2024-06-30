function dotsetup --description "Configure dotfiles repository into machine"
    for silent in --silent -s
        if set --local index (contains --index -- $silent $argv)
            set --erase argv[$index] && break
        end
        set --erase silent
    end

    set --local cmd $argv[1]
    set --local repository (basename $PWD)

    switch "$cmd"
        case -v --version
            echo "dotsetup, version 1.0.0"
        case "" -h --help
            echo "Usage: dotsetup vscode         Configure VSCode using files from dotfiles repository"
            echo "Options:"
            echo "       -s, --silent             Suppress standard output"
            echo "       -v, --version            Print the version of dotsetup"
            echo "       -h, --help               Print this help message"
        case vscode 
            curl -s https://raw.githubusercontent.com/jlenon7/dotfiles/main/.vscode/settings.json > /dev/null > ~/Library/Application Support/Code/User/settings.json
            set extensions (curl -s https://raw.githubusercontent.com/jlenon7/dotfiles/main/.vscode/extensions.txt)
            for extension in $extensions
              code --install-extension $extension --force
            end

            echo
            echo "Successfully setup VSCode" 
        case \*
            echo "dotsetup: Unknown command or option: \"$cmd\" (see dotsetup -h for usage)" >&2
            return 1
    end
end
