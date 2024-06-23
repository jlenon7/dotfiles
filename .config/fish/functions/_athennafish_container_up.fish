# Run `docker-compose up -d` inside an Athenna project.
#
# @example
# ```fish
# athennafish container:up common
# ```
function _athennafish_container_up
    echo "running containers in @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    if not docker-compose up -d
        cd $PWD
        echo "failed to run containers in @athenna/$argv[1]"
    end

    cd $PWD
    echo "successfully ran containers in @athenna/$argv[1]"
end
