import docker
from context import Context

client = docker.from_env()
container_id = client.containers.run("user-api:latest", "sleep infinity", detach=False).id
Context.container_id = container_id
