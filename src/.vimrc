source $VIMRUNTIME/defaults.vim

packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
Jetpack 'vim-denops/denops.vim'
Jetpack 'vim-denops/denops-helloworld.vim'
Jetpack 'vim-skk/skkeleton'
Jetpack 'NI57721/skkeleton-azik-kanatable'
Jetpack 'yasunori0418/statusline_skk.vim'
Jetpack 'itchyny/lightline.vim'
call jetpack#end()

"skkeleton
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)
call skkeleton#azik#add_table('us')
call skkeleton#config(
  \ {
  \   'globalDictionaries': ['~/.skk/SKK-JISYO.L'],
  \   'kanaTable': 'azik',
  \   'eggLikeNewline': v:true
  \ })

"statusline_skk
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste', 'skk_mode' ],
  \             [ 'readonly', 'filename', 'modified' ] ]
  \   },
  \ 'component_function': {
  \   'skk_mode': 'statusline_skk#mode',
  \   },
  \ }

"lightline
set laststatus=2
