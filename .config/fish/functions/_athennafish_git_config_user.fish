# Configure git user for Athenna repositories.
#
# @example
# ```fish
# athennafish git:config:user common
# ```
function _athennafish_git_config_user
    if test $argv[1] = all
        echo "configuring user for all athenna repositories"

        athennafish git:clone AthennaIO
        athennafish git:config:user Cli
        athennafish git:config:user Common
        athennafish git:config:user Config
        athennafish git:config:user Core
        athennafish git:config:user Cron
        athennafish git:config:user Database
        athennafish git:config:user Docs
        athennafish git:config:user Http
        athennafish git:config:user Ioc
        athennafish git:config:user Logger
        athennafish git:config:user Mail
        athennafish git:config:user Queue
        athennafish git:config:user Template
        athennafish git:config:user Test
        athennafish git:config:user Tsconfig
        athennafish git:config:user Validator
        athennafish git:config:user View
        return
    end

    echo "configuring user in @athenna/$argv[1] repository"
    cd ~/Development/Athenna/$argv[1]

    if not gitconfig personal
        cd $PWD
        echo "failed to configure user in @athenna/$argv[1] repository"
        exit
    end

    cd $PWD
end
