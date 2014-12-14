#!/usr/bin/env bash
FILES_PATTERN='\.(py|js)(\..+)?$'
FORBIDDEN='ipdb|console.log'
git diff --cached --name-only | \
    grep -E $FILES_PATTERN | \
    GREP_COLOR='4;5;37;41' xargs grep --color --with-filename -n $FORBIDDEN && echo 'COMMIT REJECTED Found "$FORBIDDEN" references. Please remove them before commiting' && exit 1
