" Statusline
set laststatus=2
set noshowmode

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={ 'n' : 'Normal ', 'no' : 'N·Operator Pending ', 'v' : 'Visual ', 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select ', 'S': 'S·Line ', '^S' : 'S·Block ', 'i' : 'Insert ', 'R' : 'Replace ', 'Rv' : 'V·Replace ', 'c' : 'Command ', 'cv' : 'Vim Ex ', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ', 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}


" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

set statusline=
set statusline+=%1*\ %{ModeCurrent()} " Show Current mode
set statusline+=%4*\ %l:%v\ %* " Line : Column
set statusline+=%3*\ %m " Modified indicator
set statusline+=%3*\ %F " Full file path
set statusline+=%3*\ %= " Seperator
set statusline+=%1*\ %p%%\ %*" Percentage through file

hi User1 ctermbg=green  ctermfg=0
hi User2 ctermbg=0      ctermfg=green
hi User3 ctermbg=0      ctermfg=white
hi User4 ctermbg=grey   ctermfg=0

