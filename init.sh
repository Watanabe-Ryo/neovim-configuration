#!/bin/bash
mkdir dein nvim_python_dev
git clone https://github.com/Shougo/dein.vim.git dein/dein.vim
if [ -x which "python3" ]
then
    python3 -m venv nvim_python_dev/nvim
    source ./nvim_python_env/nvim/bin/activate
    python3 -m pip install pynvim jedi
fi
