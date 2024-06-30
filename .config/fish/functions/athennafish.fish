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
            echo "       athennafish git:clone common                                                  Clone the @athenna/common project"
            echo "       athennafish git:clone                                                         All projects from Athenna organization"
            echo "       athennafish git:merge common                                                  Merge develop into main of @athenna/common project"
            echo "       athennafish git:pull common                                                   Pull git changes of @athenna/common project"
            echo "       athennafish git:push common                                                   Push git commits of @athenna/common project"
            echo "       athennafish npm:increment http minor                                          Increment the minor version of @athenna/http project"
            echo "       athennafish npm:increment core patch                                          Increment the patch version of @athenna/core project"
            echo "       athennafish npm:install tsconfig \"typescript@6.0.0 eslint@6.0.0\" --save-dev Install development libraries in @athenna/tsconfig project"
            echo "       athennafish npm:install config \"@athenna/common@6.0.0 lodash@6.0.0\"         Install libraries in @athenna/config project" 
            echo "       athennafish npm:run common \"install test\"                                   Run the install and test script of @athenna/common project"
            echo "       athennafish npm:uninstall config \"@athenna/common lodash\"                   Uninstall libraries of @athenna/config project"
            echo "       athennafish npm:update config \"@athenna/common lodash\"                      Update major/minor versions of libraries of @athenna/config project"
            echo "       athennafish npm:update config                                                 Update major/minor versions of all libraries of @athenna/config project"
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
        case \*
            echo "athennafish: Unknown command or option: \"$cmd\" (see athennafish -h for usage)" >&2
            return 1
    end
end
