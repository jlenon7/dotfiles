function gitconfig --description "Configure a git repository"
    for silent in --silent -s
        if set --local index (contains --index -- $silent $argv)
            set --erase argv[$index] && break
        end
        set --erase silent
    end

    set --local cmd $argv[1]
    set --local repository (basename $PWD)

    switch "$cmd"
        case -v --version
            echo "gitconfig, version 1.0.0"
        case "" -h --help
            echo "Usage: gitconfig personal       Configure the local repository to use my personal configurations"
            echo "       gitconfig cloudflare     Configure the local repository to use my Cloudflare configurations"
            echo "       gitconfig rebase         Rebase to change the author of all the commits from the project"
            echo "Options:"
            echo "       -s, --silent             Suppress standard output"
            echo "       -v, --version            Print the version of gitconfig"
            echo "       -h, --help               Print this help message"
            echo "Variables:"
            echo "       user_name                Override git user.nam, e.g. João Lenon"
            echo "       user_email               Override git user.email, e.g. lenon@athenna.io"
        case personal
            git config --local user.name "João Lenon"
            git config --local user.email "lenonsec7@gmail.com"

            echo "Successfully set personal configurations in $repository repository"
        case cloudflare 
            git config --local user.name "João Lenon"
            git config --local user.email "joaolenon@cloudflare.com"

            echo "Successfully set Cloudflare configurations in $repository repository"
        case rebase
            git rebase -r --root --exec "git commit --amend --no-edit --reset-author"

            echo "Successfully rebased authors in $repository repository"
        case \*
            echo "gitconfig: Unknown command or option: \"$cmd\" (see gitconfig -h for usage)" >&2
            return 1
    end
end
