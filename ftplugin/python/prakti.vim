"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ___________  _____
"  \______    \/  __ \      -- Prakti's .vimrc --
"    \_____   /  /_/ /
"       \____/  ___.'
"           /__/
"       
" (c) by Prakti - http://www.prakti.org
"
" Python section
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shiftwidth=4

" DeleteTrailing Whitespaces if Python Buffer is read
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"Run the current buffer in python - ie. on leader+space
map <buffer> <leader><space> :w!<cr>:!python %<cr>

" set the python completion omnifunc
setlocal omnifunc=pysmell#Complete

"Set some bindings up for 'compile' of python
"set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"Run in the Python interpreter
function! Python_Eval_VSplit() range
  let src = tempname()
  let dst = tempname()
  execute ": " . a:firstline . "," . a:lastline . "w " . src
  execute ":!python " . src . " > " . dst
  execute ":pedit! " . dst
endfunction
vmap <F7> :call Python_Eval_VSplit()<cr>
