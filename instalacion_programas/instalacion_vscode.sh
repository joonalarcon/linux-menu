#!/bin/bash

function install_vscode_snap() {
  echo "Iniciando la instalación de Visual Studio Code usando Snap..."

  # Verificar si snapd está instalado
  if command -v snap >/dev/null 2>&1; then
    echo "Snap ya está instalado."
  else
    echo "Snap no está instalado. Instalando snapd..."
    apt update
    apt install -y snapd
  fi

  # Instalar Visual Studio Code usando Snap
  echo "Instalando Visual Studio Code..."
  snap install --classic code

  # Verificar la instalación
  if command -v code >/dev/null 2>&1; then
    echo "Visual Studio Code se ha instalado correctamente."
  else
    echo "Hubo un problema al instalar Visual Studio Code."
  fi
}

# Llamar a la función
install_vscode_snap

