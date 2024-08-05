#!/bin/bash

# Función para imprimir mensajes en rojo
function print_red() {
  local message="$1"
  echo -e "\033[31m${message}\033[0m"
}

# Función para ejecutar neofetch
function ejecutar_neofetch() {
  # Verificar si neofetch está instalado
  if command -v neofetch >/dev/null 2>&1; then
    print_red "Ejecutando neofetch..."
    neofetch # Ejecución del programa Neofetch
    print_red "Fin de la ejecución del programa"
    sleep 2  # Pausa de 2 segundos antes de limpiar la pantalla
    clear
  else
    print_red "Error: neofetch no está instalado. Instalando neofetch..."
    # Instalar neofetch si no está instalado
    if command -v apt >/dev/null 2>&1; then
      # Para sistemas basados en Debian/Ubuntu
      print_red "Instalando neofetch usando apt..."
      sudo apt update -qq > /dev/null 2>&1
      sudo apt install -y neofetch > /dev/null 2>&1
    elif command -v yum >/dev/null 2>&1; then
      # Para sistemas basados en RHEL/CentOS
      print_red "Instalando neofetch usando yum..."
      sudo yum install -y neofetch > /dev/null 2>&1
    elif command -v dnf >/dev/null 2>&1; then
      # Para sistemas basados en Fedora
      print_red "Instalando neofetch usando dnf..."
      sudo dnf install -y neofetch > /dev/null 2>&1
    elif command -v pacman >/dev/null 2>&1; then
      # Para sistemas basados en Arch Linux
      print_red "Instalando neofetch usando pacman..."
      sudo pacman -Syu neofetch --noconfirm > /dev/null 2>&1
    else
      print_red "Error: Administrador de paquetes no soportado. Instale neofetch manualmente."
      exit 1
    fi
    # Ejecutar neofetch después de la instalación
    print_red "Ejecutando neofetch después de la instalación..."
    sleep 2  # Pausa de 2 segundos antes de limpiar la pantalla
    clear
    neofetch
  fi
}


