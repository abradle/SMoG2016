FROM debian:jessie-backports
MAINTAINER Anthony Bradley <anthony.richard.bradley@gmail.com>
RUN apt-get update && apt-get install -y \
 build-essential\
 python-numpy\
 cmake\
 python-dev\
 sqlite3\
 libsqlite3-dev\
 libboost-dev\
 libboost-system-dev\
 libboost-thread-dev\
 libboost-serialization-dev\
 libboost-python-dev\
 libboost-regex-dev\
 swig2.0\
 git\
 wget\
 zip &&\
 apt-get upgrade -y
RUN apt-get install -y libopenbabel-dev
ADD SMoG2016_Rev1 /usr/local/SMoG2016_Rev1 
RUN g++ -O3 -Wall -std=c++11 -Wno-uninitialized -I/usr/include/openbabel-2.0 -lm -c /usr/local/SMoG2016_Rev1/SMoG2016.cpp -o /usr/local/SMoG2016_Rev1/SMoG2016.o
RUN g++ /usr/local/SMoG2016_Rev1/SMoG2016.o -o /usr/local/SMoG2016_Rev1/SMoG2016.exe -rdynamic /usr/lib/libopenbabel.so -Wl,-rpath,/usr/lib
