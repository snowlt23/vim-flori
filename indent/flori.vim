
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nolisp
setlocal autoindent
setlocal indentexpr=FloriIndent()
setlocal indentkeys+=<:>,0=},0=)

if exists("*FloriIndent")
  finish
endif

function! FloriIndent()
  let pnum = prevnoblank(v:lnum - 1)
  if pnum == 0
    return 0
  endif
  let line = getline(v:lnum)
  let pline = getline(pnum)
  let ind = indent(pnum)
  if pline =~ '{\s*$'
    let ind = ind + &sw
  elseif pline =~ '(\s*$'
    let ind = ind + &sw
  endif
  if line =~ '}\s*$'
    let ind = ind - &sw
  elseif line =~ ')\s*$'
    let ind = ind - &sw
  endif
  return ind
endfunction

