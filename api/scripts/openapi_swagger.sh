#!/bin/bash

container_name=local-oapi-codegen

docker run --rm --pull=always -v "${PWD}/openapi:/local" redocly/openapi-cli \
bundle /local/specs/openapi.yaml -o /local/dist/specs/swagger.yaml

docker build -t $container_name .

docker run --rm -v "${PWD}/openapi/dist/specs:/tmp" -w /tmp $container_name \
oapi-codegen --old-config-style -package openapi -generate types,gin swagger.yaml  > pkg/openapi/api.gen.go