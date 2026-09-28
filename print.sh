PRINTER="/dev/ttyUSB0"

TEXT="$1"

if [ -z "$1" || "$1" == '-h' ]; then
	cat <<EOF
Usage: ./print 'text' (options)
(options): Use this to change the formatting, you can do this in command-line arguments 2, 3, 4 and 5
-g) makes text larger
-s) makes text smaller
-r) aligns text to right
-l) aligns text to left
-m) aligns text to mid
-b) makes text bold
-u) underlines text
EOF
	exit 1

for ((i = 2; i < 5; i++))
do
    case "${!i}" in
    -s)
    printf '\x1d\x21\x00'
    ;;
    -g)
    printf 'x1d\x21\x22'
    ;;
	-r)
	printf '\x1b\x61\x00'
	-m)
	printf 'x1b\x61\x01'
esac
done

#case "$2" in
#	-s)
#		SIZE_START='\x1d\x21\x00'
#;;
#	-l)
#		SIZE_START='\x1d\x21\x22'
#;;
#	*)
#		SIZE_START='\x1d\x21\x11'
SIZE_SMALL='\x1d\x21\x00'

# center text
CENTER_START='\x1b\x61\x01'
CENTER_END='\x1b\x61\x00'

printf "$CENTER_START$SIZE_START$TEXT\n\n\n\n$SIZE_SMALL$CENTER_END" > "$PRINTER"
