
printHelp() {
	echo "<command description>"
	echo "$0 [<optional arguments>] <required arguments>"
	echo ""
	echo "-o|--output file - description"
}

# default values
outFile="defaultOutFile"

# arguments parsing
OPTIONS=ho:
LONGOPTS=help,output:

! PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTS --name "$0" -- "$@")
if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
    exit 2
fi
eval set -- "$PARSED"

while true; do
    case "$1" in
        -h|--help)
			printHelp
			exit 1
            ;;
        -o|--output)
            outFile="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

# handle non-option arguments
if [[ $# -ne 1 ]]; then
	echo "Error: Arguments required"
	echo ""
	printHelp
    exit 4
fi
