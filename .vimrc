set number
:highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE
set numberwidth=1
highlight CursorLine cterm=None ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
hi CursorLineNr cterm=bold ctermfg=White

set tabstop=2
set shiftwidth=2

syntax enable
colorscheme monokaiglass

:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
:map <2-MiddleMouse> <Nop>
:imap <2-MiddleMouse> <Nop>
:map <3-MiddleMouse> <Nop>
:imap <3-MiddleMouse> <Nop>
:map <4-MiddleMouse> <Nop>
:imap <4-MiddleMouse> <Nop>

if &term =~ "xterm\\|rxvt"
  " use an white cursor in insert mode
  let &t_SI = "\<Esc>]12;white\x7"
  " use a gray cursor otherwise
  let &t_EI = "\<Esc>]12;white\x7"
  silent !echo -ne "\033]112\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

"Sets the cursor to an I bar when in insert mode, unnderline when in replace
"mode and a block when in visual mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

