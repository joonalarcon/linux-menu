#!/bin/bash

function install_zsh_plugins() {
  # Instalar Oh My Zsh si no está instalado
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "Oh My Zsh ya está instalado."
  fi

  # Crear directorio para plugins personalizados si no existe
  mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

  # Lista de plugins a instalar
  plugins=(
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
    "zsh-completions"
  )

  # Instalar plugins
  echo "Instalando plugins..."

  for plugin in "${plugins[@]}"; do
    plugin_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$plugin"
    
    if [ -d "$plugin_dir" ]; then
      echo "$plugin ya está instalado."
    else
      case $plugin in
        "zsh-autosuggestions")
          git clone https://github.com/zsh-users/zsh-autosuggestions.git $plugin_dir
          ;;
        "zsh-syntax-highlighting")
          git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $plugin_dir
          ;;
        "zsh-completions")
          git clone https://github.com/zsh-users/zsh-completions.git $plugin_dir
          ;;
        *)
          echo "Plugin desconocido: $plugin. Omitiendo instalación."
          ;;
      esac
    fi
  done

  # Configurar ~/.zshrc para incluir los nuevos plugins
  echo "Configurando ~/.zshrc..."

  # Respaldar el archivo ~/.zshrc original si no existe
  if [ ! -f ~/.zshrc.backup ]; then
    cp ~/.zshrc ~/.zshrc.backup
  fi

  # Añadir plugins a ~/.zshrc
  if grep -q 'plugins=(' ~/.zshrc; then
    # Reemplazar línea existente
    sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc
  else
    # Añadir línea si no existe
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)' >> ~/.zshrc
  fi

  # Aplicar cambios
  if [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
  else
    echo "Error: Oh My Zsh no está cargado. Asegúrate de estar usando zsh."
  fi

  echo "Plugins instalados y configurados con éxito."
}

# Llamar a la función
install_zsh_plugins

