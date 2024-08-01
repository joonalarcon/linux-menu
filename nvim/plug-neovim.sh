#!/bin/bash

# Función para instalar vim-plug para Neovim
function install_vim_plug_for_neovim() {
    local plug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    local nvim_plug_dir="$HOME/.local/share/nvim/site/autoload"
    local nvim_config_dir="$HOME/.config/nvim"

    echo "Instalando vim-plug para Neovim..."

    # Crear directorios necesarios para Neovim
    mkdir -p "$nvim_plug_dir"
    mkdir -p "$nvim_config_dir"

    # Descargar e instalar vim-plug para Neovim
    if [ ! -f "$nvim_plug_dir/plug.vim" ]; then
        echo "Instalando vim-plug para Neovim..."
        curl -fLo "$nvim_plug_dir/plug.vim" --create-dirs "$plug_url"
    else
        echo "vim-plug ya está instalado para Neovim."
    fi

    # Crear archivo de configuración para Neovim
    local nvim_init="$nvim_config_dir/init.vim"
    if [ ! -f "$nvim_init" ]; then
        echo "Creando configuración básica para Neovim..."
        cat << EOF > "$nvim_init"
" Configuración básica de vim-plug para Neovim
" Habilita el resaltado de la sintaxis

syntax enable

" Configurar resaltado de sintaxis para TypeScript y JavaScript
autocmd FileType typescript,javascript syntax sync fromstart

" Habilita la numeración de líneas
set number
set relativenumber

" Habilita el autoindentado
set autoindent

" Ajusta el ancho de tabulación a 2 espacios
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=UTF-8
set guifont=MesloLGS\ NF:h12
set encoding=utf-8

" Habilita la búsqueda incremental
set incsearch

" Ignora las diferencias de mayúsculas/minúsculas durante la búsqueda
set ignorecase

" Habilita el autoindentado inteligente
set smartindent

" No mostrar la barra de información
set noshowmode

" Habilita el resaltado de la línea seleccionada
set cursorline

" Habilita la búsqueda incremental en la línea de comandos
set inccommand=split

" Define la tecla líder como espacio
let mapleader = "\<Space>"

call plug#begin('~/.local/share/nvim/site/plugged')

" Instalar vim-airline
Plug 'vim-airline/vim-airline'

" Instalar NerdTree (explorador de archivos)
Plug 'preservim/nerdtree'

" Instalar fzf (fuzzy finder)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Instalar coc.nvim (autocompletado y LSP)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Instalar gruvbox (tema de colores)
Plug 'morhetz/gruvbox'

" Instalar vim-fugitive (integración de Git)
Plug 'tpope/vim-fugitive'

call plug#end()

" Configuración adicional de Neovim aquí

" Configurar el tema de colores
colorscheme gruvbox

EOF
    else
        echo "La configuración de Neovim ya existe."
    fi

    echo "Instalación y configuración de vim-plug para Neovim completadas."

    # Ejecutar :PlugInstall en Neovim
    echo "Ejecutando :PlugInstall en Neovim..."
    nvim +PlugInstall +qall
}

# Ejecutar la función
install_vim_plug_for_neovim

