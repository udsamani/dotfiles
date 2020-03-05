" Habit
let mapleader = ","
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Use NerdTree for file browsing.
Plug 'scrooloose/nerdtree'
nnoremap <leader><space> :nohlsearch<cr>

" Move to and from Tmux Panes
Plug 'christoomey/vim-tmux-navigator'

" Syntax for Languages
Plug 'keith/swift.vim'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'uarun/vim-protobuf'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colors!
Plug 'tomasr/molokai'
Plug 'ciaranm/inkpot'
Plug 'rafi/awesome-vim-colorschemes'
" Auto close parens, braces, etc
Plug 'jiangmiao/auto-pairs'

"Nerd commentor
Plug 'scrooloose/nerdcommenter'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Git Gutter to show git stuff
Plug 'airblade/vim-gitgutter'

" Highlight Yank
Plug 'machakann/vim-highlightedyank'

"Tags
Plug 'majutsushi/tagbar'
" {{
        nnoremap <leader>s :TagbarToggle<CR>
" }}

" Git integration glore
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'iCyMind/NeoSolarized'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{
      let g:fzf_nvim_statusline = 0 " disable statusline overwriting
      let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "!*{.cllass}" '
      nnoremap <silent> <leader><space> :Files<CR>
      nnoremap <silent> <leader>a :Buffers<CR>
      nnoremap <silent> <leader>A :Windows<CR>
      nnoremap <silent> <leader>; :BLines<CR>
      nnoremap <silent> <leader>o :BTags<CR>
      nnoremap <silent> <leader>O :Tags<CR>
      nnoremap <silent> <leader>? :History<CR>
      nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
      nnoremap <silent> <leader>. :AgIn 

      nnoremap <silent> K :call SearchWordWithAg()<CR>
      vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
      nnoremap <silent> <leader>gl :Commits<CR>
      nnoremap <silent> <leader>ga :BCommits<CR>
      nnoremap <silent> <leader>ft :Filetypes<CR>

      imap <C-x><C-f> <plug>(fzf-complete-file-ag)
      imap <C-x><C-l> <plug>(fzf-complete-line)

      function! SearchWordWithAg()
        execute 'Ag' expand('<cword>')
      endfunction

      function! SearchVisualSelectionWithAg() range
        let old_reg = getreg('"')
        let old_regtype = getregtype('"')
        let old_clipboard = &clipboard
        set clipboard&
        normal! ""gvy
        let selection = getreg('"')
        call setreg('"', old_reg, old_regtype)
        let &clipboard = old_clipboard
        execute 'Ag' selection
      endfunction

      function! SearchWithAgInDirectory(...)
        call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
      endfunction
      command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}
" Vim Rooter
Plug 'airblade/vim-rooter'
" Better than grep
Plug 'mileszs/ack.vim'
" Autocomplete project functions
Plug 'artur-shaik/vim-javacomplete2'

" Language protocol server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Update  & runtimepath and initialized plugin system
" Automatically executes `filetype plugin indent` on and `syntax enable`.
call plug#end()

"==================================================PLUGIN SETTINGS====================================================================================================
"Color Scheme
set background=dark
colorscheme jellybeans
set termguicolors
hi Normal guibg=NONE ctermbg=NONE

" No extra spaces after opening and before closing symbol
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0
" Settin python path
let g:python3_host_prog ='/usr/local/bin/python3'
"==================================================BUILT IN SETTERS====================================================================================
" Display hidden characters.
set list
set listchars=tab:▸\ ,eol:¬

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" In many terminal emulators the mouse works fine, thus enable it.
set mouse=a
" Highlight the line the cursor is on.
set cursorline
set ruler

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Tab settings.
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
" Undo function after reopening.
set autoindent     " Always set autoindenting on
set undofile       " Undo function after reopening.
set undodir=/tmp

" OS X clipboard sharing.
set clipboard=unnamed

" Accelerated scorlling.
set scrolljump=-15

" Handle long lines correctly
set colorcolumn=100
set textwidth=100
nnoremap <leader>c :call ToggleColumnWidth()<cr>

	" Function to toggle between column widths.
	let g:wide_column = 1
	function! ToggleColumnWidth()
		if g:wide_column
			set textwidth=80
			set colorcolumn=80
			let g:wide_column = 0
		else
			set textwidth=100
			set colorcolumn=100
			let g:wide_column = 1
		endif
	endfunction


" Formatting options. See help for more info.
set formatoptions=jqrn1
" =================================================MAPPINGS==============================================================================
" Toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>
" Fix whitespace
nnoremap <leader>f :StripWhitespace<cr>

" Disabling arrow keys and esc to learn better vim.
inoremap <Esc> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Replace <Esc> with C-c
inoremap <F1> <Esc>
inoremap <C-c> <Esc>
nnoremap <C-c> :w<cr>

" Better vertical and horizontal movement for wrapped lines.
nnoremap j gj
nnoremap k gk

" Sort lines in alphabetical order
vnoremap <leader>s :'<, '>!sort -f<cr>

" Fuzzy Finder shortcut.
nnoremap <C-p> :FZF<cr>

" Ack Shortucut
if executable('rg')
	let g:ackprg = '/usr/local/bin/rg --vimgrep'
	nnoremap <leader>r :Ack! 
endif

" Toggle quickfix window.
nnoremap <leader><leader> :call ToggleQuickFix()<cr>
function! ToggleQuickFix()
	for buffer in tabpagebuflist()
		if bufname(buffer) == ''
			cclose
			return
		endif
	endfor
	copen
endfunction

" Show git status.
nnoremap <leader>W :Gstatus<cr>

" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" When <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the meny and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Suppress the annoying 'match x of y' 'The only match' and 'Pattern not
" found' messges.
set shortmess+=c
if executable('java') && filereadable(expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.600.v20191014-2022.jar'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.600.v20191014-2022.jar'),
        \     '-configuration',
        \     expand('~/lsp/eclipse.jdt.ls/config_mac'),
        \     '-data',
        \     getcwd()
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif
autocmd FileType java setlocal omnifunc=javacomplete#Complete
