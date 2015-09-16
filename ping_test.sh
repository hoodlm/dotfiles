ping -c 1 -W 2 $1 | egrep -o "time=.+" | cut -c 6-
