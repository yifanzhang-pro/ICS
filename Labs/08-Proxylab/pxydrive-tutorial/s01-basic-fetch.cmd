### Illustrating basic operation of pxydrive
# Generate file with 1000 random characters
# After this command, take a look at file 'source_files/random/data1.txt'
generate data1.txt 1k
#
# Set up a server
serve s1
#
# Ask proxy to fetch a copy of the file
fetch f1 data1.txt s1
#
# Wait required when run in batch mode
wait *
#
# See what happened
trace f1
#
# Make sure it was retrieved properly
check f1
quit
