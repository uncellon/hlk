#!/bin/bash
cd events && git checkout master && git pull && cd ..
cd gpio && git checkout master && git pull && cd ..
cd logger && git checkout master && git pull && cd ..
cd pool && git checkout master && git pull && cd ..
cd serialport && git checkout master && git pull && cd ..
cd timers && git checkout master && git pull && cd ..
