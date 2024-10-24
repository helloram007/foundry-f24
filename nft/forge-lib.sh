#!/bin/sh

LIB_NAME=$1
echo "LIB_NAME >> $LIB_NAME"

forge install $LIB_NAME --no-commit
