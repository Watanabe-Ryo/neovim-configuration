" neoterm window moving
tnoremap <silent> <C-w> <C-\><C-n><C-w>

" set relative line number noly in NERDTree
autocmd FileType nerdtree setlocal relativenumber
" NERDTree remap configuration
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree

nnoremap <C-c> :Ttoggle<CR>
autocmd vimenter * Tnew 
