syntax on
execute pathogen#infect()
autocmd VimEnter * NERDTree
au VimEnter * wincmd l
set number
set cursorline
set background=dark

"set termguicolors
let g:nord_comment_brightness = 20 
let g:nord_cursor_line_number_background = 1
colorscheme nord
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let s:pairs={
            \'<': '>',
            \'{': '}',
            \'[': ']',
            \'(': ')',
            \'«': '»',
            \'„': '“',
            \'“': '”',
            \'‘': '’',
        \}
call map(copy(s:pairs), 'extend(s:pairs, {v:val : v:key}, "keep")')
function! InsertPair(left, ...)
    let rlist=reverse(map(split(a:left, '\zs'), 'get(s:pairs, v:val, v:val)'))
    let opts=get(a:000, 0, {})
    let start   = get(opts, 'start',   '')
    let lmiddle = get(opts, 'lmiddle', '')
    let rmiddle = get(opts, 'rmiddle', '')
    let end     = get(opts, 'end',     '')
    let prefix  = get(opts, 'prefix',  '')
    let start.=prefix
    let rmiddle.=prefix
    let left=start.a:left.lmiddle
    let right=rmiddle.join(rlist, '').end
    let moves=repeat("\<Left>", len(split(right, '\zs')))
    return left.right.moves
endfunction
 noremap! <expr> ,f   InsertPair('{')
 noremap! <expr> ,h   InsertPair('[')
 noremap! <expr> ,s   InsertPair('(')
 noremap! <expr> ,u   InsertPair('<')

set autoindent
set cindent
"nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <C-k> :NERDTreeToggle<CR>
"focus on file instead of NERDTree
"nmap <F8> :TagbarToggle<CR>
nmap <C-l> :TagbarToggle<CR>
let g:gitgutter_realtime = 200
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
set updatetime=100


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"command W w !sudo tee % >/dev/null
command W silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null' | edit!
set noro
let g:Powerline_symbols = 'fancy'
