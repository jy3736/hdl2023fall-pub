#!/bin/bash

python ./allchksum.py
./compile_py.sh mydata.py
./compile_py.sh grading.py
./compile_py.sh testing.py

