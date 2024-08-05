#!/bin/bash

# Incluye el archivo externo con las funciones
source "./informacion_sistema.sh"

# Función para mostrar el menú
function show_menu {
  echo "1. Información del sistema"
  echo "2. Opción 2"
  echo "3. Opción 3"
  echo "4. Opción 4"
  echo "5. Opción 5"
  echo "6. Opción 6"
  echo "7. Opción 7"
  echo "8. Salir"
}

while true; do
  clear
  show_menu
  read -p "Selecciona una opción: " option

  case $option in
    1)
      echo "Informacion de Sistema."
      ejecutar_neofetch # Ejecucion de Neofetch
      ;;
    2)
      echo "Has seleccionado la opción 2."
      ;;
    3)
      echo "Has seleccionado la opción 3."
      ;;
    4)
      echo "Has seleccionado la opción 4."
      ;;
    5)
      echo "Has seleccionado la opción 5."
      ;;
    6)
      echo "Has seleccionado la opción 6."
      ;;
    7)
      echo "Has seleccionado la opción 7."
      ;;
    8)
      echo clear
      echo "Saliendo..."
      break
      ;;
    *)
      echo "Opción no válida."
      ;;
  esac
  read -p "Presiona cualquier tecla para continuar..."
done
