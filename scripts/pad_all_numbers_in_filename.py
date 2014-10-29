#!/usr/bin/env python
import os
import re


def pad_numbers(filename, padding=4):
    name, ext = os.path.splitext(filename)
    chunks = re.split('(\d+)', name)
    for idx, chunk in enumerate(chunks):
        if chunk.isdigit():
            chunks[idx] = chunk.rjust(padding, '0')
    return "{}{}".format(''.join(chunks), ext)


def rename(old, new):
    print "Renaming file: {:>30} to: {:>30}".format(old, new)
    os.rename(old, new)


def main():
    for filename in os.listdir(os.getcwd()):
            padded = pad_numbers(filename)
            rename(filename, padded)


if __name__ == "__main__":
    main()
