# Increment major/minor/patch version of an Athenna package.
#
# @example
# ```fish
# athennafish npm:increment common major
# athennafish npm:increment common minor 
# athennafish npm:increment common patch
# ```
function _athennafish_npm_increment
    echo "incrementing $argv[2] of @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    npm --no-git-tag-version version $argv[2] 

    cd $PWD
    echo "successfully incremented $argv[2] of @athenna/$argv[1]"
end
