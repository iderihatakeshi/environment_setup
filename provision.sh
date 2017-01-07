#!/bin/sh
sudo yum update -y
sudo yum -y install gcc gdb make git readline-devel zlib-devel bison flex perl-Test-Harness yum-utils

git clone git://git.postgresql.org/git/postgresql.git
cd postgresql

./configure --prefix=$HOME/pgsql/master --enable-debug --enable-cassert --enable-tap-tests CFLAGS=-O0 --with-pgport=$PGPORT
make
make install

cd $HOME/pgsql/master
bin/initdb -D data -E UTF8 --no-locale
bin/pg_ctl start -D data
