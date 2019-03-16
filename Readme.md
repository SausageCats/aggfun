# aggfun

Aggfun is a vim plugin that provides the output of an aggregate function (average, maximum, minimum, sum) for the values of multiple rows selected on block visual mode.

## Setting

Here is an example of the configuration for Aggfun.

```vim
" print the results of an aggregate function on the command line
command! -range AggfunAll      echo aggfun#all()             |" print average, maximum, minimum, sum, and count
command! -range AggfunAve      echo aggfun#ave()             |" print average
command! -range AggfunMax      echo aggfun#max()             |" print maximum
command! -range AggfunMin      echo aggfun#min()             |" print minimum
command! -range AggfunSum      echo aggfun#sum()             |" print sum

" insert the results of an aggregate function after the current line
command! -range AggfunAllIns   call append(line('.'), string(aggfun#all()))
command! -range AggfunAveIns   call append(line('.'), string(aggfun#ave()))
command! -range AggfunMaxIns   call append(line('.'), string(aggfun#max()))
command! -range AggfunMinIns   call append(line('.'), string(aggfun#min()))
command! -range AggfunSumIns   call append(line('.'), string(aggfun#sum()))

command! -range AggfunEcho     call aggfun#all_echo()        |" instead of AggfunAll
command! -range AggfunIns      call aggfun#all_insert()      |" instead of AggfunAllIns
```

## Usage

For example, for the following text,
1. move the cursor to 1 of 1.2
1. type `C-v` to enter block visual mode
1. type `jjll` to select the values of 1.2, 3.4, and 5.6
1. type `:AggfunEcho<Enter>` to see the aggregate function value

```vim
1.2
3.4
5.6
```
