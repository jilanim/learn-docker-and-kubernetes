```
docker build -t node-util .

# can pass in any command after the image name
# passing npm init command
docker run -it -v $(pwd):/app node-util npm init
```

# Dockerfile

can use it to restrict it to npm commands so that when passing in commands you dont accidentally run commands that deletes stuff

npm will be prepended to whatever command is passed from command line
ENTRYPOINT [ "npm" ]

```
docker build -t mynpm .

# just pass init instead of npm init due to Entrypoint
docker run -it -v $(pwd):/app mynpm init
```

package.json file is copied into /app due to Bind Mount and that's why npm install works inside container

```
docker run -it -v $(pwd):/app mynpm install
docker run -it -v $(pwd):/app mynpm install express --save
```

# Docker Compose

```
# for running commands in already running containers
docker-compose exec

# run single service from compose file
docker-compose run --rm npmservice init
```
