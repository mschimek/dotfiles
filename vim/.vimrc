call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-clang'
Plug 'neovim/nvim-lspconfig'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'mattn/calendar-vim'
call plug#end()

set nocompatible
:let mapleader = ","

" nvim-lspconfig
nnoremap <silent> <leader>lD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>la    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>lh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>li    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>ls    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>l0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>lw    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>lf    <cmd>lua vim.lsp.buf.formatting()<CR>
" vimux
nnoremap <leader>vp :VimuxPromptCommand <Cr>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
let g:deoplete#sources#clang#std#cpp = 'c++17'
let g:deoplete#sources#clang#sort_algo = 'priority'
" papercolor-theme
colorscheme PaperColor
set background=dark
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }
" git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gg :Gpull<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
" vimwiki
filetype plugin on
let g:vimwiki_list = [{'path': '~/vimwiki'}]
let g:vimwiki_text_ignore_newline = 0
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()
syntax on
set completeopt=menuone,preview,longest
set pumheight=10
set splitbelow
set splitright
set autoread
set signcolumn=number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set number relativenumber 

" KeyBindings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>q  :q<esc>
inoremap <leader>q  :q<esc>
inoremap jk <esc>
nnoremap <leader>w <esc>:w<cr>
inoremap <leader>o <esc>o
nnoremap <leader>file  :echo expand('%:p')<CR>
nnoremap <leader>p  viwpviwy

let g:latex_view_general_viewer="zathura"
let g:vimtex_view_method="zathura"
nnoremap <leader>ll :VimtexCompile<CR>
nnoremap <leader>lv :VimtexView<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

lua << EOF
require'nvim_lsp'.clangd.setup{}
EOF
