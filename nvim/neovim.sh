#!/bin/bash

# Función para verificar si neovim está instalado y, si no, instalarlo
function ensure_neovim() {
    if command -v nvim &>/dev/null; then
        echo "Neovim ya está instalado."
    else
        echo "Neovim no está instalado. Instalando..."
        
        # Actualizar el índice de paquetes
        apt update

        # Instalar neovim
        apt install -y neovim

        if [ $? -eq 0 ]; then
            clear
            sync
            echo "Neovim se ha instalado correctamente."
	    
        else
            echo "Error al instalar Neovim."
        fi
    fi
}

# Ejecutar la función
ensure_neovim

