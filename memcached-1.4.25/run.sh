#!/bin/bash

cp -f template.cnf run.cnf;
sed -i 's/_SET_/0.1/' run.cnf ;
sed -i 's/_GET_/0.9/' run.cnf ;
killall memcached; sleep 1;
memcached -d -m 3072 -p 11211 -v -u root;
sleep 1;
./memaslap -s 127.0.0.1:11211 --threads=4 --concurrency=128 -t 8s --cfg_cmd=run.cnf;


cp -f template.cnf run.cnf;
sed -i 's/_SET_/0.3/' run.cnf ;
sed -i 's/_GET_/0.7/' run.cnf ;
killall memcached; sleep 1;
memcached -d -m 3072 -p 11211 -v -u root;
sleep 1;
./memaslap -s 127.0.0.1:11211 --threads=4 --concurrency=128 -t 8s --cfg_cmd=run.cnf;

cp -f template.cnf run.cnf;
sed -i 's/_SET_/0.5/' run.cnf ;
sed -i 's/_GET_/0.5/' run.cnf ;
killall memcached; sleep 1;
memcached -d -m 3072 -p 11211 -v -u root;
sleep 1;
./memaslap -s 127.0.0.1:11211 --threads=4 --concurrency=128 -t 8s --cfg_cmd=run.cnf;

cp -f template.cnf run.cnf;
sed -i 's/_SET_/0.7/' run.cnf ;
sed -i 's/_GET_/0.3/' run.cnf ;
killall memcached; sleep 1;
memcached -d -m 3072 -p 11211 -v -u root;
sleep 1;
./memaslap -s 127.0.0.1:11211 --threads=4 --concurrency=128 -t 8s --cfg_cmd=run.cnf;

cp -f template.cnf run.cnf;
sed -i 's/_SET_/0.9/' run.cnf ;
sed -i 's/_GET_/0.1/' run.cnf ;
killall memcached; sleep 1;
memcached -d -m 3072 -p 11211 -v -u root;
sleep 1;
./memaslap -s 127.0.0.1:11211 --threads=4 --concurrency=128 -t 8s --cfg_cmd=run.cnf;

killall memcached; sleep 1;
