syntax on
"set laststatus=2
set nocompatible
set backspace=2  "Permite borrar con backspace
set mouse=a
set nu
set ruler
set relativenumber
set nowrap
set encoding=UTF-8
set showcmd
set scrolloff=4
set updatetime=300
set timeoutlen=200
set background=dark
set noswapfile
set nobackup
set nowb
set statusline+=\ %#PmenuThumb#

"Idents
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys-=:

"Config visual
"set guioptions=Ace "Remueve toda la parte grafica de ajustes y el scrollbar
set guioptions-=r
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar



" Brackets Highlighting Colors
hi MatchParen cterm=none ctermbg=black ctermfg=white

" Errors/BadSpellings Higlighing Colors
:highlight clear SpellBad

" CUSOR SETUP
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=5\x7"
let &t_EI = "\<Esc>]50;CursorShape=6\x7"

let g:mapleader = "\<space> "
packloadall


" VIM-GO CONFIGS
" Syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" Enable auto formatting on saving
let g:go_fmt_autosave = 1
" Run `goimports` on your current file on every save
let g:go_fmt_command = "goimports"
" Status line types/signatures
let g:go_auto_type_info = 1

" Go Add Tags
let g:go_addtags_transform = 'camelcase'
noremap gat :GoAddTags<cr>

let g:auto_save = 1


" NERDTREE CONFIGS
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
endif


" PLUGINS
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'habamax/vim-polar'
Plug 'franbach/miramare'
Plug '907th/vim-auto-save'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
call plug#end()


set termguicolors
"colorscheme polar
colorscheme miramare 

let g:coc_global_extensions = ['coc-docker', 'coc-yaml', 'coc-pyright', 'coc-json', 'coc-tsserver', 'coc-clangd', 'coc-sh', 'coc-markdownlint', 'coc-go', 'coc-emmet']

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
nmap <F5> :GoRun<CR>


" Auto closing pairs
":so ~/vimfiles/autopair.vim
