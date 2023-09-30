#!/bin/bash

echo -n "Enter a directory: "
read -r x
du -sh "$x"
