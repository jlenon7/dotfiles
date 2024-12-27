# Increment major/minor/patch version of an Athenna package.
#
# @example
# ```fish
# athennafish npm:increment common major
# athennafish npm:increment common minor 
# athennafish npm:increment common patch
# ```
function _athennafish_npm_increment
    if test $argv[1] = all
        echo "incrementing $argv[2] of all athenna repositories"

        athennafish npm:increment Cli $argv[2]
        athennafish npm:increment Common $argv[2]
        athennafish npm:increment Config $argv[2]
        athennafish npm:increment Core $argv[2]
        athennafish npm:increment Cron $argv[2]
        athennafish npm:increment Database $argv[2]
        athennafish npm:increment Docs $argv[2]
        athennafish npm:increment Http $argv[2]
        athennafish npm:increment Ioc $argv[2]
        athennafish npm:increment Logger $argv[2]
        athennafish npm:increment Mail $argv[2]
        athennafish npm:increment Queue $argv[2]
        athennafish npm:increment Template $argv[2]
        athennafish npm:increment Test $argv[2]
        athennafish npm:increment Tsconfig $argv[2]
        athennafish npm:increment Validator $argv[2]
        athennafish npm:increment View $argv[2]

        return
    end

    echo "incrementing $argv[2] of @athenna/$argv[1]"
    cd ~/Development/Athenna/$argv[1]

    npm --no-git-tag-version version $argv[2]

    cd $PWD
    echo "successfully incremented $argv[2] of @athenna/$argv[1]"
end
