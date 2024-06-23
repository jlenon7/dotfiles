# Pull a repository from Athenna by it name.
#
# @example
# ```fish
# athennafish git:pull common
# ```
function _athennafish_git_pull 
    echo "pulling @athenna/$argv[1] repository"

    cd ~/Development/Athenna/$argv[1]
    git fetch --all --quiet
    if not git pull --quiet origin develop
        cd $PWD
        echo "failed to pull @athenna/$argv[1] repository"
    end

    cd $PWD
    echo "successfully pulled @athenna/$argv[1] repository"
end
