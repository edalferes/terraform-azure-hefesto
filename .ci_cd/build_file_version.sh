#!/bin/bash
# Create File version to use CI/CD
# Maintainer: Edmilson Alferes <edmilson.alferes@ibopemedia.kantar.com>


VERSION_BASE=$(cat VERSION_BASE)
BRANCH_BASE=${1}
BUILD_ID=${2}

echo "ID: ${BUILD_ID} - BRANCH: ${BRANCH_BASE}"

get_patch(){

    branch=${1}

    if [[ ${branch} == "develop" ]]; then
        patch="0-alpha.${BUILD_ID}"
    else
        patch="${BUILD_ID}"
    fi

    echo ${patch}
}

build_version(){

    patch=$(get_patch "${BRANCH_BASE}")
   
    echo "${VERSION_BASE}${patch}" > VERSION_TMP
    tr '\n' ' ' < VERSION_TMP > VERSION
    sed -i 's/ *$//g' VERSION
    mv VERSION ../
}

clean() {
    rm -rf VERSION_TMP
}

main(){

    build_version
    clean
}

main