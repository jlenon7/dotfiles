# Install a library in some Athenna package.
#
# @example
# ```fish
# install_lib tsconfig "typescript@6.0.0 eslint@6.0.0"
# ```
function install_lib
    cd ~/Development/Athenna/$argv[1]

    for pkg in (string split " " $argv[2])
        if not npm install $pkg --save
            echo "failed to install library $pkg in @athenna/$argv[1]"
        end
    end
end

# Install a development library in some Athenna package.
#
# @example
# ```fish
# install_lib_dev tsconfig "typescript@6.0.0 eslint@6.0.0"
# ```
function install_lib_dev
    cd ~/Development/Athenna/$argv[1]

    for pkg in (string split " " $argv[2])
        if not npm install $pkg --save-dev
            echo "failed to install development library $pkg in @athenna/$argv[1]"
        end
    end
end
