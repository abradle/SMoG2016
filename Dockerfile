FROM informaticsmatters/rdkit
MAINTAINER Anthony Bradley <anthony.richard.bradley@gmail.com>
RUN apt-get install -y libopenbabel-dev
ADD SMoG2016_Rev1 /usr/local/SMoG2016_Rev1 
RUN g++ -O3 -Wall -std=c++11 -Wno-uninitialized -I/usr/include/openbabel-2.0 -lm -c /usr/local/SMoG2016_Rev1/SMoG2016.cpp -o /usr/local/SMoG2016_Rev1/SMoG2016.o
RUN g++ /usr/local/SMoG2016_Rev1/SMoG2016.o -o /usr/local/SMoG2016_Rev1/SMoG2016.exe -rdynamic /usr/lib/libopenbabel.so -Wl,-rpath,/usr/lib
