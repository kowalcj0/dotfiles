#!/usr/bin/env python
import os
import re


def load_titles(titles_file):
    with open(titles_file, mode = 'rt') as titles:
        return titles.readlines()

def rename(old, new):
    print "Renaming file: {:>30} to: {:>30}".format(old, new)
    os.rename(old, new)


def main():
    titles = load_titles("{}/titles".format(os.path.dirname(os.path.realpath(__file__))))
    for idx, filename in enumerate(sorted(os.listdir(os.getcwd()))):
            name, ext = os.path.splitext(filename)
            rename(filename, "{}-{}{}".format(name, titles[idx].strip(), ext))


if __name__ == "__main__":
    main()

