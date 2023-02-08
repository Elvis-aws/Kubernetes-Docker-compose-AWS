import docker
from context import Context

client = docker.from_env()
container_id = Context.container_id
container = client.containers.get(container_id)
container.stop()
