#!/bin/sh -l

# Set Constants
JTK_ZIP_URL="http://cdn.ewon.biz/software/javaETK/javaetk-j2se.zip"
JTK_ZIP_NAME="jtk.zip"
BUILD_OUTPUT_FOLDER_NAME="bin"
GIT_FOLDER="git"

# Configure to stop script on failure
set -eu

# Checkout current Git reference and submodules
git checkout "${GITHUB_REF##*/}" "$GIT_FOLDER"
cd "$GIT_FOLDER"
git submodule update --init --remote --recursive

# Download Ewon JTK and unzip
cd ..
curl "$JTK_ZIP_URL" --output "$JTK_ZIP_NAME"
unzip "$JTK_ZIP_NAME"

# Build Source Code with JDK and Ewon JTK
mkdir "./$BUILD_OUTPUT_FOLDER_NAME"

