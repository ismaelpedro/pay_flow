#!/bin/bash

# Get current version from pubspec.yaml
VERSION=$(grep 'version: ' pubspec.yaml | awk '{print $2}' | tr -d '[:space:]')

# Split version number into major, minor and patch
MAJOR=$(echo $VERSION | cut -d. -f1)
MINOR=$(echo $VERSION | cut -d. -f2)
PATCH=$(echo $VERSION | cut -d. -f3)

# Increment patch version by 1
PATCH=$((PATCH+1))

# Update version in pubspec.yaml
sed -i "s/version: $VERSION/version: $MAJOR.$MINOR.$PATCH+${FCI_BUILD_NUMBER}/g" pubspec.yaml

# Commit changes
git add .
git commit -m "Incremented build version to $MAJOR.$MINOR.$PATCH+${FCI_BUILD_NUMBER}"
git push
