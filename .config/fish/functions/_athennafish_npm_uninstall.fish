# Uninstall a library in some Athenna package.
#
# @example
# ```fish
# athennafish npm:uninstall tsconfig "typescript eslint"
# ```
function _athennafish_npm_uninstall
    if test $argv[1] = "all"
      echo "uninstalling $argv[2] libraries in all athenna repositories" 

      athennafish npm:uninstall Cli $argv[2]
      athennafish npm:uninstall Common $argv[2]
      athennafish npm:uninstall Config $argv[2]
      athennafish npm:uninstall Core $argv[2]
      athennafish npm:uninstall Cron $argv[2]
      athennafish npm:uninstall Database $argv[2]
      athennafish npm:uninstall Docs $argv[2]
      athennafish npm:uninstall Http $argv[2]
      athennafish npm:uninstall Ioc $argv[2]
      athennafish npm:uninstall Logger $argv[2]
      athennafish npm:uninstall Mail $argv[2]
      athennafish npm:uninstall Queue $argv[2]
      athennafish npm:uninstall Template $argv[2]
      athennafish npm:uninstall Test $argv[2]
      athennafish npm:uninstall Tsconfig $argv[2]
      athennafish npm:uninstall Validator $argv[2]
      athennafish npm:uninstall View $argv[2]

      return
    end

    echo "uninstalling $argv[2] libraries in @athenna/$argv[1]"
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
