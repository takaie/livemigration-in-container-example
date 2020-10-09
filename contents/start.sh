#!/bin/bash

if [ $# -ne 1 ] ; then
    exit
fi

if [ $1 = "frontend" ] ; then
    ruby /root/zipkin-ruby-example/frontend.rb -o 0.0.0.0
elif [ $1 = "backend" ] ; then
    ruby /root/zipkin-ruby-example/backend.rb -o 0.0.0.0
else
    exit
fi
    
tail -f /dev/null 
