source $VIMRUNTIME/defaults.vim

let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

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
Jetpack 'prabirshrestha/vim-lsp'
Jetpack 'mattn/vim-lsp-settings'
call jetpack#end()

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

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
