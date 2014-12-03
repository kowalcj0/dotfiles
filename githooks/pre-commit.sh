#!/usr/bin/env bash
./findbollocks.sh && {
    make test && {
        exit 0;
    } || {
        echo "test failed! fix it!";
        exit 2;
    }
} || {
    echo "found crap! fix it!";
    exit 1;
}
