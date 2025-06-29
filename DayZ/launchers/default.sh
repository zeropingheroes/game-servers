#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../server && ./DayZServer -port=2302 -profiles=profiles -bepath=battleye -config=serverDZ.cfg -dologs -adminlog -netlog -freezecheck
