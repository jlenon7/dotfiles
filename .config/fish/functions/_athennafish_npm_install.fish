# Install a library or development library in some Athenna package.
#
# @example
# ```fish
# athennafish npm:install tsconfig "@athenna/common@6.0.0 lodash@6.0.0"
# athennafish npm:install --dev tsconfig "@athenna/common@6.0.0 lodash@6.0.0"
# ```
function _athennafish_npm_install 
    if not set -q argv[3]
      cd ~/Development/Athenna/$argv[1]

      for pkg in (string split " " $argv[2])
          if not npm --silent install $pkg --save-dev
              cd $PWD
              echo "failed to install library $pkg in @athenna/$argv[1]"
          end
      end

      cd $PWD
      echo "successfully installed library $pkg in @athenna/$argv[1]"
    else 
      cd ~/Development/Athenna/$argv[2]

      for pkg in (string split " " $argv[3])
          if not npm --silent install $pkg --save-dev
              cd $PWD
              echo "failed to install development library $pkg in @athenna/$argv[2]"
          end
      end

      cd $PWD
      echo "successfully installed development library $pkg in @athenna/$argv[2]"
    end
end
