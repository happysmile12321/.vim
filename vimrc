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
map R :source $MYVIMRC<CR>
map ; :

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
"map <LEADER>n  :term python<CR>







map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :tabnext<CR>
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>




map t :TableModeToggle<CR>
map o :q<CR>
set paste




" call python (some crazy ideas)
"map <LEADER>n sj :term python<CR>
"map <LEADER>v :term exit()<CR>
"<C-n> can escap from the visual term
"map <LEADER>n sj <down><down>:term java -jar $MYVIMPATH/youdaorun.jar<CR><C-n><LEADER>k
"map <LEADER>n sj <down><down>:term java -jar /home/happysmile/.config/nvim/plugged/youdaosearch.jar<CR>apple<C-n><CR><LEADER>k
"map <LEADER>n sj <down><down>:term python3<CR><C-n><LEADER>k
""map <LEADER>n sj <down><down>:term j j javaava ava -jar /home/happysmile/.config/nvim/plugged/youdaosearch.jar<CR>apple
" 找到怎么copy屏幕上的词
" :s/normal char/you need char
"map <LEADER>n y sj <down><down>  
"map <LEADER>n y sj <down><down> :term python3 %
"map <LEADER>n :call <SID>test()
"function! s:test()
	":term echo java -jar /home/happysmile/.config/nvim/plugged/youdaosearch.jar  <cword>
	"endfunction
noremap <LEADER>n :let a=expand("<cword>")<Bar>exec'!java -jar /home/happysmile/.config/nvim/plugged/youdaosearch.jar ' .a<CR>

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


