#!/usr/bin/env bash

# Navigate to the root directory where pubspec.yaml is located
cd ..

VERSION=$(grep 'version: ' pubspec.yaml | sed 's/version: //')

MAJOR=$(echo "$VERSION" | cut -d '.' -f 1)
MINOR=$(echo "$VERSION" | cut -d '.' -f 2)
PATCH=$(echo "$VERSION" | cut -d '.' -f 3 | cut -d '+' -f 1)
PATCH=$((PATCH+1))

LAST_COMMIT=$(git log --format="%H" -n 1)
CM_BUILD_NUMBER=$(git rev-list --count "$LAST_COMMIT")
CM_BUILD_NUMBER=$((CM_BUILD_NUMBER+1))

NEW_VERSION="$MAJOR.$MINOR.$PATCH+$CM_BUILD_NUMBER"
echo "$NEW_VERSION"

# Update the version in pubspec.yaml
if sed -i.bak "s/version: $VERSION/version: $NEW_VERSION/g" pubspec.yaml && rm pubspec.yaml.bak; then
  echo "Version in pubspec.yaml updated successfully"
else
  echo "Failed to update version in pubspec.yaml"
  exit 1
fi

# Commit and push the changes
if git add . && git commit -m "chore: Increment version to $NEW_VERSION [SCRIPT]"; then
  if git push "https://ismaelpedro:${GH_PASSWORD}@github.com/ismaelpedro/pay_flow.git"; then
    echo "Changes committed and pushed"
  else
    echo "Failed to push changes"
    exit 1
  fi
else
  echo "Failed to commit changes"
  exit 1
fi
