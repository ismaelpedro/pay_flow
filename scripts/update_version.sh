
# Lê o número de versão atual do arquivo pubspec.yaml
version=$(awk '/^version:/ {print $2}' pubspec.yaml)

# Separa o número de versão da tag de build usando o caractere "+"
base_version=${version%+*}

# Incrementa a tag de build com o valor da variável FCI_BUILD_NUMBER
build_number=$FCI_BUILD_NUMBER
new_version="$base_version+$build_number"

# Substitui o número de versão no arquivo pubspec.yaml
sed -i -e "s/version:.*$/version: $new_version/g" pubspec.yaml
