#!/bin/bash

echo "Building amd64 image"
docker buildx build --platform linux/amd64 -t   robinatorondocker/cloudcmd:amd64 .

echo "Building arm64 image"
docker buildx build --platform linux/arm64 -t   robinatorondocker/cloudcmd:arm64 .

echo "Building ppc64le image"
docker buildx build --platform linux/ppc64le -t robinatorondocker/cloudcmd:ppc64le .

echo "Building armv7 image"
docker buildx build --platform linux/arm/v7 -t  robinatorondocker/cloudcmd:armv7 .

echo "Pushing amd64 image"
docker push robinatorondocker/cloudcmd:amd64 

echo "Pushing arm64 image"
docker push robinatorondocker/cloudcmd:arm64 

echo "Pushing ppc64le image"
docker push robinatorondocker/cloudcmd:ppc64le 

echo "Pushing armv7 image"
docker push robinatorondocker/cloudcmd:armv7 

echo "Manifest creation"
docker manifest create --amend robinatorondocker/cloudcmd \
    robinatorondocker/cloudcmd:amd64 \
    robinatorondocker/cloudcmd:arm64 \
    robinatorondocker/cloudcmd:ppc64le \
    robinatorondocker/cloudcmd:armv7

echo "Pushing manifest"
docker manifest push robinatorondocker/cloudcmd
