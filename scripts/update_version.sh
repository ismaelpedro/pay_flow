#!/bin/bash

# Obtém a versão atual do aplicativo
version=$(cat pubspec.yaml | grep -o '^[ ]*version:.*' | awk '{print $2}')

# Remove o sinal de "+" da versão, se presente
version=$(echo $version | sed 's/\+//g')

# Incrementa o valor de build em 1
build_number=$(expr ${FCI_BUILD_NUMBER} + 1)

# Atualiza a versão no arquivo pubspec.yaml
sed -i '' "s/version: .*/version: $version+$build_number/" pubspec.yaml
