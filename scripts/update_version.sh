#!/bin/bash

# Get current version from pubspec.yaml
VERSION=$(grep 'version: ' pubspec.yaml | sed 's/version: //')

# Extract major, minor, and patch version numbers
MAJOR=$(echo $VERSION | cut -d '.' -f 1)
MINOR=$(echo $VERSION | cut -d '.' -f 2)
PATCH=$(echo $VERSION | cut -d '.' -f 3 | cut -d '+' -f 1)

# Increment patch version
PATCH=$((PATCH+1))

# Create new version number with incremented patch
NEW_VERSION="$MAJOR.$MINOR.$PATCH"
echo $NEW_VERSION

# Replace version in pubspec.yaml with new version number
sed -i.bak "s/version: $VERSION/version: $NEW_VERSION/g" pubspec.yaml
rm pubspec.yaml.bak

# Commit changes to git
git add pubspec.yaml
git commit -m "Bump version to $NEW_VERSION"
