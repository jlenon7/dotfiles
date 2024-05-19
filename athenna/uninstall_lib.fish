# Uninstall a library in some Athenna package.
#
# @example
# ```fish
# uninstall_lib tsconfig "typescript eslint"
# ```
function uninstall_lib
    cd ~/Development/Athenna/$argv[1]

    for pkg in (string split " " $argv[2])
        if not npm uninstall $pkg
            echo "failed to uninstall $pkg in @athenna/$argv[1]"
        end
    end
end
