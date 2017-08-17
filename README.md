fuse-xfstests
=============

[xfstests](https://kernel.googlesource.com/pub/scm/fs/ext2/xfstests-bld/+/HEAD/Documentation/what-is-xfstests.md)
with support for the FUSE filesystem [gocryptfs](https://github.com/rfjakob/gocryptfs)
added.

Prerequsites
------------

* Working `gcc` and `make`
* gocryptfs binary in `/usr/local/bin`

Installing the tests
--------------------

1. Clone this repo
2. Run `make` in the new directory

Running the tests
-----------------

```
sudo ./check-gocryptfs
```

The output should look like this:

```
$ sudo ./check-gocryptfs
gocryptfs v1.4-48-g312ea32; go-fuse v20170619-14-g204b45d; 2017-08-16 go1.8.3
fuse-xfstests gocryptfs-2017-08-08/a2564c17
Do 17. Aug 20:53:19 UTC 2017

FSTYP         -- fuse.gocryptfs
PLATFORM      -- Linux/x86_64 brikett 4.10.17-200.fc25.x86_64
MKFS_OPTIONS  -- /tmp/check-gocryptfs/scratchdev
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /tmp/check-gocryptfs/scratchdev /tmp/check-gocryptfs/scratchdir

generic/001	 4s
generic/002	 0s
generic/003	 [not run] atime related mount options have no effect on gocryptfs
generic/004	 [not run] xfs_io flink failed (old kernel/wrong fs?)
generic/005	 0s
generic/006	 1s
generic/007	 4s
generic/008	 [not run] xfs_io fzero failed (old kernel/wrong fs?)
[...]
```

More Info
---------

See the original xfstests [README](README)
