current_dir=$PWD
current_dir="$(basename $current_dir)"

echo Using tclsh $TCL

while read filename
do
	board_name=${filename%%/*}
	filename=${filename#*/}

	if [ "$board_name" = "$current_dir" ]; then
		if [ -e $filename ]; then
			swapped_file="$filename.swapped"
			$TCL ../tools/byte_swap.tcl $filename $swapped_file 8
		fi
	fi
done < $1
