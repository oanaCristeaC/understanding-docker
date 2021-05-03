### Start the application:

1. Build the container image using: `docker build -t getting-started .`.

2. Start the app container: `docker run -dp 3000:3000 getting-started`.

### Persisting data in a container

Data is not persisted in a container. However, to persist the changes, a local file can be mounted to the container.

1. Create a local file (so called volume): `docker volume create todo-db`. The default location is `/var/lib/docker/volumes/<volume-name>/_data/`.

2. Stop and Remove the container.

3. Then Start the app and Mount the volume to the container: `docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started`.

-   `-dp` means detached (running in the background) at given port number.
-   `8000:3000` maps the port number of the container (3000) to the port number of the local machine (8000).
-   `-w /app` sets the current directory that the command will run from
-   `-v "$(pwd):/app"` bind mount (`-v`) the current directory from the host (`pwd`) in the container into the `/app` directory.
-   `node:12-alpine` is the image to use. Note that this is the base image for our app from the Dockerfile.
-   `sh -c "yarn install && yarn run dev"` are the shell commands to be run from `package.json`.

4. To see logs use: `docker logs -f <container-id>`.

### See app changes using `nodemon`

1. Stop container.

2. Run command: `docker run -dp 3000:3000 \ -w /app -v "$(pwd):/app" \ node:12-alpine \ sh -c "yarn install && yarn run dev"`

#### Other commands:

-   stop a container: `docker stop <container-id>`;
-   remove a container: `docker rm <container-id>`;
-   display containers: `docker ps`;
-   display docker images: `docker images`;
