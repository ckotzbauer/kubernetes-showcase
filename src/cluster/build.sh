#!/bin/bash

docker buildx build --load --platform=linux/amd64 --no-cache --progress=plain -t kubernetes .
