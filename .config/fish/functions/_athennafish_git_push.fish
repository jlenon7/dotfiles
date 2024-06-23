# Push a repository from Athenna by it name.
#
# @example
# ```fish
# athennafish git:push common
# ```
function _athennafish_git_push 
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
