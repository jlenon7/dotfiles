if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
    alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
    alias localip "ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'"
end

# Inkdrop
set -gx INKDROP_HOME ~/.inkdrop

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0
