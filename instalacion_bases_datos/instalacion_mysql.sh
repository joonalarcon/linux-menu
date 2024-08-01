#!/bin/bash

function install_mysql() {
  # Verificar si MySQL ya está instalado
  if command -v mysql >/dev/null 2>&1; then
    echo "MySQL ya está instalado."
  else
    echo "MySQL no está instalado. Procediendo con la instalación."

    # Actualizar el índice de paquetes
    apt update

    # Instalar MySQL
    apt install -y mysql-server

    # Asegurar la instalación de MySQL
    mysql_secure_installation

    echo "Instalación de MySQL realizada con éxito."
  fi

  # Verificar el estado del servicio de MySQL
  echo "Verificando el estado del servicio de MySQL..."
  sudo systemctl status mysql

  # Proveer instrucciones para acceder al cliente de MySQL
  echo "Puedes acceder al cliente de MySQL con el siguiente comando:"
  echo "sudo mysql"
}

# Llamar a la función
install_mysql

