#!/bin/sh
GIT_USER=$(git config user.name)
REPO_ROOT=$(git rev-parse --show-toplevel)/geunsu

function closeXcode() {
    kill $(ps aux | grep 'Xcode' | awk '{print $2}')
}

function removeAllProjectFiles() {
    echo "❗Removing All .xcodeproj files and .xcworkspaces"

    find ${REPO_ROOT} \
    -name "*.xcodeproj" \
    -o -name "*.xcworkspace" \
    -exec rm -rf {} \;
    
    echo "All xcode project related files removed successfully🎉"
}

function generateAllProjects() {
    for project_file in $(find ${REPO_ROOT}/Apps/ -type f -name "Project.swift"); do
        local dir_name=$(dirname "$project_file")
        tuist generate -p $dir_name --no-open
    done
}

if [ ${GIT_USER} -ne "devkimmy"] ; then
    exit 0
fi

# 1. Close Xcode
closeXcode

# 2. Remove All Project Files(xcodeproj, xcworkspace) if exists
removeAllProjectFiles

# 3. Generate code rojects for `Apps` layer using tuist
generateAllProjects