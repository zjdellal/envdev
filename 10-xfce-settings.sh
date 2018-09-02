#!/bin/bash

#author: Pierre-Yves Lemay

xfconf-query --channel thunar --property /misc-exec-shell-scripts-by-default --create --type bool --set true
