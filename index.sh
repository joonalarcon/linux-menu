#!/bin/bash

# Ruta al archivo de audio
AUDIO_FILE="./songs/12 Fulgore.mp3"

# Reproduce el audio en segundo plano usando mpv (o cualquier reproductor de audio disponible en Linux)
mpv --no-terminal "$AUDIO_FILE" &

# Obtén el PID del proceso de reproducción
AUDIO_PID=$!

function stop_audio {
  # Detén la reproducción del audio
  kill "$AUDIO_PID"
}

trap stop_audio EXIT  # Asegúrate de detener el audio al salir del script

# Función para mostrar el menú
function show_menu {
  echo "1. Opción 1"
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
      echo "Has seleccionado la opción 1."
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
      echo "Saliendo..."
      break
      ;;
    *)
      echo "Opción no válida."
      ;;
  esac
  read -p "Presiona cualquier tecla para continuar..."
done
