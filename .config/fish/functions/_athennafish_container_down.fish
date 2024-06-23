# Run `docker-compose down -d` inside an Athenna project.
#
# @example
# ```fish
# athennafish container:down common
# ```
function _athennafish_container_down
    echo "running containers in @athenna/$argv[1]"

    cd ~/Development/Athenna/$argv[1]
    if not docker-compose down -d
        cd $PWD
        echo "failed to stop containers in @athenna/$argv[1]"
    end

    cd $PWD
    echo "successfully stopped containers in @athenna/$argv[1]"
end
