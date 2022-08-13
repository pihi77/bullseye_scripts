clear
RETVAL=""
HEADER="PIHI"
ROOT_DIR=$(pwd)
# colors configuration

# COLOR1 - higlight text color
COLOR1='\033[32m\033[1m'
NC='\033[0m' # No Color

# end colors configuration
stringify() {
    declare -p $1
}

unstringify() {
    local cmd="declare"
    [ -n "$3" ] && cmd="$3"
    # This RE pattern extracts 2 things:
    #     1: the array type, should be "-a" or "-A"
    #     2: stringified contents of the array 
    # and skips "declare" and the original variable name.
    local declareRE='^declare ([^ ]+) [^=]+=(.*)$'
    if [[ "$2" =~ $declareRE ]]
    then
        printf '%s %s %s=%s\n' "$cmd" "${BASH_REMATCH[1]}" "$1" "${BASH_REMATCH[2]}"
    else
        echo "*** unstringify failed, invalid stringified array:" 1>&2
        printf '%s\n' "$2" 1>&2
        return 1
    fi
}