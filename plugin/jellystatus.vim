" Statusline
set laststatus=2
set noshowmode

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={ 'n' : 'N', 'no' : 'NO', 'v' : 'V ', 'V' : 'VL ', '^V' : 'VB', 's' : 'S ', 'S': 'SL ', '^S' : 'SBk ', 'i' : 'I ', 'R' : 'R ', 'Rv' : 'VR ', 'c' : 'N ', 'cv' : 'EX ', 'ce' : 'EX ', 'r' : 'P ', 'rm' : 'M ', 'r?' : 'CN ', '!' : 'S ', 't' : 'T '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'VB '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Set Statusline

set statusline=
set statusline+=%1*\ %{ModeCurrent()} " Show Current mode
set statusline+=%4*\ %l:%v\ %* " Line : Column
set statusline+=%3*\ %m " Modified indicator
set statusline+=%3*\ %F " Full file path
set statusline+=%3*\ %= " Seperator
set statusline+=%1*\ %p%%\ %* " Percentage through file

hi User1 ctermbg=green  ctermfg=0
hi User2 ctermbg=0      ctermfg=green
hi User3 ctermbg=0      ctermfg=white
hi User4 ctermbg=grey   ctermfg=0
