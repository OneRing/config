" .vimrc 04-14-11

syntax on                     " Syntax highlighting
set background=dark           " Color theme
set clipboard=unnamedplus     " Alias unnamed register to system clipboard
                              " Requires Vim >= 7.3.74 compiled with +X11

" Courtesy Max Cantor 
set ignorecase                " Don't care about case...
set smartcase                 " ... unless the query contains upper case characters
set autoindent                " Enable automatic indenting for files with ft set
set nowrap                    " No fake carriage returns
set showcmd                   " Show command in statusline as it's being typed
set showmatch                 " Jump to matching bracket
set ruler                     " Show row,col %progress through file
set laststatus=2              " Always show filename (2 is always)
set hidden                    " Let us move between buffers without writing them.  
                              " .... Don't :q! or :qa! frivolously!
set softtabstop=4             " Vim sees 4 spaces as a tab
set shiftwidth=4              " < and > uses spaces
set expandtab                 " Tabs mutate into spaces
set foldmethod=indent         " Default folding

" Tab are syntactically important in Makefiles, so do not remove them
autocmd FileType make setlocal noexpandtab

" Movement between tabs OR buffers
nnoremap L :call MyNext()
nnoremap H :call MyPrev()

function! MyNext()
     if exists( '*tabpagenr' ) && tabpagenr('$') != 1
          " Tab support && tabs open
          normal gt
     else
          " No tab support, or no tabs open
          execute ":bnext"
     endif
endfunction
function! MyPrev()
     if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
          " Tab support && tabs open
          normal gT
     else
          " No tab support, or no tabs open
          execute ":bprev"
     endif
endfunction




