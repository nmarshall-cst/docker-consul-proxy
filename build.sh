#!/bin/bash
NOW=`date "+%m%d%Y-%H%M"`
REPONAME=${PWD##*/}
IMAGETAG=$1
DOCKER_REPO="quay.io/foo"
STARTTIME=$(date +%s)

echo "========="
echo "Variables"
echo "========="
echo "NOW == $NOW"
echo "REPONAME == $REPONAME"
echo "TAG == $TAG"
echo "IMAGETAG == $IMAGETAG"
echo "DOCKER_REPO == $DOCKER_REPO"
echo "STARTTIME == $STARTTIME"
echo ""
echo ""
echo ""

echo "Building image $IMAGETAG"
docker build -t $REPONAME .
docker tag $REPONAME $DOCKER_REPO/infrastructure:$REPONAME-latest
docker tag $REPONAME $DOCKER_REPO/infrastructure:$REPONAME-$IMAGETAG
docker push $DOCKER_REPO/infrastructure:$REPONAME-latest
docker push $DOCKER_REPO/infrastructure:$REPONAME-$IMAGETAG
echo "Build Successful"
ENDTIME=$(date +%s)
echo "Time taken: $(($ENDTIME - $STARTTIME)) seconds."
