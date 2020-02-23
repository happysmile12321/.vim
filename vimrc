syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set relativenumber
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set scrolloff=18
noremap K 5k
noremap J 5j
noremap L 30l
noremap H 30h
map s <nop>
map e <nop>
map S :w<CR>
map Q :q<CR>
"Source vimrc
map R :source ~/.vim/vimrc<CR>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map e :e  
let mapleader=" "
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :tabnext<CR>


"open VIM config anywhere
map <LEADER>rc :e ~/.vim/vimrc<CR>

"plug:vim-tableMod
map t :TableModeToggle<CR>
map o :q<CR>

"handle vim's paste area
set paste






" My Translate plug (Needs JDK1.8 and later~)
noremap <LEADER>n :let a=expand("<cword>")<Bar>exec'!java -jar /home/happysmile/.vim/plugged/youdaosearch.jar ' .a<CR>

call plug#begin('~/.vim/plugged')
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/gdbmgr'
"Plug 'valloric/youcompleteme'

Plug 'iamcco/markdown-preview.nvim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
call plug#end()


" set vim-table-mode
function! s:isAtStartOfLine(mapping)
	  let text_before_cursor = getline('.')[0 : col('.')-1]
	  let mapping_pattern = '\V' . escape(a:mapping, '\')
	  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
	  endfunction
	     inoreabbrev <expr> <bar><bar>
	          \ <SID>isAtStartOfLine('\|\|') ?
	          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
	     inoreabbrev <expr> __
	          \ <SID>isAtStartOfLine('__') ?
	          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


