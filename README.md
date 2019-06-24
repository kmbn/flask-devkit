# flask-devkit
Develop and test Flask applications in a portable containerized development environment.

The app files are available locally and you can edit them with the editor of your choice. All the commands are run in a container. You do not need to install Python or any of the dependencies locally.

Flask-devkit uses Python 3.7 by default.

Postgres is included in case you need a database.

## Requirements
Docker and docker-compose are required. Docker must be running. Make is not required (you can run all the Docker and docker-commands without it); it is only required for easily using the shortcuts described below.

## Get started
```shell
make build
```
This will build the necessary container(s).

## Run tests
```shell
make test
```

## Lint code
```shell
make lint
```

## Generate test coverage report
```shell
make coverage
```

## Run the app locally for development
```shell
make up
```

To stop the app:
```shell
make down
```

## View logs
```shell
make logs
```
