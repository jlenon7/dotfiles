# Clone a repository from Athenna by it name.
#
# @example
# ```fish
# athennafish git:clone common
# ```
function _athennafish_git_clone
    if test $argv[1] = all
        echo "clonning all athenna repositories"

        athennafish git:clone AthennaIO
        athennafish git:clone Cli
        athennafish git:clone Common
        athennafish git:clone Config
        athennafish git:clone Core
        athennafish git:clone Cron
        athennafish git:clone Database
        athennafish git:clone Docs
        athennafish git:clone Http
        athennafish git:clone Ioc
        athennafish git:clone Logger
        athennafish git:clone Mail
        athennafish git:clone Queue
        athennafish git:clone Template
        athennafish git:clone Test
        athennafish git:clone Tsconfig
        athennafish git:clone Validator
        athennafish git:clone View
        return
    end

    echo "clonning @athenna/$argv[1] repository"
    cd ~/Development/Athenna

    if not git clone --quiet git@github.com:AthennaIO/$argv[1].git
        cd $PWD
        echo "failed to clone @athenna/$argv[1] repository"
        exit
    end

    cd $PWD
    echo "successfully clonned @athenna/$argv[1] repository"
end
