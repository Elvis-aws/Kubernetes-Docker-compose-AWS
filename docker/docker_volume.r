


******
Volume
******
        - Make docker stateful by mounting a volume on the container
        - Container/Host machine folder reference
        - All data in the specific directory will be persisted on the host
        - Docker creates the volume on our local host by default
        - Windows location: C\Programdata\docker\volumes
        - Linux/Mac-os location: /var/lib/docker/volumes
        - on mac , docker creates a vm were all the volumes are stored
            - screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
            - cd /var/lib/docker
