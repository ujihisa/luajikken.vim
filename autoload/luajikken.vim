let s:save_cpo = &cpo
set cpo&vim

function! luajikken#luacmd()
  if executable('lua')
    return 'lua'
  elseif s:V.is_unix()
    return 'bin/lua-unix'
  elseif s:V.is_mac()
    return 'bin/lua-mac'
  elseif s:V.is_win()
    return 'bin/lua-win.exe'
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
