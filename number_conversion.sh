#! /bin/bash
number=$1
if [[ "$number" -ge 100000 ]]; then
    echo "Number inputed exceeds bounds of program"
    exit 1
fi

func_binary(){
    if [[ "$1" -lt 2 ]]; then
        echo -n "$1"
    else
        echo -n $(func_binary $(( $1 / 2)))"$(( $1 % 2))"
    fi
}

func_hex(){
    if [[ "$1" -lt 16 ]]; then
        if [[ "$1" -eq 10 ]]; then
            echo -n "A"
        elif [[ "$1" -eq 11 ]]; then
            echo -n "B"
        elif [[ "$1" -eq 12 ]]; then
            echo -n "C"
        elif [[ "$1" -eq 13 ]]; then
            echo -n "D"
        elif [[ "$1" -eq 14 ]]; then
            echo -n "E"
        elif [[ "$1" -eq 15 ]]; then
            echo -n "F"
        else
            echo -n "$1"
        fi
    else
        if [[ "$1 % 16" -eq 10 ]]; then
            echo -n "$(func_hex $(( $1 / 16 )))A"
        elif [[ "$1 % 16" -eq 11 ]]; then
            echo -n "$(func_hex $(( $1 / 16 )))B"
        elif [[ "$1 % 16" -eq 12 ]]; then
            echo -n "$(func_hex $(( $1 / 16 )))C"
        elif [[ "$1 % 16" -eq 13 ]]; then
            echo -n "$(func_hex $(( $1 / 16 )))D"
        elif [[ "$1 % 16" -eq 14 ]]; then
            echo -n "$(func_hex $(( $1 / 16 )))E"
        elif [[ "$1 % 16" -eq 15 ]]; then
            echo -n "$(func_hex $(( $1 / 16 )))F"
        else
            echo -n "$(func_hex $(( $1 / 16 )))$(( $1 % 16 ))"
        fi
    fi
}

binary=$(func_binary $number)
hex=$(func_hex $number)
echo "Binary: $binary" > conversion_result.txt
echo "Hex: $hex" >> conversion_result.txt
