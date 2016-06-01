fuse-xfstests
=============

[xfstests](https://kernel.googlesource.com/pub/scm/fs/ext2/xfstests-bld/+/HEAD/Documentation/what-is-xfstests.md)
with support for the FUSE filesystem [gocryptfs](https://github.com/rfjakob/gocryptfs)
added.

Prerequsites
------------

* A working gcc toolchain
* $GOPATH must be set
* go-fuse must be in your $GOPATH
* gocryptfs must be in your $GOPATH

Installing the tests
--------------------

1. Clone this repo
2. Run `make` in the new directory

Running the tests
-----------------

	./check-loopbackfs generic/???

or

	./check-gocryptfs generic/???

The output should look like this:

	FSTYP         -- fuse.loopbackfs
	PLATFORM      -- Linux/x86_64 brikett 4.1.4-200.fc22.x86_64
	MKFS_OPTIONS  -- /tmp/fuse-xfstests/scratchdev
	MOUNT_OPTIONS -- -o context=system_u:object_r:nfs_t:s0 /tmp/fuse-xfstests/scratchdev /tmp/fuse-xfstests/scratchdir

	generic/001 3s ... 3s
	generic/002	 0s
	generic/003	 [not run] atime related mount options have no effect on loopback file systems
	generic/004	 [not run] xfs_io flink failed (old kernel/wrong fs?)
	generic/005 0s ... 0s
	generic/006 1s ... 2s
	generic/007 3s ... 2s
	[...]

More Info
---------

See the original xfstests [README](README)
