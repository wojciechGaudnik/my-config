#!/bin/bash

sleep 1s
killall conky
conky -c /home/bq666/.config/conky/.conky.conf
