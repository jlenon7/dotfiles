# Uninstall a library in some Athenna package.
#
# @example
# ```fish
# athennafish npm:uninstall tsconfig "typescript eslint"
# ```
function _athennafish_npm_uninstall
    cd ~/Development/Athenna/$argv[1]

    for pkg in (string split " " $argv[2])
        if not npm --silent uninstall $pkg
            cd $PWD
            echo "failed to uninstall $pkg in @athenna/$argv[1]"
        end
    end

    cd $PWD
    echo "successfully uninstalled library $pkg in @athenna/$argv[1]"
end
