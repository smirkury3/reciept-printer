PRINTER="/dev/ttyUSB0"

TEXT="$1"

# font size
case "$2" in
	-s)
		FONT_SIZE='\x1d\x21\x00'		# small font
;;
	-l)
		FONT_SIZE='\x1d\x21\x22' 		# large font
;; 
	*)
		FONT_SIZE='\x1d\x21\x11'		# normal font
esac

# align text
#case "$3" in
#	-l)
#		TEXT_ALIGN="\x1b\x61\x00"		# left align
#;;
#	-r)
#		TEXT_ALIGN="\x1b\x61\x02"		# right align
#;;
#	*)
		TEXT_ALIGN="\x1b\x61\x01"		# center font	
#esac

# bold enable/disable
#		BOLD_OFF="\x1b\x45\x00"			# bold disable
#		BOLD_ON="\x1b\x45\x01"			# bold enable

# italics enable/disable
#		ITALICS_OFF="\x1b\x34\x00"		# italics disable
#		ITALICS_ON="\x1b\x34\x01"		# italics enable

# underline enable/single dot/double dot
#		UNDERLINE_OFF="\x1b\x45\x00"		# underline disable
#		UNDERLINE_SINGLE_DOT="\x1b\x45\x01"	# underline single dot
#		UNDERLINE_DOUBLE_DOT="\x1b\x45\x02"	# underline double dot

printf "\x1b\x40$TEXT_ALIGN$FONT_SIZE$TEXT\n\n\n" > "$PRINTER"
