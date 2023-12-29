#!/usr/bin/env bash

# version 1.0
# 2023-12-28

set -e

vimrc_user="$HOME/.vimrc"
vimrc_repo="$PWD/vimrc"

vim_user="$HOME/.vim"
vim_repo="$PWD"

function check_exist () {
    [ -e "$1" ]
}

function is_link () {
    [ -L "$1" ]
}

function is_link_to_file () {
    local link target

    link=$(readlink -f "$1")
    target=$(readlink -f "$2")

    [ "$link" = "$target" ]
}

function remove_link () {
    unlink "$1"
}

function make_link () {
    local src dst

    src="$1"
    dst="$2"

    ln -s "$src" "$dst"
}

function backup_file () {
    mv "$1" "$1".bak
}

function is_broken_link () {
    local -r link="$1"

    stat "$link" > /dev/null 2>&1
    local exist=$?

    if [[ $exist -eq 0 ]] ; then
        ! readlink -e "$link" > /dev/null 2>&1
    else
        return 1
    fi
}

function create_link_to_file () {
    local -r link="$1" file="$2"


    if ! check_exist "$file" ; then
        echo "Error: ${file} doesn't exist."
        exit 1
    fi

    if is_broken_link "$link" ; then
        echo "Broken link. Safely remove the link."
        remove_link "$link"
    fi

    if check_exist "$link"; then
        echo "Find ${link}."
        if is_link "$link"; then
            if is_link_to_file "$link" "$file"; then
                echo "No need to link again"
            else
                echo "A link file. Safely remove the link."
                remove_link "$link"
                echo "Make ${link} -> ${file}"
                make_link "$file" "$link"
            fi
        else
            echo "A regular file. Backup it with .bak suffix."
            backup_file "$link"
            echo "Make ${link} -> ${file}"
            make_link "$file" "$link"
        fi
    else
        echo "Make ${link} -> ${file}"
        make_link "$file" "$link"
    fi
}

function install () {
    create_link_to_file "$vimrc_user" "$vimrc_repo"
    create_link_to_file "$vim_user" "$vim_repo"
}

install
