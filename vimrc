
syntax on		               " Syntax highlighting
set softtabstop=5             " Make spaces feel like real tabs
set background=light          " Color theme
set clipboard=unnamedplus     " Alias unnamed register to system clipboard

" Automatically convert tabs to spaces..
set tabstop=5            
set shiftwidth=5         
set expandtab

" ..Except in makefiles
autocmd FileType make setlocal noexpandtab
