source $VIMRUNTIME/defaults.vim

let s:jetpackfile = expand('~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim')
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
Jetpack 'prabirshrestha/asyncomplete.vim'
Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
Jetpack 'prabirshrestha/vim-lsp'
Jetpack 'mattn/vim-lsp-settings'
Jetpack 'mattn/vim-lsp-icons'
call jetpack#end()

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

if jetpack#tap('skkeleton')
  let s:dictfile = expand('~/.skk/SKK-JISYO.L')
  let s:dicturl = "https://raw.githubusercontent.com/skk-dev/dict/master/SKK-JISYO.L"
  if !filereadable(s:dictfile)
    call system(printf('curl -fsSLo %s --create-dirs %s', s:dictfile, s:dicturl))
  endif
  imap <C-j> <Plug>(skkeleton-enable)
  cmap <C-j> <Plug>(skkeleton-enable)
  call skkeleton#azik#add_table('us')
  call skkeleton#config(
    \ {
    \   'globalDictionaries': [ s:dictfile ],
    \   'kanaTable': 'azik',
    \   'eggLikeNewline': v:true
    \ })
endif

if jetpack#tap('statusline_skk.vim')
  set laststatus=2
  let g:lightline_skk_announce = v:true
  let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'skk_mode' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \   },
    \ 'component_function': {
    \   'skk_mode': 'statusline_skk#mode',
    \   },
    \ }
endif

if jetpack#tap('vim-lsp')
  function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
  endfunction

  augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  augroup END

  let g:lsp_diagnostics_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  let g:asyncomplete_auto_popup = 1
  let g:asyncomplete_auto_completeopt = 0
  let g:asyncomplete_popup_delay = 200
  let g:lsp_text_edit_enabled = 1
endif
