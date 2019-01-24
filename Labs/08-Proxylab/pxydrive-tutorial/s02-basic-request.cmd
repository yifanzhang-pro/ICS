### Illustrating basic operation of pxydrive
# Generate file with 1000 random characters
# After this command, take a look at file 'source_files/random/data1.txt'
generate data1.txt 1k
#
# Set up a server
serve s1
#
# Generate request to proxy to fetch a copy of the file
request r1 data1.txt s1
#
# Wait required when run in batch mode
wait *
#
# See what happened
trace r1
#
# Allow server to respond
respond r1
#
# Wait required when run in batch mode
wait *
#
# See what happened
trace r1
#
# Make sure it was retrieved properly
check r1
quit
