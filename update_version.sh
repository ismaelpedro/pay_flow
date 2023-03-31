#!/usr/bin/env bash

# Load variables from codemagic.yaml
source "$(dirname "$0")/../codemagic.yaml"

# Get current version from pubspec.yaml
VERSION=$(grep 'version: ' pubspec.yaml | sed 's/version: //')

# Extract major, minor, and patch version numbers
MAJOR=$(echo "$VERSION" | cut -d '.' -f 1)
MINOR=$(echo "$VERSION" | cut -d '.' -f 2)
PATCH=$(echo "$VERSION" | cut -d '.' -f 3 | cut -d '+' -f 1)

# Increment patch version
PATCH=$((PATCH+1))

# Create new version number with incremented patch
NEW_VERSION="$MAJOR.$MINOR.$PATCH+${FCI_BUILD_NUMBER:-1}"
echo "$NEW_VERSION"

# Replace version in pubspec.yaml with new version number
if sed -i.bak "s/version: $VERSION/version: $NEW_VERSION/g" pubspec.yaml && rm pubspec.yaml.bak; then
  echo "Version in pubspec.yaml updated successfully"
else
  echo "Failed to update version in pubspec.yaml"
  exit 1
fi

# Commit changes to git
if git add . && git commit -m "chore: Increment version to $NEW_VERSION [SCRIPT]" && git push; then
  echo "Changes committed and pushed"
else
  echo "Failed to commit and push changes to GitHub"
  exit 1
fi
