#!/usr/bin/env bash
rename () 
{ 
    local regex=$1;
    shift;
    for file in "$@";
    do
        mv -i "$file" "$(sed "$regex"<<<"$file")";
    done
}
