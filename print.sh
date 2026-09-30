PRINTER="/dev/ttyUSB0"

TEXT="$1"

if [ -z "$1" || "$1" == '-h' ]; then
	cat <<EOF
	Usage: ./print 'text' (formatting)
	(formatting) Use this to change the formatting, you can do this in command-line arguments 	2, 3, 4 and 5
-g) makes text larger
-s) makes text smaller
-r) aligns text to right
-l) aligns text to left
-b) makes text bold
-u) single underlines text
-U) double underlines text
EOF
	exit 1
fi

printf '\x1d\x21\x11\x1b\x61\x01\x1b\x45\x00\x1b\2d\x00'

for ((i = 2; i <= 5; i++))
do
    case "${!i}" in
	-s)
	printf '\x1d\x21\x00'
	;;
	-g)
	printf 'x1d\x21\x22'
	;;
	-l)
	printf '\x1b\x61\x00'
	;;
	-r)
	printf '\x1b\x61\x02'
	;;
	-b)
	printf '\x1b\x45\x01'
	-u)
	printf '\x1b\x2d\x01'
	;;
	-U)
	printf '\x1b\x2d\x02'
esac
done

printf "$1"

