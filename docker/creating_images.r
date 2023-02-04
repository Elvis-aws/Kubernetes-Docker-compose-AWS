

*****************
Create Dockerfile
*****************

- FROM
    - To specify the base image which can be pulled from a container registry( Docker hub, GCR, Quay, ECR, etc)
- USER
    - Sets the user name and UID when running the container. You can use this instruction to set a non-root user
      of the container
- LABEL
    - It is used to specify metadata information of Docker image
- ARG
    - Is used to set build-time variables with key and value. the ARG variables will not be available when the
      container is running. If you want to persist a variable on a running container, use ENV
- ENV
    - Sets environment variables inside the image. It will be available during build time as well as in a running
      container. If you want to set only build-time variables, use ARG instruction
- WORKDIR
    - Sets the current working directory. You can reuse this instruction in a Dockerfile to set a different
      working directory. If you set WORKDIR, instructions like RUN, CMD, ADD, COPY, or ENTRYPOINT gets executed in
      that directory
- COPY
    - Copies local files and directories to the image
- EXPOSE
    - Specifies the port to be exposed for the Docker container
- VOLUME
    - It is used to create or mount the volume to the Docker container
- RUN
    - Executes commands during the image build process
- CMD
    - It is used to execute a command in a running container. It can be overridden from the Docker CLI
- ENTRYPOINT
    - Specifies the commands that will execute when the Docker container starts. If you don’t specify any ENTRYPOINT,
      it defaults to /bin/sh -c. You can also override ENTRYPOINT using the --entrypoint flag using CLI. Please refer
      CMD vs ENTRYPOINT for more information
- Create image
    - docker build -t redis:101 .
    - docker build -t user-api:latest .
    - docker build -t user-api:latest -f test.Dockerfile .
- Run image
    - docker run -d -p 9090:80 --name redis-webserver redis:101
    - docker run -d -p 9003:9003 --name user-webserver user-api:latest
    - docker run [container-id]
- Tag image
    - docker tag redis:101 devopscube/redis:101
    - docker push devopscube/redis:101
