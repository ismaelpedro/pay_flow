#!/bin/bash

# Lê a versão atual do arquivo pubspec.yaml
VERSION=$(grep "version: " pubspec.yaml | awk '{print $2}')

# Extrai o número da versão principal, secundária e de patch
MAJOR=$(echo $VERSION | awk -F '.' '{print $1}')
MINOR=$(echo $VERSION | awk -F '.' '{print $2}')
PATCH=$(echo $VERSION | awk -F '.' '{print $3}' | awk -F '+' '{print $1}')

# Incrementa o número de build em 1
FCI_BUILD_NUMBER=$(($FCI_BUILD_NUMBER + 1))

# Atualiza a versão no arquivo pubspec.yaml
sed -i '' "s/version: $VERSION/version: $MAJOR.$MINOR.$PATCH+${FCI_BUILD_NUMBER}/g" pubspec.yaml

# Cria um commit com a nova versão
# git add pubspec.yaml
# git commit -m "Bump version to $MAJOR.$MINOR.$PATCH+${FCI_BUILD_NUMBER} [skip ci]"
