# Increment major/minor/patch version of an Athenna package.
#
# @example
# ```fish
# athennafish npm:increment common major
# athennafish npm:increment common minor 
# athennafish npm:increment common patch
# ```
function _athennafish_npm_increment
    if test $argv[1] = "all"
      echo "incrementing $argv[2] of all athenna repositories"

      athennafish increment:$argv[2] Cli
      athennafish increment:$argv[2] Common
      athennafish increment:$argv[2] Config
      athennafish increment:$argv[2] Core
      athennafish increment:$argv[2] Database
      athennafish increment:$argv[2] Docs
      athennafish increment:$argv[2] Http
      athennafish increment:$argv[2] Ioc
      athennafish increment:$argv[2] Logger
      athennafish increment:$argv[2] Mail
      athennafish increment:$argv[2] Queue
      athennafish increment:$argv[2] Template
      athennafish increment:$argv[2] Test
      athennafish increment:$argv[2] Tsconfig
      athennafish increment:$argv[2] Validator
      athennafish increment:$argv[2] View

      return
    end

    echo "incrementing $argv[2] of @athenna/$argv[1]"
    cd ~/Development/Athenna/$argv[1]

    npm --no-git-tag-version version $argv[2] 

    cd $PWD
    echo "successfully incremented $argv[2] of @athenna/$argv[1]"
end
