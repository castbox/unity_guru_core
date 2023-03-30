#!/bin/bash


DIR=$(cd $(dirname $0);pwd)
cd ${DIR}

source .version_tag

echo "DIR: ${DIR}"
echo "TAG: ${CORE_TAG}"

git status
git add .
git commit -m "publish core version to ${CORE_TAG}"

if [ -z "${CORE_TAG}" ] 
then
    echo "TAG is null, skip tag mark."
else
    git tag -a ${CORE_TAG} -m "add tag ${CORE_TAG}"
    git push origin ${CORE_TAG}
fi

git push

echo "version ${CORE_TAG} is done."

