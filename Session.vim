let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/slides/vcPres
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +757 slides.md
badd +8 components/IFrame.vue
badd +1 components/Counter.vue
badd +11 .eslint.js
badd +1 outline.md
argglobal
%argdel
edit slides.md
argglobal
balt outline.md
setlocal fdm=expr
setlocal fde=v:lua.require'lazyvim.util'.ui.foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
19
normal! zo
54
normal! zo
72
normal! zo
100
normal! zo
138
normal! zo
147
normal! zo
148
normal! zo
177
normal! zo
178
normal! zo
204
normal! zo
300
normal! zo
309
normal! zo
313
normal! zo
314
normal! zo
316
normal! zo
321
normal! zo
323
normal! zo
328
normal! zo
330
normal! zo
384
normal! zo
393
normal! zo
397
normal! zo
399
normal! zo
422
normal! zo
436
normal! zo
437
normal! zo
498
normal! zo
573
normal! zo
575
normal! zo
576
normal! zo
578
normal! zo
602
normal! zo
604
normal! zo
628
normal! zo
633
normal! zo
634
normal! zo
636
normal! zo
637
normal! zo
643
normal! zo
645
normal! zo
646
normal! zo
667
normal! zo
671
normal! zo
672
normal! zo
674
normal! zo
681
normal! zo
683
normal! zo
700
normal! zo
706
normal! zo
725
normal! zo
734
normal! zo
752
normal! zo
753
normal! zo
let s:l = 757 - ((28 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 757
normal! 0105|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
