#!/bin/bash

# Incrementa o valor de build em 1
build_number=$(expr ${FCI_BUILD_NUMBER} + 1)

# Atualiza a versão no arquivo pubspec.yaml
sed -i '' "s/version: .*/version: $(cat pubspec.yaml | grep -o '^[ ]*version:.*' | awk '{print $2}')+$build_number/" pubspec.yaml
