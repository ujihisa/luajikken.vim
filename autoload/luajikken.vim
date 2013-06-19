let s:save_cpo = &cpo
set cpo&vim

let s:V = vital#of('luajikken.vim')
let s:luajikken_dir = expand('<sfile>:p:h')

function! luajikken#luacmd()
  if executable('luajit')
    return 'luajit'
  elseif executable('lua')
    return 'lua'
  elseif s:V.is_unix()
    return printf('%s/bin/lua-unix', s:luajikken_dir)
  elseif s:V.is_mac()
    return printf('%s/bin/lua-mac', s:luajikken_dir)
  elseif s:V.is_win()
    return printf('%s/bin/lua-win.exe', s:luajikken_dir)
  else
    echoerr 'lua command not found'
    return ''
  endif
endfunction

function! luajikken#lua(str)
  return s:V.system(luajikken#luacmd(), a:str)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
