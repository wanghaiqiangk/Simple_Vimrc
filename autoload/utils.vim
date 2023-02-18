"========================================
" File: utils.vim
"========================================
function! utils#GetSysVersion()
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        let sys_version=substitute(system('sw_vers -productVersion'), '\n', '', '')
    elseif os == 'Linux'
        let sys_version=substitute(system('lsb_release -rs'), '\n', '', '')
    endif
    return sys_version
endfunction
