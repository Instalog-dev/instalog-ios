#!/bin/bash

# Check if version argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <new_version>"
    echo "Example: $0 1.0.1"
    exit 1
fi

NEW_VERSION=$1
PODSPEC_FILE="InstalogIOS.podspec"

# Update podspec version
if [ ! -f "$PODSPEC_FILE" ]; then
    echo "Error: $PODSPEC_FILE not found"
    exit 1
fi

# Update the version in podspec
sed -i '' "s/s.version[[:space:]]*=[[:space:]]*'[^']*'/s.version          = '$NEW_VERSION'/" "$PODSPEC_FILE"

echo "Updated $PODSPEC_FILE version to $NEW_VERSION"

# Build framework
echo "Building framework..."
chmod +x framework.sh
./framework.sh

if [ $? -ne 0 ]; then
    echo "Error: Framework build failed"
    exit 1
fi

# Git operations
echo "Creating git commit and tag..."
git add .
git commit -m "Release version $NEW_VERSION"
git tag "$NEW_VERSION"
git push origin main
git push origin "$NEW_VERSION"

if [ $? -ne 0 ]; then
    echo "Error: Git operations failed"
    exit 1
fi

# Pod trunk push
echo "Publishing to CocoaPods..."
pod trunk push "$PODSPEC_FILE" --allow-warnings

if [ $? -ne 0 ]; then
    echo "Error: Pod trunk push failed"
    exit 1
fi

echo "Successfully released version $NEW_VERSION!" 