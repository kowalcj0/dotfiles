#!/usr/bin/env bash

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z ${COURSE_URL} ]; then echo "Please set COURSE_URL"; exit 1; fi

python ${__dir}/pad_all_numbers_in_filename.py
cd ${__dir} && {
    phantomjs phantomjs_capture_html.js "${COURSE_URL}" > test.html && {
        cat test.html | grep "h5.*ng-binding" | cut -d\> -f3 | cut -d\< -f1 | sed "s/[ .]/_/g" | sed -e 's/[^A-Za-z0-9._-]//g' | sed '/^$/d' > titles && {
            cd - && {
                echo "Got the titles file, so now need to add titles"
                python ${__dir}/add_titles.py
            }
        } || {
            echo "something went wrong with parsing the titles file";
            exit 1;
        }
    } || {
        echo "something went wrong with parsing the url";
        exit 1;
    }
}
