#!/bin/bash

# Obtém a versão atual do aplicativo
version=$(cat pubspec.yaml | grep -o '^[ ]*version:.*' | awk '{print $2}')

# Remove o sinal de "+" da versão, se presente
version=$(echo $version | sed 's/\+//g')

# Separa a versão em major, minor e patch
major=$(echo $version | cut -d '.' -f 1)
minor=$(echo $version | cut -d '.' -f 2)
patch=$(echo $version | cut -d '.' -f 3)

# Incrementa o valor de build em 1
build_number=$(expr ${FCI_BUILD_NUMBER} + 1)

# Atualiza a versão do aplicativo com o valor de build incrementado
version="$major.$minor.$patch+$build_number"

# Atualiza a versão no arquivo pubspec.yaml
sed -i '' "s/version: .*/version: $version/" pubspec.yaml

# Exibe a nova versão atualizada no console
echo "Nova versão: $version"
