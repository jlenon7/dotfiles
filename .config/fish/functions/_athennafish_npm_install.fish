# Install a library or development library in some Athenna package.
#
# @example
# ```fish
# athennafish npm:install tsconfig "@athenna/common@6.0.0 lodash@6.0.0"
# athennafish npm:install --dev tsconfig "@athenna/common@6.0.0 lodash@6.0.0"
# ```
function _athennafish_npm_install 
    for dev in --save-dev -D
        if set --local index (contains --index -- $dev $argv)
            set --erase argv[$index] && break
        end
        set --erase dev
    end

    if test $argv[1] = "all"
      if set --query dev
        echo "install in dev mode" 

        athennafish npm:install Cli $argv[2] --save-dev
        athennafish npm:install Common $argv[2] --save-dev
        athennafish npm:install Config $argv[2] --save-dev
        athennafish npm:install Core $argv[2] --save-dev
        athennafish npm:install Cron $argv[2] --save-dev
        athennafish npm:install Database $argv[2] --save-dev
        athennafish npm:install Docs $argv[2] --save-dev
        athennafish npm:install Http $argv[2] --save-dev
        athennafish npm:install Ioc $argv[2] --save-dev
        athennafish npm:install Logger $argv[2] --save-dev
        athennafish npm:install Mail $argv[2] --save-dev
        athennafish npm:install Queue $argv[2] --save-dev
        athennafish npm:install Template $argv[2] --save-dev
        athennafish npm:install Test $argv[2] --save-dev
        athennafish npm:install Tsconfig $argv[2] --save-dev
        athennafish npm:install Validator $argv[2] --save-dev
        athennafish npm:install View $argv[2] --save-dev

        return
      end

      athennafish npm:install Cli $argv[2]
      athennafish npm:install Common $argv[2]
      athennafish npm:install Config $argv[2]
      athennafish npm:install Core $argv[2]
      athennafish npm:install Cron $argv[2]
      athennafish npm:install Database $argv[2]
      athennafish npm:install Docs $argv[2]
      athennafish npm:install Http $argv[2]
      athennafish npm:install Ioc $argv[2]
      athennafish npm:install Logger $argv[2]
      athennafish npm:install Mail $argv[2]
      athennafish npm:install Queue $argv[2]
      athennafish npm:install Template $argv[2]
      athennafish npm:install Test $argv[2]
      athennafish npm:install Tsconfig $argv[2]
      athennafish npm:install Validator $argv[2]
      athennafish npm:install View $argv[2]

      return
    end

    echo "installing $argv[2] libraries in @athenna/$argv[1]"
    cd ~/Development/Athenna/$argv[1]

    if set -q $argv[2]
      for pkg in (string split " " $argv[2])
        if set --query dev
          if not npm --silent install $pkg --save-dev
              cd $PWD
              echo "failed to install library $pkg in @athenna/$argv[1]"
          end
        else
          if not npm --silent install $pkg
            cd $PWD
            echo "failed to install library $pkg in @athenna/$argv[1]"
          end
        end
      end

      cd $PWD
      echo "successfully installed library $pkg in @athenna/$argv[1]"
    else
      if not npm --silent install 
        cd $PWD
        echo "failed to install dependencies in @athenna/$argv[1]"
      end

      cd $PWD
      echo "successfully installed dependencies in @athenna/$argv[1]"
    end
end
