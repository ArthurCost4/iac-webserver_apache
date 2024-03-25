#!/bin/bash

echo 'Atualizando o servidor'

#apt-get update && apt-get upgrade

# Verifica se o pacote do Apache está instalado
if dpkg -l | grep -q apache2; then
    echo "O Apache ja está instalado."
else
    echo "instalando o Apache2"
    #apt-get install apache2 -y
    echo 'Eis a versão do apache'
    # apache2 -v
fi

# Verifica se ja tem o unzip instalado
if dpkg -l | grep -q unzip; then
	echo 'ja tem'
else
	echo 'não tem'
	#apt-get install unzip -y
fi

echo 'Qual o link do repositorio ou site que deseja instalado?'
read -r link_repo

echo "$link_repo"
