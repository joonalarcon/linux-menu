#!/bin/bash

function instalar_java() {
  echo "Iniciando Instalación de Java 11"
  
  # Verificar si Java 11 ya está instalado
  if dpkg -l | grep -q openjdk-11-jdk; then
    echo "Java 11 ya está instalado."
  else
    echo "Java 11 no está instalado. Procediendo con la instalación."
    
    # Instalar Java 11
    apt install -y openjdk-11-jdk
    
    echo "Instalación de Java 11 realizada con éxito."
  fi
}

instalar_java

