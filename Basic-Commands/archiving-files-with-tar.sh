:<<'COMMENTS'
"tar" is the Tape ARchiver

Basic usage is to compress, extract, or list.

tar support 2 UNIX Styles:
- BSD (FreeBSD, MacOS)
    tar cvf my_archive.tar /home

- System-V GNU (Linux)
    tar -cvf my_archive.tar /home


Understanding compression Utilities:
    gzip: most common compression utility
    bzip2: compresses a single file
    xzip: compresses a single file
    zip: windows compatible compression utility

COMMENTS

# create
tar -cvf my_archive.tar /home

# extract in current directory
tar -xvf my_archive.tar

# extract to a different directory
tar -xvf my_archive.tar -C /tmp

$ show the tar
tar -tvf my_archive.tar

# get the file type
file my_archive.tar

# compress with gzip
time sudo tar -czvf /tmp/home_etc_archive.tar.gz /home /etc

# compress with bzip2
time sudo tar -cjvf /tmp/home_etc_archive.tar.bz2 /home /etc

