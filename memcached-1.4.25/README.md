# Memcached

## Dependencies

install libevent: http://www.linuxfromscratch.org/blfs/view/svn/basicnet/libevent.html

install memcslap: sudo apt-get install libmemcached-tools

autoreconf -ivf
./configure
make
make test
sudo make install

start memcached server:(http://www.erikwebb.net/blog/benchmarking-memcached-memslap/)
memcached -d -m 256 -p 11211 -v

check if server is running:
ps -ef | grep memcached


run benchmark:
memcslap --servers 127.0.0.1:11211 --concurrency=1000 --execute-number=200 --initial-load=1000 --flush

kill memcached server:
killall memcached

Links:
default memcached config: http://www.liquidweb.com/kb/how-to-install-memcached-on-ubuntu-14-04-lts/

* libevent, http://www.monkey.org/~provos/libevent/ (libevent-dev)

## Environment

### Linux

If using Linux, you need a kernel with epoll.  Sure, libevent will
work with normal select, but it sucks.

epoll isn't in Linux 2.4, but there's a backport at:

    http://www.xmailserver.org/linux-patches/nio-improve.html

You want the epoll-lt patch (level-triggered).

### Mac OS X

If you're using MacOS, you'll want libevent 1.1 or higher to deal with
a kqueue bug.

Also, be warned that the -k (mlockall) option to memcached might be
dangerous when using a large cache.  Just make sure the memcached machines
don't swap.  memcached does non-blocking network I/O, but not disk.  (it
should never go to disk, or you've lost the whole point of it)

## Website

* http://www.memcached.org

## Contributing

Want to contribute?  Up-to-date pointers should be at:

* http://contributing.appspot.com/memcached
