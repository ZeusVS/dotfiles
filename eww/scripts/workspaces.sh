 #!/bin/bash

workspaces() {
    workspaces=(1 2 3 4 5 6 7 8 9)
    
    for val in "${workspaces[@]}"
    do
        # Check if occupied
        o=($(i3-msg -t get_workspaces | sed 's/},{/},\n{/g' | grep "\"name\":\"$val"))

        # Check if focused
        f=($(i3-msg -t get_workspaces | sed 's/},{/},\n{/g' | grep "\"name\":\"$val" | grep "visible\":f"))

        if [ ${f} ]; then
            ic+=("")
        elif [ ${o} ]; then
            ic+=("")
        else 
            ic+=("x")
        fi

    done
    for val in "${ic[@]}"
    do
        echo $val
    done
}

workspaces
