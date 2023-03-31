#!/usr/bin/env bash

VERSION=$(grep 'version: ' pubspec.yaml | sed 's/version: //')

MAJOR=$(echo "$VERSION" | cut -d '.' -f 1)
MINOR=$(echo "$VERSION" | cut -d '.' -f 2)
PATCH=$(echo "$VERSION" | cut -d '.' -f 3 | cut -d '+' -f 1)
PATCH=$((PATCH+1))

LAST_COMMIT=$(git log --format="%H" -n 1)
FCI_BUILD_NUMBER=$(git rev-list --count $LAST_COMMIT)
FCI_BUILD_NUMBER=$((FCI_BUILD_NUMBER+1))

NEW_VERSION="$MAJOR.$MINOR.$PATCH+$FCI_BUILD_NUMBER"
echo "$NEW_VERSION"

if sed -i.bak "s/version: $VERSION/version: $NEW_VERSION/g" pubspec.yaml && rm pubspec.yaml.bak; then
  echo "Version in pubspec.yaml updated successfully"
else
  echo "Failed to update version in pubspec.yaml"
  exit 1
fi

git config --global user.email "http.ismaeel@gmail.com"
git config --global user.name "Ismael Pedro"

if git add . && git commit -m "chore: Increment version to $NEW_VERSION [SCRIPT]" && git push "https://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@github.com/ismaelpedro/pay_flow.git"; then
  echo "Changes committed and pushed"
else
  echo "Failed to commit and push changes"
  exit 1
fi
