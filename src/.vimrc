source $VIMRUNTIME/defaults.vim

packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
Jetpack 'vim-denops/denops.vim'
Jetpack 'vim-denops/denops-helloworld.vim'
Jetpack 'vim-skk/skkeleton'
Jetpack 'itchyny/lightline.vim'
call jetpack#end()

"skkeleton
call skkeleton#config({ 'globalDictionaries': ['~/.skk/SKK-JISYO.L'] })
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

"lightline
set laststatus=2
