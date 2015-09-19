#!/bin/bash

set -eu

# No parameters - just plain "mount" output wanted
if [ "$#" -eq 0 ]
then
	exec mount
fi

if [[ $* == *$TEST_DIR* ]]
then
	DIR=$TEST_DIR
	DEV=$TEST_DEV
elif [[ $* == *$SCRATCH_MNT* ]]
then
	DIR=$SCRATCH_MNT
	DEV=$SCRATCH_DEV
else
	echo "Invalid command line:"
	echo $*
	exit 1
fi

if [ "$FSTYP" == fuse.loopbackfs ]; then
	"$GOPATH/src/github.com/hanwen/go-fuse/example/loopback/loopback" -l "$DIR" "$DEV" > /tmp/$FSTYP.log &
	sleep 1
	disown
elif [ "$FSTYP" == fuse.gocryptfs ]; then
	if [ ! -f "$DEV/gocryptfs.conf" ]; then
		"$GOPATH/src/github.com/rfjakob/gocryptfs/gocryptfs" -q -init -extpass "echo test" -scryptn=10 "$DEV"
	fi
	"$GOPATH/src/github.com/rfjakob/gocryptfs/gocryptfs" -q -extpass "echo test" "$DEV" "$DIR"
else
	echo "$0: unknown FSTYP=$FSTYP"
fi

