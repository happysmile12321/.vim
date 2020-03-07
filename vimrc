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
Plug 'suan/vim-instant-markdown'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/gdbmgr'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'iamcco/markdown-preview.nvim'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
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
"vim-plug airline theme

let g:airline_theme='simple'

"coc
"" TextEdit might fail if hidden is not set.
"set hidden
"
"" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup
"
"" Give more space for displaying messages.
"set cmdheight=2
"
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
"set updatetime=300
"
"" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c
"
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"if has('patch8.1.1068')
"  " Use `complete_info` if your (Neo)Vim version supports it.
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
"
"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Introduce function text object
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"
"" Use <TAB> for selections ranges.
"" NOTE: Requires 'textDocument/selectionRange' support from the language server.
"" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings using CoCList:
"" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" input method

"let g:input_toggle = 0
"function! Fcitx2en()
"let s:input_status = system("fcitx-remote")
"if s:input_status == 2
"let g:input_toggle = 1
"let l:a = system("fcitx-remote -c")
"endif
"endfunction
"
"function! Fcitx2zh()
"let s:input_status = system("fcitx-remote")
"if s:input_status != 2 && g:input_toggle == 1
"let l:a = system("fcitx-remote -o")
"let g:input_toggle = 0
"endif
"endfunction
"
"set timeoutlen=150
"autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()
"
