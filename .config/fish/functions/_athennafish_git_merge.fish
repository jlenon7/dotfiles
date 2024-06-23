# Merge a repository from Athenna by it name.
#
# @example
# ```fish
# athennafish git:merge common
# ```
function _athennafish_git_merge 
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
