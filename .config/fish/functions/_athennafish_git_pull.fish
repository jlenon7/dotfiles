# Pull a repository from Athenna by it name.
#
# @example
# ```fish
# athennafish git:pull common
# ```
function _athennafish_git_pull
    if test $argv[1] = all
        echo "pulling all athenna repositories"

        athennafish git:pull Cli
        athennafish git:pull Common
        athennafish git:pull Config
        athennafish git:pull Core
        athennafish git:pull Cron
        athennafish git:pull Database
        athennafish git:pull Docs
        athennafish git:pull Http
        athennafish git:pull Ioc
        athennafish git:pull Logger
        athennafish git:pull Mail
        athennafish git:pull Queue
        athennafish git:pull Template
        athennafish git:pull Test
        athennafish git:pull Tsconfig
        athennafish git:pull Validator
        athennafish git:pull View

        return
    end

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
