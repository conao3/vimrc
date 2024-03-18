source $VIMRUNTIME/defaults.vim

packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
Jetpack 'vim-denops/denops.vim'
Jetpack 'vim-denops/denops-helloworld.vim'
Jetpack 'vim-skk/skkeleton', {
\  'do': {
\     -> skkeleton#config({ 'globalDictionaries': ['~/.skk/SKK-JISYO.L'] })
\   }
\ }
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)
Jetpack 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
call jetpack#end()
