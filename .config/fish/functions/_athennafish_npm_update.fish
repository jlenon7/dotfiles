# Update minor/patch version of a library.
#
# @example
# ```fish
# athennafish npm:update common @athenna/tsconfig
# ```
function _athennafish_npm_update
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
