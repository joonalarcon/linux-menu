#!/bin/bash

function instalacion_node() {
  echo "Iniciando Instalación de lenguajes de programación"
  
  # Verificar si Node.js ya está instalado
  if command -v node > /dev/null 2>&1; then
    echo "Node.js ya está instalado."
  else
    echo "Node.js no está instalado. Procediendo con la instalación."
    
    # Actualizar el sistema y agregar el repositorio de NodeSource
    sudo apt update
    sudo apt install -y curl
    
    # Agregar el repositorio de NodeSource
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    
    # Instalar Node.js
    sudo apt install -y nodejs
    
    echo "Instalación de Node.js realizada con éxito."
  fi
}

instalacion_node


