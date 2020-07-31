let g:python3_host_prog = expand('~/.config/nvim/nvim_python_env/nvim/bin/python3')
let g:python_host_prog = expand('~/.config/nvim/nvim_python_env/nvim/bin/python')
if &compatible
  set nocompatible
endif

runtime! setting/rcfile/*.vim

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.config/nvim/dein')

" dein vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein toml, dein_layz tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim/setting/toml')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
colorscheme monokai
