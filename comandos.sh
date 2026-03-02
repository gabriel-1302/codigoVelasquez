#!/bin/bash

# Detener el script si ocurre un error
set -e

echo "--- Actualizando repositorios y sistema ---"
sudo apt-get update && sudo apt-get upgrade -y

echo "--- Instalando dependencias básicas (curl, wget, ssh, nano, git) ---"
sudo apt-get install -y curl wget openssh-server nano git

echo "--- Instalando Java OpenJDK 11 ---"
sudo apt-get install -y openjdk-11-jdk

echo "--- Instalando Python 3 y Pip ---"
sudo apt-get install -y python3-pip

echo "--- Descargando Apache Spark 3.5.0 ---"
# Verificamos si ya existe para no descargarlo dos veces
if [ ! -f spark-3.5.0-bin-hadoop3.tgz ]; then
    wget https://archive.apache.org/dist/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz
else
    echo "El archivo de Spark ya existe, saltando descarga."
fi

echo "--- Proceso finalizado con éxito ---"
java -version
