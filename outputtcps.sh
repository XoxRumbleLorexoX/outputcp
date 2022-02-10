#output tcp as stream
declare -a y
while true; do
	x=$(sudo tcpdump dst 192.168.0.28 -q -c 10 | rg "tcp [0-9]*" -o | rg "[0-9]*" -o | awk 4 ORS=' ')
	for ((i=1; i<11; i++)); do
		z=$(expr ${x[i]}+100)
		ffplay -f lavfi -i "sine=frequency=$z:duration=0.1" -autoexit -nodisp -hide_banner -loglevel error
		i+=1
		echo $i
	done

done
#tally

#freq = port number + 100#

