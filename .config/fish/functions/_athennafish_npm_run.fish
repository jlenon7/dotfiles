# Run some script of an Athenna package. If it fails,
# the entire fish script tree will stop running.
#
# @example
# ```fish
# athennafish run common "install test:coverage"
# ```
function _athennafish_npm_run 
    if test $argv[1] = "all"
      echo "running $argv[2] scripts of all athenna repositories"

      athennafish npm:run Cli $argv[2]
      athennafish npm:run Common $argv[2]
      athennafish npm:run Config $argv[2]
      athennafish npm:run Core $argv[2]
      athennafish npm:run Database $argv[2]
      athennafish npm:run Docs $argv[2]
      athennafish npm:run Http $argv[2]
      athennafish npm:run Ioc $argv[2]
      athennafish npm:run Logger $argv[2]
      athennafish npm:run Mail $argv[2]
      athennafish npm:run Queue $argv[2]
      athennafish npm:run Template $argv[2]
      athennafish npm:run Test $argv[2]
      athennafish npm:run Tsconfig $argv[2]
      athennafish npm:run Validator $argv[2]
      athennafish npm:run View $argv[2]

      return
    end

    echo "running $argv[2] scripts of @athenna/$argv[1]"
    cd ~/Development/Athenna/$argv[1]

    for script in (string split " " $argv[2])
        if not npm run $argv[2]
            cd $PWD
            echo "failed to run $script in @athenna/$argv[1]"
        end
    end

    cd $PWD
    echo "successfully ran $argv[2] scripts of @athenna/$argv[1] package"
end
