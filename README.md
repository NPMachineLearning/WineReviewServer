# WineReviewServer

A backend server source code.
This server backend provide a wine recommendation service for consumer.

# Technology

- [fastapi](https://fastapi.tiangolo.com/)
- [Docker](https://www.docker.com/)
- [scikit-learn](https://scikit-learn.org/stable/)

# Container

Server can only be deployed to containerized platform or run
server as container locally

# API document

1. run `docker compose up` and wait for server boot up
2. visit [http://localhost:8080/redoc](http://localhost:8080/redoc)
   if port is changed compose and docker file then port number must be
   changed accordingly
