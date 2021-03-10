#!/bin/bash
docker ps --format "{{.Names}}" | xargs docker stop
