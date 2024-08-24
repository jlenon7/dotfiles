function athennafish --description "Internal helpers for Athenna project management"
    for silent in --silent -s
        if set --local index (contains --index -- $silent $argv)
            set --erase argv[$index] && break
        end
        set --erase silent
    end

    set --local cmd $argv[1]
    set --local sec_cmd $argv[2]

    switch "$cmd"
        case -v --version
            echo "athennafish, version 1.0.0"
        case "" -h --help
            echo "Usage: athennafish container:down database                                           Run docker-compose down of @athenna/database project"
            echo "       athennafish container:up database                                             Run docker-compose up -d of @athenna/database project"
            echo "       athennafish git:config:user common                                            Configure the user of @athenna/common project"
            echo "       athennafish git:config:user all                                               Configure the user of all projects from Athenna organization"
            echo "       athennafish git:clone common                                                  Clone the @athenna/common project"
            echo "       athennafish git:clone all                                                     Clone all projects from Athenna organization"
            echo "       athennafish git:merge common                                                  Merge develop into main of @athenna/common project"
            echo "       athennafish git:pull common                                                   Pull git changes of @athenna/common project"
            echo "       athennafish git:push common                                                   Push git commits of @athenna/common project"
            echo "       athennafish npm:increment http minor                                          Increment the minor version of @athenna/http project"
            echo "       athennafish npm:increment core patch                                          Increment the patch version of @athenna/core project"
            echo "       athennafish npm:install tsconfig \"typescript@6.0.0 eslint@6.0.0\" --save-dev   Install development libraries in @athenna/tsconfig project"
            echo "       athennafish npm:install config \"@athenna/common@6.0.0 lodash@6.0.0\"           Install libraries in @athenna/config project"
            echo "       athennafish npm:run common \"install test\"                                     Run the install and test script of @athenna/common project"
            echo "       athennafish npm:uninstall config \"@athenna/common lodash\"                     Uninstall libraries of @athenna/config project"
            echo "       athennafish npm:update config \"@athenna/common lodash\"                        Update major/minor versions of libraries of @athenna/config project"
            echo "       athennafish npm:update config all                                             Update major/minor versions of all libraries of @athenna/config project"
            echo "       athennafish update:all                                                        Update all Athenna projects in order"
            echo "Options:"
            echo "       -s, --silent             Suppress standard output"
            echo "       -v, --version            Print the version of athennafish"
            echo "       -h, --help               Print this help message"
            echo "Variables:"
            echo "       user_name                Override git user.nam, e.g. João Lenon"
            echo "       user_email               Override git user.email, e.g. lenon@athenna.io"
        case "container:up"
            _athennafish_container_up $argv[2]
        case "container:down"
            _athennafish_container_down $argv[2]
        case "git:config:user"
            _athennafish_git_config_user $argv[2]
        case "git:clone"
            _athennafish_git_clone $argv[2]
        case "git:merge"
            _athennafish_git_merge $argv[2]
        case "git:pull"
            _athennafish_git_pull $argv[2]
        case "git:push"
            _athennafish_git_push $argv[2]
        case "npm:increment"
            _athennafish_npm_increment $argv[2] $argv[3]
        case "npm:install"
            _athennafish_npm_install $argv[2] $argv[3] $argv[4]
        case "npm:run"
            _athennafish_npm_run $argv[2] $argv[3]
        case "npm:uninstall"
            _athennafish_npm_uninstall $argv[2] $argv[3]
        case "npm:update"
            _athennafish_npm_update $argv[2] $argv[3]
        case "update:all"
            athennafish git:pull tsconfig 
            athennafish npm:update tsconfig 
            athennafish npm:increment tsconfig minor
            athennafish git:push tsconfig 
            athennafish git:merge tsconfig 
            sleep 30

            athennafish git:pull test 
            athennafish npm:update test
            athennafish npm:run test "test:coverage"
            athennafish npm:increment test minor
            athennafish git:push test
            athennafish git:merge test
            sleep 30

            athennafish git:pull common
            athennafish npm:update common
            cd ~/Development/Athenna/common && npm link --silent @athenna/common
            athennafish npm:run common "test:coverage"
            athennafish npm:increment common minor
            athennafish git:push common
            athennafish git:merge common
            sleep 30

            athennafish git:pull config 
            athennafish npm:update config 
            athennafish npm:run config "test:coverage"
            athennafish npm:increment config minor
            athennafish git:push config 
            athennafish git:merge config 
            sleep 30

            athennafish git:pull ioc 
            athennafish npm:update ioc 
            athennafish npm:run ioc "test:coverage"
            athennafish npm:increment ioc minor
            athennafish git:push ioc 
            athennafish git:merge ioc 
            sleep 30

            athennafish git:pull logger 
            athennafish npm:update logger 
            athennafish npm:run logger "test:coverage"
            athennafish npm:increment logger minor
            athennafish git:push logger 
            athennafish git:merge logger 
            sleep 30

            athennafish git:pull view 
            athennafish npm:update view 
            athennafish npm:run view "test:coverage"
            athennafish npm:increment view minor
            athennafish git:push view 
            athennafish git:merge view 
            sleep 30

            athennafish git:pull artisan 
            athennafish npm:update artisan 
            athennafish npm:run artisan "test:coverage"
            athennafish npm:increment artisan minor
            athennafish git:push artisan 
            athennafish git:merge artisan 
            sleep 30

            athennafish git:pull http 
            athennafish npm:update http 
            athennafish npm:run http "test:coverage"
            athennafish npm:increment http minor
            athennafish git:push http 
            athennafish git:merge http 
            sleep 30

            # athennafish git:pull cron 
            # athennafish npm:update cron 
            # athennafish npm:run cron "test:coverage"
            # athennafish npm:increment cron minor
            # athennafish git:push cron 
            # athennafish git:merge cron 
            # sleep 30

            athennafish git:pull core 
            athennafish npm:update core 
            athennafish npm:run core "test:coverage"
            athennafish npm:increment core minor
            athennafish git:push core 
            athennafish git:merge core 
            sleep 30

            athennafish git:pull database 
            athennafish npm:update database 
            athennafish container:up database
            athennafish npm:run database "test:coverage"
            athennafish container:down database
            athennafish npm:increment database minor
            athennafish git:push database 
            athennafish git:merge database 
            sleep 30

            athennafish git:pull mail 
            athennafish npm:update mail 
            athennafish npm:run mail "test:coverage"
            athennafish npm:increment mail minor
            athennafish git:push mail 
            athennafish git:merge mail 
            sleep 30

            athennafish git:pull queue 
            athennafish npm:update queue 
            athennafish npm:run queue "test:coverage"
            athennafish npm:increment queue minor
            athennafish git:push queue 
            athennafish git:merge queue 
            sleep 30

            athennafish git:pull validator 
            athennafish npm:update validator 
            athennafish npm:run validator "test:coverage"
            athennafish npm:increment validator minor
            athennafish git:push validator 
            athennafish git:merge validator 
            sleep 30 

            athennafish git:pull cli 
            athennafish npm:update cli 
            athennafish npm:run cli "test:coverage"
            athennafish npm:increment cli minor
            athennafish git:push cli 
            athennafish git:merge cli 
            sleep 30 

            cd ~/Development/Athenna/AthennaIO/
            git checkout --quiet http
            git pull --quiet origin http
            athennafish npm:update athennaio
            athennafish npm:run athennaio "test"
            git add --quiet -A
            git commit --quiet -m "chore(npm): update dependencies"
            git push --quiet origin http
            
            cd ~/Development/Athenna/AthennaIO/
            git checkout --quiet http-slim
            git pull --quiet origin http-slim
            athennafish npm:update athennaio
            athennafish npm:run athennaio "test"
            git add --quiet -A
            git commit --quiet -m "chore(npm): update dependencies"
            git push --quiet origin http-slim

            cd ~/Development/Athenna/AthennaIO/
            git checkout --quietcli 
            git pull --quiet origincli 
            athennafish npm:update athennaio
            athennafish npm:run athennaio "test"
            git add -A
            git commit --quiet -m "chore(npm): update dependencies"
            git push --quiet origin cli 
            
            cd ~/Development/Athenna/AthennaIO/
            git checkout --quiet cli-slim
            git pull --quiet origin cli-slim
            athennafish npm:update athennaio
            athennafish npm:run athennaio "test"
            cd ~/Development/Athenna/AthennaIO/
            git add -A
            git commit --quiet -m "chore(npm): update dependencies"
            git push --quiet origin cli-slim

            athennafish git:pull template
            athennafish npm:update template
            athennafish npm:run template "test"
            cd ~/Development/Athenna/Template/ 
            git add -A
            HUSKY_SKIP_HOOKS=true git commit --quiet -m "chore(npm): update dependencies"
            git push --quiet origin develop
        case \*
            echo "athennafish: Unknown command or option: \"$cmd\" (see athennafish -h for usage)" >&2
            return 1
    end
end
