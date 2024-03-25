#!/bin/bash

echo 'Atualizando o servidor'

#apt-get update && apt-get upgrade

# Verifica se o pacote do Apache está instalado caso não ja o faz
if dpkg -l | grep -q apache2; then
    echo "O Apache ja está instalado."
    apache2 -v
else
    echo "instalando o Apache2"
    apt-get install apache2 -y
    echo 'Eis a versão do apache'
    apache2 -v
fi

# Verifica se ja tem o unzip instalado caso não ja o faz
if dpkg -l | grep -q unzip; then
	echo 'ja tem o unzip instalado'

else
	echo 'não tem o unzip instalado'
	apt-get install unzip -y
fi

echo 'Qual o link do repositorio ou site que deseja instalar?'
read -r link_repo

cd /tmp/ && git clone "$link_repo" main

#unzip main.zip

rm -r /var/www/html/*
cd /tmp/ && cp -rvf main/* /var/www/html/
systemctl status apache2.service
