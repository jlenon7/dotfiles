# Merge a repository from Athenna by it name.
#
# @example
# ```fish
# athennafish git:merge common
# ```
function _athennafish_git_merge
    if test $argv[1] = all
        echo "merging all athenna repositories"

        athennafish git:merge Cli
        athennafish git:merge Common
        athennafish git:merge Config
        athennafish git:merge Core
        athennafish git:merge Cron
        athennafish git:merge Database
        athennafish git:merge Docs
        athennafish git:merge Http
        athennafish git:merge Ioc
        athennafish git:merge Logger
        athennafish git:merge Mail
        athennafish git:merge Queue
        athennafish git:merge Template
        athennafish git:merge Test
        athennafish git:merge Tsconfig
        athennafish git:merge Validator
        athennafish git:merge View

        return
    end

    echo "merging @athenna/$argv[1] repository"

    cd ~/Development/Athenna/$argv[1]

    if not gh pr create --base main --head develop --title "chore(npm): update dependencies" --body "Update project dependencies" |
            grep -o 'https://github\.com/[^ ]*' | xargs -I {} gh pr merge {} --auto --merge
        cd $PWD
        echo "failed to merge @athenna/$argv[1] repository"
    end

    cd $PWD
    echo "successfully merged @athenna/$argv[1] repository"
end
