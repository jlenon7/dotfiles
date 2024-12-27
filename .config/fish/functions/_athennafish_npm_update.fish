# Update minor/patch version of a library.
#
# @example
# ```fish
# athennafish npm:update common @athenna/tsconfig
# ```
function _athennafish_npm_update
    if test $argv[1] = "all"
      if not set -q argv[2]
        echo "updating all libraries in all athenna repositories" 
      else
        echo "updating $argv[2] libraries in all athenna repositories" 
      end

      athennafish npm:update Cli $argv[2]
      athennafish npm:update Common $argv[2]
      athennafish npm:update Config $argv[2]
      athennafish npm:update Core $argv[2]
      athennafish npm:update Cron $argv[2]
      athennafish npm:update Database $argv[2]
      athennafish npm:update Docs $argv[2]
      athennafish npm:update Http $argv[2]
      athennafish npm:update Ioc $argv[2]
      athennafish npm:update Logger $argv[2]
      athennafish npm:update Mail $argv[2]
      athennafish npm:update Queue $argv[2]
      athennafish npm:update Template $argv[2]
      athennafish npm:update Test $argv[2]
      athennafish npm:update Tsconfig $argv[2]
      athennafish npm:update Validator $argv[2]
      athennafish npm:update View $argv[2]

      return
    end

    echo "updating $argv[2] libraries in @athenna/$argv[1]"
    cd ~/Development/Athenna/$argv[1]

    if not set -q argv[2] 
      echo "listing libraries to update of @athenna/$argv[1]"
      npm outdated
      npm --silent update --save 

      cd $PWD
      echo "successfully updated libraries in @athenna/$argv[1]"
    else
      echo "updating $argv[2] library of @athenna/$argv[1]"

      if not npm --silent update $argv[2] --save
          cd $PWD
          echo "failed to update $argv[2] in @athenna/$argv[1]"
      end

      cd $PWD
      echo "successfully updated library $argv[2] in @athenna/$argv[1]" 
    end
end
