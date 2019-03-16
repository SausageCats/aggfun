"
" global functions
"
function! aggfun#ave() abort
  return s:ave(s:get_nrlist())
endfunction
function! aggfun#min() abort
  return s:min(s:get_nrlist())
endfunction
function! aggfun#max() abort
  return s:max(s:get_nrlist())
endfunction
function! aggfun#sum() abort
  return s:sum(s:get_nrlist())
endfunction
function! aggfun#all() abort
  return s:all(s:get_nrlist())
endfunction
function! aggfun#all_echo() abort
  return s:all_echo(s:get_nrlist())
endfunction
function! aggfun#all_insert() abort
  return s:all_insert(s:get_nrlist())
endfunction



"
" local functions
"

function! s:all(nrlist) abort
  let cou = len(a:nrlist)
  let [max, min, sum] = s:max_min_sum(a:nrlist)
  let ave = sum / cou
  let all = {'count':cou, 'ave':ave, 'max':max, 'min':min, 'sum':sum}
  return all
endfunction

function! s:all_echo(nrlist) abort
  let all = s:all(a:nrlist)
  echo 'count:'. all.count .'  ave:' . string(all.ave) . '  max:' . string(all.max) .'  min:' . string(all.min) . '  sum:' . string(all.sum)
endfunction

function! s:all_insert(nrlist) abort
  let all = s:all(a:nrlist)
  call append(line('.'), 'count:'. all.count .'  ave:' . string(all.ave) . '  max:' . string(all.max) .'  min:' . string(all.min) . '  sum:' . string(all.sum))
endfunction

function! s:ave(nrlist) abort
  return s:sum(a:nrlist) / len(a:nrlist)
endfunction

function! s:get_nrlist() abort
  let save_reg = @@
  silent normal! gvy
  let selected = @@
  let @@ = save_reg
"  let selected = substitute(selected, '\s\+', '', 'g')
  return split(selected, '\n')
endfunction

function! s:max(nrlist) abort
  let max = str2float(a:nrlist[0])
  for nr in a:nrlist[1:]
    let nr = str2float(nr)
    if nr > max | let max = nr | endif
  endfor
  return max
endfunction

function! s:max_min_sum(nrlist) abort
  let min = str2float(a:nrlist[0])
  let max = min
  let sum = min
  for nr in a:nrlist[1:]
    let nr = str2float(nr)
    let sum += nr
    if nr < min | let min = nr | endif
    if nr > max | let max = nr | endif
  endfor
  return [max, min, sum]
endfunction

function! s:min(nrlist) abort
  let min = str2float(a:nrlist[0])
  for nr in a:nrlist[1:]
    let nr = str2float(nr)
    if nr < min | let min = nr | endif
  endfor
  return min
endfunction

function! s:sum(nrlist) abort
  let sum = 0.0
  for nr in a:nrlist
    let sum += str2float(nr)
  endfor
  return sum
endfunction


"
" test
"
"   310
"   234.0
"   234.2
"       234
