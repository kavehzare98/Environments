syntax on

" =========================
" == Indentation Settings ==
" =========================
set tabstop=2        " Number of visual spaces per TAB
set shiftwidth=2     " Number of spaces for autoindent
set softtabstop=2    " Number of spaces for TAB in insert mode
set expandtab        " Convert tabs to spaces by default

" Enable built-in filetype detection/plugins/indentation
filetype plugin indent on

" If you truly need custom filetype detection for assembly, keep this; otherwise omit.
autocmd BufRead,BufNewFile *.s,*.S,*.asm setfiletype asm

" ===============================
" == Filetype-specific overrides ==
" ===============================
augroup filetype_indent_overrides
  autocmd!
  " Use real tabs for Python files (your request)
  autocmd FileType python setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0

  " Use real tabs for Makefiles (tabs required)
  autocmd FileType make   setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
augroup END

"" ============================
"" == 80-column visual marker ==
"" ============================
set colorcolumn=80
highlight ColorColumn ctermbg=lightblue guibg=lightblue

" ================================================
" == Automatically remove trailing whitespace    ==
" == (but never in Makefiles; tabs matter there) ==
" ================================================
augroup trim_trailing_ws
  autocmd!
  autocmd BufWritePre * if &filetype !=# 'make' | silent! %s/\s\+$//e | endif
augroup END

" ==============================
" == Optional editing niceties ==
" ==============================
set smartindent
set number
set norelativenumber
set nohlsearch

"" ===============
"" == vim-plug  ==
"" ===============
"call plug#begin('~/.vim/plugged')
"Plug 'arcticicestudio/nord-vim'
"call plug#end()

"colorscheme nord

"" ==========================
"" == Darken background UI ==
"" ==========================
"highlight Normal       guibg=#1a1f26 ctermbg=234
"highlight LineNr       guibg=#1a1f26 ctermbg=234
"highlight SignColumn   guibg=#1a1f26 ctermbg=234
"highlight VertSplit    guibg=#1a1f26 ctermbg=234
"highlight StatusLine   guibg=#1a1f26 ctermbg=234
"highlight Pmenu        guibg=#1a1f26 ctermbg=234
"highlight ColorColumn  guibg=#2c333d ctermbg=237

call plug#begin('~/.vim/plugged')
" Catppuccin colorscheme for Vim
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
"Plug 'dense-analysis/ale'
call plug#end()

"" =============
"" == UI/Theme ==
"" =============
set termguicolors
set background=dark
set relativenumber

" Load the colorscheme
colorscheme catppuccin_mocha
" colorscheme catppuccin_macchiato
" colorscheme catppuccin_frappe
" colorscheme catppuccin_latte
"
" ===== ALE basic setup =====
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 1

" Tell ALE which linters to use for C++
let g:ale_linters = {
\   'cpp': ['clang', 'gcc'],
\}

" Use absolute path to your include/ from the project root
let s:project_include = getcwd() . '/include'
let g:ale_cpp_clang_options = '-std=c++23 -Wall -I' . s:project_include
let g:ale_cpp_gcc_options   = '-std=c++23 -Wall -I' . s:project_include
