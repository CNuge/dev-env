#!/bin/bash
cp -R global_configs/.bash_profile \
      global_configs/.condarc \
      global_configs/.gitconfig \
      global_configs/.gitignore \
      global_configs/.vim/ \
      global_configs/.vimrc \
      $HOME

#install miniconda
bash $PWD/utils/get_miniconda.sh
#install mamba
bash $PWD/utils/get_mambaforge.sh
#install nano
bash $PWD/utils/install_nano.sh

