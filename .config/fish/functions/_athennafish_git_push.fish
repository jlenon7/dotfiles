# Push a repository from Athenna by it name.
#
# @example
# ```fish
# athennafish git:push common
# ```
function _athennafish_git_push 
    if test $argv[1] = "all" 
      echo "pushing all athenna repositories"

      athennafish git:push Cli
      athennafish git:push Common
      athennafish git:push Config
      athennafish git:push Core
      athennafish git:push Database
      athennafish git:push Docs
      athennafish git:push Http
      athennafish git:push Ioc
      athennafish git:push Logger
      athennafish git:push Mail
      athennafish git:push Queue
      athennafish git:push Template
      athennafish git:push Test
      athennafish git:push Tsconfig
      athennafish git:push Validator
      athennafish git:push View

      return
    end

    echo "pushing @athenna/$argv[1] repository"

    cd ~/Development/Athenna/$argv[1]
    git add -A
    HUSKY_SKIP_HOOKS=true git commit --quiet -m "chore(npm): update dependencies"
    if not  git push --quiet origin develop
        cd $PWD
        echo "failed to push @athenna/$argv[1] repository"
    end

    cd $PWD
    echo "successfully pushed @athenna/$argv[1] repository"
end
