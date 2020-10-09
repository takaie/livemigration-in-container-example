#!/bin/bash -e

sudo rm -rf image/*
docker-compose up -d

ADDR=$(docker inspect --format '{{ .NetworkSettings.Networks.phaulincontainer_phaul_test.IPAddress }}' frontend2)
PID=$(docker exec frontend ps ax | grep "ruby /root/zipkin-ruby-example/frontend.rb" | awk '{ print $1 }')
PID2=$(docker exec frontend2 ps ax | grep "ruby /root/zipkin-ruby-example/frontend.rb" | awk '{ print $1 }')


docker exec frontend2 /root/phaul/s/run.sh &
sleep 2
docker exec frontend /root/phaul/c/run.sh $PID $ADDR

curl http://localhost:8082

#docker-compose down 
