"========================================
" File: citre-vim.vim
" Description:
" This is a vim version of citre which is a ctags front-end for Emacs
" editor.
"========================================
let s:CmdNamesCtags = ["GenerateCtags"]

function! s:InvokeCtags(tag_name, langs, exclude_dirs, searching_dir)
    let excludes = []
    for exclude_dir in split(trim(a:exclude_dirs), ",")
        let tmp = "--exclude=" . trim(exclude_dir)
        call add(excludes, tmp)
    endfor
    let excludes = join(excludes)
    let cmd = printf(":!ctags -R -o %s
                \ --languages=%s
                \ %s
                \ --kinds-all='\*' --fields='\*' --extras='\*'
                \ %s", a:tag_name, a:langs, excludes, a:searching_dir)
    exec ":silent " . cmd
    redraw!
    call s:SaveCtagsCmd(cmd, a:tag_name)
endfunction

function! s:GenerateCtags()
    call inputsave()
    let tag_name = input("Tag name: ", "tags")
    let langs = input("Choose languages: ", "all")
    let exclude_dirs = input("Exclude directories: ", ".git, build")
    let searching_dir = input("Tags root: ", expand("%:p:h"))
    call inputrestore()
    call s:InvokeCtags(tag_name, langs, exclude_dirs, searching_dir)
endfunction

function s:SaveCtagsCmd(cmd, tags_file)
    let _cmd = a:cmd[2:]
    let _cmd = substitute(_cmd, " ", "|", "g")
    let metainfo = "!_CITRE_CMD	" . _cmd . "	/command line to generate this tags file/;\""
    let ori_tags = readfile(a:tags_file)
    let new_tags = insert(ori_tags, metainfo, 0)
    call writefile(new_tags, a:tags_file, "s")
    " echom metainfo
endfunction

function s:UpdateThisCtags()
    echom "Not implement yet"
endfunction

function s:CmdNamesCtags(...)
    return sort(filter(s:CmdNamesCtags, 'stridx(v:val, a:1) == 0'))
endfunction

command! -nargs=* -complete=customlist,s:CmdNamesCtags GenerateCtags call s:GenerateCtags()
