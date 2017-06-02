#!/bin/bash

docker build -t vapor-example .             # Build the docker container.
docker run -d -p 8080:8080 vapor-example    # Run the docker container.
