# Pull a repository from Athenna by it name.
#
# @example
# ```fish
# pull_repo common
# ```
function pull_repo
    echo "pulling @athenna/$argv[1] repository"

    cd ~/Development/Athenna/$argv[1]
    git fetch --all --quiet
    git pull --quiet origin develop
end

# Display outdated dependencies and update minor/patch version.
#
# @example
# ```fish
# update_deps common
# ```
function update_deps
    echo "updating dependencies of @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    npm outdated
    npm --silent update --save
end

# Increment minor version of an Athenna package.
#
# @example
# ```fish
# increment_minor common
# ```
function increment_minor
    echo "incrementing minor of @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    npm --no-git-tag-version version minor
end

# Run the tests of an Athenna package. If it fails,
# the script will stop running.
#
# @example
# ```fish
# run_tests common
# ```
function run_tests
    echo "running tests of @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    if not npm run test:coverage
        echo "failed running tests of @athenna/$argv[1] package"
        exit
    end
end

# Create a commit and push to develop and then create and
# merge a PR from develop to main.
#
# @example
# ```fish
# push_and_merge common
# ```
function push_and_merge
    echo "pushing changes to @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    git add -A
    HUSKY_SKIP_HOOKS=true git commit --quiet -m "chore(npm): update dependencies"
    git push --quiet origin develop
    gh pr create --base main --head develop --title "chore(npm): update dependencies" --body "Update project dependencies" |
        grep -o 'https://github\.com/[^ ]*' |
        xargs -I {} gh pr merge {} --auto --merge
end

# Run `docker-compose up -d` inside an Athenna project.
#
# @example
# ```fish
# container_up common
# ```
function container_up
    echo "running containers in @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    docker-compose up -d
end

# Run `docker-compose down` inside an Athenna project.
#
# @example
# ```fish
# container_down common
# ```
function container_down
    echo "shutting down container in @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    docker-compose down
end

set PKG tsconfig
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG waiting for publication in npm"

set PKG test
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG common
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
npm link --silent @athenna/$PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG config
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG waiting for publication in npm"

set PKG ioc
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG logger
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG view
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG artisan
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG http
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG core
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG database
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
container_up $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
container_down $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG mail
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG waiting for publication in npm"

set PKG queue
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG waiting for publication in npm"

set PKG validator
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
sleep 30
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

set PKG cli
echo "updating @athenna/$PKG"
pull_repo $PKG
update_deps $PKG
run_tests $PKG
increment_minor $PKG
push_and_merge $PKG
echo "successfully updated @athenna/$PKG. waiting for publication in npm"

echo "updating @athenna/athenna"
cd ~/Development/Athenna/AthennaIO/
git checkout --quiet http
git pull --quiet origin http
update_deps athennaio
run_tests athennaio
git add -A
git commit --quiet -m "chore(npm): update dependencies"
git push --quiet origin http
echo "successfully updated @athenna/athenna on branch http"

cd ~/Development/Athenna/AthennaIO/
git checkout --quiet http-slim
git pull --quiet origin http-slim
update_deps athennaio
run_tests athennaio
git add -A
git commit --quiet -m "chore(npm): update dependencies"
git push --quiet origin http-slim
echo "successfully updated @athenna/athenna on branch http-slim"

cd ~/Development/Athenna/AthennaIO/
git checkout --quiet cli
git pull --quiet origin cli
update_deps athennaio
run_tests athennaio
git add -A
git commit --quiet -m "chore(npm): update dependencies"
git push --quiet origin cli
echo "successfully updated @athenna/athenna on branch cli"

cd ~/Development/Athenna/AthennaIO/
git checkout --quiet cli-slim
git pull --quiet origin cli-slim
update_deps athennaio
run_tests athennaio
git add -A
git commit --quiet -m "chore(npm): update dependencies"
git push --quiet origin cli-slim
echo "successfully updated @athenna/athenna on branch cli-slim"

echo "updating @athenna/template"
pull_repo template
update_deps template
run_tests template
git add -A
HUSKY_SKIP_HOOKS=true git commit --quiet -m "chore(npm): update dependencies"
git push --quiet origin develop
echo "successfully updated @athenna/template"

echo
echo "######## DONE ########"
