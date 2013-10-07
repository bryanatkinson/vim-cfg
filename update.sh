#!/bin/bash
START_DIR=${PWD##*/}

for bundle in ~/.vim/bundle/*; do 
    (cd "$bundle" && git pull);
done

cd $START_DIR
