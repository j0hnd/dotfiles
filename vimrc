set nocompatible              " be iMproved, required
filetype off                  " required

" =====================
" Plugins
" =====================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'

" Bundle 'edkolev/tmuxline.vim'

" Vim airline theme
Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" FZF
Plugin 'junegunn/fzf'
" Plugin 'junegunn/fzf.vim'
Plugin 'qen/fzf.vim'

Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'

Plugin 'Yggdroot/indentLine'

" let g:indentLine_enabled = 1

" Vim
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
let g:indentLine_color_term = 237

" GVim
" let g:indentLine_color_gui = '#A4E57E'

" none X terminal
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#000000'

let g:indentLine_char = '¦'

Plugin 'slim-template/vim-slim.git'

Plugin 'tpope/vim-haml'

Plugin 'airblade/vim-gitgutter'
" let g:gitgutter_sign_column_always = 1

Plugin 'hail2u/vim-css3-syntax'

Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-rails'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
" enable line numbers
let NERDTreeShowLineNumbers=1

Plugin 'chr4/nginx.vim'
au BufRead,BufNewFile *nginx/*.conf set ft=nginx

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'
set nofoldenable
let g:vim_markdown_conceal = 0

Plugin 'scrooloose/nerdcommenter'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" disable default mapping https://github.com/scrooloose/nerdcommenter/blob/master/plugin/NERD_commenter.vim#L3009
let g:NERDCreateDefaultMappings = 0

Plugin 'tpope/vim-surround'
let g:surround_no_insert_mappings = 0
" https://github.com/tpope/vim-surround/issues/117#issuecomment-272007689
set timeout timeoutlen=3000 ttimeoutlen=10

" NOT SURE IF I SHOULD ENABLE THIS,
" doing so would add more plugin per language
" Plugin 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Plugin 'jiangmiao/auto-pairs'
" http://vimawesome.com/plugin/auto-pairs-gentle
" Plugin 'vim-scripts/auto-pairs-gentle'
" let g:AutoPairsUseInsertedCount = 1

Plugin 'wincent/scalpel'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" =====================
" Settings
" =====================

syntax on
filetype plugin indent on    " required

set backspace=indent,eol,start
set nobackup                    " do not keep a backup file, use versions instead
set history=1000                " keep 50 lines of command line history
set encoding=utf-8
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmode
set incsearch                   " do incremental searching
set ruler
set relativenumber
set number
set mouse=a

set autoindent                  " always set autoindenting on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

set hlsearch
set clipboard=unnamed
set cmdheight=1
set laststatus=2
" set cursorline
" set term=xterm
set nowrap
set confirm

" Split settings
set splitbelow
set splitright

set swapfile
set dir=~/.vim/tmp
set hidden

set novisualbell
set noerrorbells

" yank is also copied to clipboard:  https://stackoverflow.com/a/9166988/3288608
set guioptions+=a

" Explorer setup
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" you need to run fg after to return to vim
set shellcmdflag=-ic

" autocmd ColorScheme * highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
colorscheme Tomorrow-Night-Eighties
highlight LineNr term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNR term=NONE cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE

set scrolloff=3

" redifine keyword definition, include dash
" https://woss.name/articles/vim-iskeyword/
set iskeyword=@,!,?,48-57,_,192-255,-

" =====================
" Scripts
" =====================

" let files = split(globpath('.', '**'), '\n')
" fzf#run(s:wrap(a:name, , bang))
" fzf#vim#file_lists('filelist', ['hello'])
" function! Helloworld(name, list, ...)
  " let [query, args] = (a:0 && type(a:1) == type('')) ? [a:1, a:000[1:]] : ['', a:000]
  " echo a:name
  " echo a:list
  " echo query
  " echo args
" endfunction


" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

" convert all tab to spaces on save
autocmd BufWritePre * :retab

" confirm quit
" https://stackoverflow.com/a/32239265/3288608
function! ConfirmQuit(writeFile)
  if (a:writeFile)
    if (expand('%:t')=="")
      echo "Can't save a file with no name."
      return
    endif
    :write
  endif

  if (winnr('$')==1 && tabpagenr('$')==1)
    if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
      :quit
    endif
  else
    :quit
  endif
endfu
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'call ConfirmQuit(0)' : 'q')<CR>

function! ConfirmDelete()
  if (confirm("Confirm to delete the file ".expand('%')."?", "&Yes\n&No", 2)==1)
    :call delete(expand('%')) | bdelete!
  endif
endfu
" delete file with confirmation
" to produce ^? special character, type ctrl-v first then the special character delete
nnoremap <leader> :call ConfirmDelete()<CR>

" save with auto create directory
" https://stackoverflow.com/a/4294176/3288608
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" ruby auto complete
" https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
function! CloseRubyEndToken()
  let current_line = getline( '.' )
  let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
  let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
  let stuff_without_do_too = '\s*\(if\|unless\|begin\|case\)'
  let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

  if match(current_line, braces_at_end) <= virtcol('.') &&  match(current_line, braces_at_end) > 0
    return "\<CR>}\<C-O>O"
  elseif match(current_line, stuff_without_do_too) >= 0
    return "\<CR>end\<C-O>O"
  elseif match(current_line, stuff_without_do) >= 0
    return "\<CR>end\<C-O>O"
  elseif match(current_line, with_do) >= 0
    return "\<CR>end\<C-O>O"
  else
    return "\<CR>"
  endif
endfunction
autocmd FileType ruby imap <buffer> <CR> <C-R>=CloseRubyEndToken()<CR>

" https://stackoverflow.com/a/6271254/3288608
function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" search files of current selected text
" https://github.com/junegunn/fzf/wiki/Examples-(vim)#using-fzfwrap-function
function! FileSearchRange() range
  call fzf#run( fzf#wrap( { 'options': '-q' . s:get_visual_selection() } ) )
endfunction
" xnoremap <leader>f <esc>:'<,'>call FileSearchRange()<CR>
vnoremap <leader>f :call FileSearchRange()<CR>

" code search current buffer or all open buffer of currently selected text
function! CodeSearchRange(buffer_lines) range
  if (a:buffer_lines)
    call fzf#vim#buffer_lines( s:get_visual_selection() )
  else
    call fzf#vim#lines( s:get_visual_selection() )
  endif
endfunction
" code search selected text on current file
vnoremap <space><space> :call CodeSearchRange(1)<CR>

" code search to all files limited to the current buffer file extension,
" search query is the selected text
function! CodeSearchAgRange(visual) range
  let needle = ''

  if a:visual == '0'
    call inputsave()
    let needle = input('Search: ',  expand('<cword>'), 'var')
    call inputrestore()
  else
    let needle = s:get_visual_selection()
  endif

  if needle != ''
    call fzf#vim#grep('ag --nogroup --column -G "\.('. expand('%:e') .')$" --color '.needle, 1)
  endif

endfunction
" code search highlighted text, all project files with similar extensions
vnoremap <leader>C :call CodeSearchAgRange(1)<CR>
" code search all project files with similar extensions
nnoremap <leader>C :call CodeSearchAgRange(0)<CR>

function! CodeReplaceSelection(range, target) range
  let target = a:target

  if a:target == 'current_word'
    let target = expand('<cword>')
  endif

  if a:target == 'selected_word'
    let target = s:get_visual_selection()
  endif

  if target == ''
    call inputsave()
    let target = input('Find: ')
    call inputrestore()
  endif

  if target == ''
    return ''
  endif

  call inputsave()
  let replace = input('Replace '.target.' : ')
  call inputrestore()
  if replace == ''
    return ''
  endif

  if a:range == 1
    execute ":'<,'>Scalpel/\\\v<".target.'>/'.replace."/"
  else
    execute ":Scalpel/\\\v<".target.'>/'.replace."/"
  endif
endfunction
vnoremap R :call CodeReplaceSelection(1, '')<CR>
nnoremap R :call CodeReplaceSelection(0, '')<CR>
nnoremap <leader>R :call CodeReplaceSelection(0, 'current_word')<CR>
vnoremap <leader>R :call CodeReplaceSelection(0, 'selected_word')<CR>


" function! s:format_buffer(b)
"   let name = bufname(a:b)
"   let name = empty(name) ? '[No Name]' : fnamemodify(name, ":~:.")
"   let flag = a:b == bufnr('')  ? s:blue('%', 'Conditional') :
"           \ (a:b == bufnr('#') ? s:magenta('#', 'Special') : ' ')
"   let modified = getbufvar(a:b, '&modified') ? s:red(' [+]', 'Exception') : ''
"   let readonly = getbufvar(a:b, '&modifiable') ? '' : s:green(' [RO]', 'Constant')
"   let extra = join(filter([modified, readonly], '!empty(v:val)'), '')
"   return s:strip(printf("[%s] %s\t%s\t%s", s:yellow(a:b, 'Number'), flag, name, extra))
" endfunction
" function! s:sort_buffers(...)
"   let [b1, b2] = map(copy(a:000), 'get(g:fzf#vim#buffers, v:val, v:val)')
"   " Using minus between a float and a number in a sort function causes an error
"   return b1 > b2 ? 1 : -1
" endfunction
" function! Helloworld(...)
"   let buflisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
"   let bufs = map(sort(buflisted, 's:sort_buffers'), 's:format_buffer(v:val)')
"
"   " let [query, args] = (a:0 && type(a:1) == type('')) ?
"         " \ [a:1, a:000[1:]] : ['', a:000]
"
"   echo bufs
"   " return s:fzf('buffers', {
"   " \ 'source':  reverse(bufs),
"   " \ 'sink*':   s:function('s:bufopen'),
"   " \ 'options': '+m -x --tiebreak=index --header-lines=1 --ansi -d "\t" -n 2,1..2 --prompt="Buf> "'.s:q(query)
"   " \}, args)
" endfunction

" =====================
" Function Command
" =====================

function! SaveAs()
  call inputsave()
  let file = input("Save as file: ".getcwd()."/", expand('%:h').'/', "dir")
  call inputrestore()
  if file != ''
    execute ':w '.file
    execute ':e '.file
  endif
endfunction
command! SaveAs call SaveAs()
nnoremap <F2> :silent call SaveAs()<CR>

function! RenameFile()
  let current_file = expand('%')
  call inputsave()
  let file = input("Rename file as: ".getcwd()."/", current_file, "dir")
  call inputrestore()
  if file != ''
    execute ':w '.file
    call delete(current_file) | bdelete!
    execute ':e '.file
  endif
endfunction
command! RenameFile call RenameFile()
nnoremap <F3> :silent call RenameFile()<CR>

function! OpenDirectory()
  call inputsave()
  let dir = input("Open Directory: ".getcwd()."/", expand('%:h'), "dir")
  call inputrestore()
  call system("open '". dir ."'")
endfunction
" open of current working directory
nnoremap <F4> :silent call OpenDirectory()<CR>

" scalpel find and replace word
nmap <F5> <Plug>(Scalpel)

set pastetoggle=<F6>

" Copy full path filename with path to clipboard
nmap <F7> :let @*=expand("%:p")<CR>

" =====================
" Keyboard Setup
" =====================

" reload vimrc
nnoremap <Leader>r :so $MYVIMRC<CR>:nohlsearch<CR>

" --------------------
" Tab shortcut to operate on files
" --------------------

" buffer navigation uses Tab
nnoremap <Tab>h :bprev!<CR>
nnoremap <Tab>l :bnext!<CR>
nnoremap <Tab><Tab> :b#<CR>
nnoremap <Tab>q :bd!<CR>

" open files
nnoremap <Tab>o :edit <C-R>=fnamemodify(@%, ':h')<CR>/
nnoremap <Tab>O :edit <space>

" search files to all open buffers, and current files in the open buffer directory
nnoremap <Tab>f :call fzf#vim#filesuggest()<CR>

" - current working direcotry, the global search
" nnoremap <Tab>d :Files<CR>

" - find files in cwd that is similar to the file extension for the current open buffer
nnoremap <Tab>d :call fzf#vim#files('', {'down': '40%', 'source': 'find . -type f -name "*.'.expand('%:e').'" \| sed s/^..//' })<CR>

" - models
nnoremap <Tab>m :call fzf#vim#files('app/models')<CR>

" - views
nnoremap <Tab>v :call fzf#vim#files('app/views')<CR>

" - controllers
nnoremap <Tab>c :call fzf#vim#files('app/controllers')<CR>

" - app
nnoremap <Tab>a :call fzf#vim#files('app')<CR>

" code search selected text on all buffers
vnoremap <Tab><space> :call CodeSearchRange(0)<CR>

" code search in all opened files
nnoremap <Tab><space> :Lines<CR>

" --------------------
" Tab w window navigation stuff
" --------------------

" window navigation uses Tab w
nnoremap <Tab>wv :vsplit<CR>

" cycle to window
nnoremap <Tab>ww <C-w>w<CR>

" close window
nnoremap <Tab>wq :silent call ConfirmQuit(0)<CR>

" next window
nnoremap <Tab>wl <C-w>l<CR>

" prev window
nnoremap <Tab>wh <C-w>h<CR>

" --------------------


" run a command
nnoremap <Leader><CR> :!

" https://stackoverflow.com/a/6923282/3288608
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" move next word, on insert mode type ctrl-v alt-f
cnoremap f <s-right>
" move previous word, on insert mode type ctrl-v alt-b
cnoremap b <s-left>

nnoremap { 10kzz
nnoremap <C-k> 10kzz
nnoremap } 10jzz
nnoremap <C-j> 10jzz

nnoremap <Leader>e :edit <C-R>=fnamemodify(@%, ':h')<CR>/
nnoremap <Leader>E :edit <space>

" Custom fzf mappings

" code search on current working directory
nnoremap <Leader>a :Ag<space>

nnoremap <Leader>g :GFiles<CR>

nnoremap <Leader>h :History<CR>

" nnoremap <Leader>k :Ag <C-R><C-W><CR>

" search files

" " - current working direcotry, the global search
nnoremap <Leader>f :Files<CR>

" " - find files in cwd that is similar to the file extension for the current open buffer
" nnoremap <Leader>Ff :call fzf#vim#files('', {'down': '40%', 'source': 'find . -type f -name "*.'.expand('%:e').'" \| sed s/^..//' })<CR>

" " - the directory of the current opened file
" nnoremap <Leader>ff :call fzf#vim#files(expand('%:h'))<CR>

" " - models
" nnoremap <Leader>fm :call fzf#vim#files('app/models')<CR>

" " - views
" nnoremap <Leader>fv :call fzf#vim#files('app/views')<CR>

" " - controllers
" nnoremap <Leader>fc :call fzf#vim#files('app/controllers')<CR>

" " - app
" nnoremap <Leader>fa :call fzf#vim#files('app')<CR>

" code search in current open file
nnoremap <Leader>c :BLines<CR>
nnoremap <space><space> :BLines<CR>

" Movement in insert mode
inoremap <C-h> <c-o>h
inoremap <C-l> <c-o>l
inoremap <C-j> <c-o>j
inoremap <C-k> <c-o>k
" move next word, on insert mode type ctrl-v alt-f
inoremap f <s-right>
" move previous word, on insert mode type ctrl-v alt-b
inoremap b <s-left>

" search forward to a character, in edit mode
inoremap <C-f>l <C-o>f
" search backward to a character, in edit mode
inoremap <C-f>h <C-o>F

" center current active line in edit mode
inoremap <C-z> <C-o>zz

" auto file completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" remap omnicomplete to ctrl-space
" inoremap <c-space><c-space> <c-x><c-o><c-p>
" inoremap <c-@><c-@> <c-x><c-o><c-p>
set omnifunc=syntaxcomplete#Complete

" code formating, using Tabularize, must have an existing selected text
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
vnoremap F<space> :Tab/
vnoremap F> :Tab/=><CR>
vnoremap F= :Tab/=<CR>
vnoremap F: :Tab/:\zs<CR>

" surround selected text
" https://www.reddit.com/r/vim/comments/25acm8/dear_amazing_vim_people_which_plugintrick_made/chftfel/?utm_content=permalink&utm_medium=front&utm_source=reddit&utm_name=vim
" ` backtick
" vnoremap <Leader><esc>`>a"<esc>`<i"<esc>
" vnoremap <Leader>' <esc>`>a'<esc>`<i'<esc>
" vnoremap <Leader>( <esc>`>a)<esc>`<i(<esc>
" vnoremap <Leader>[ <esc>`>a]<esc>`<i[<esc>
" vnoremap <Leader>{ <esc>`>a}<esc>`<i{<esc>

" shortcut for nerd comment
nnoremap <silent> <leader><leader> :call NERDComment('n', 'Toggle')<CR>
vnoremap <silent> <leader><leader> :call NERDComment('v', 'Toggle')<CR>

" unbind shift-k, its annoying
map <S-k> <Nop>

" save file
noremap <leader>w :w<CR>

