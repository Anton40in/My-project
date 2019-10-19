#!/bin/bash

set -ex
find ~/root/backup -type f -name '*.tar.gz' -ctime 0 | sort -n | tail -n 1 | xargs rm -rf
