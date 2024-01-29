#!/usr/bin/env bash

# Extrai a versão atual do arquivo pubspec.yaml
VERSION=$(grep 'version: ' pubspec.yaml | sed 's/version: //')

# Divide a versão em MAJOR, MINOR, PATCH e BUILD
MAJOR=$(echo "$VERSION" | cut -d '.' -f 1)
MINOR=$(echo "$VERSION" | cut -d '.' -f 2)
PATCH=$(echo "$VERSION" | cut -d '.' -f 3 | cut -d '+' -f 1)
BUILD=$(echo "$VERSION" | cut -d '+' -f 2)

# Incrementa o PATCH
PATCH=$((PATCH+1))

# Incrementa o BUILD em 1
BUILD=$((BUILD+1))

# Monta a nova versão
NEW_VERSION="$MAJOR.$MINOR.$PATCH+$BUILD"
echo "$NEW_VERSION"

# Atualiza a versão no arquivo pubspec.yaml
if sed -i.bak "s/version: $VERSION/version: $NEW_VERSION/g" pubspec.yaml && rm pubspec.yaml.bak; then
  echo "Version in pubspec.yaml updated successfully"
else
  echo "Failed to update version in pubspec.yaml"
  exit 1
fi

# Commita e faz push das mudanças
# if git add . && git commit -m "chore: Increment version to $NEW_VERSION [SCRIPT]" && git push https://ismaelpedro:$GH_TOKEN@github.com/ismaelpedro/pay_flow.git; then
#   echo "Changes committed and pushed"
# else
#   echo "Failed to commit and push changes"
#   exit 1
# fi
