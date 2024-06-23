# Run some script of an Athenna package. If it fails,
# the entire fish script tree will stop running.
#
# @example
# ```fish
# athennafish run common "install test:coverage"
# ```
function _athennafish_npm_run 
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
