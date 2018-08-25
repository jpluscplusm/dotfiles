rename () 
{ 
    local regex=$1;
    shift;
    for file in "$@";
    do
        mv -i "$file" "$(echo $file | sed "$regex")";
    done
}
