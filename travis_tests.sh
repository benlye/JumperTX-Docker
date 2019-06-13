#!/bin/bash
set -e

start_fold() { echo -e "travis_fold:start:$1\033[33;1m$2\033[0m"; }
end_fold() { echo -e "\ntravis_fold:end:$1\r"; }

#run_folded_command() { start_fold $1; $2; end_fold $1; }
# Build for T16 with no extra cmake flags
start_fold "T16.default"
echo "docker run --rm -it -v /tmp/JumperTX:/jumpertx benlye/jumpertx-build"
docker run --rm -it -v /tmp/JumperTX:/jumpertx benlye/jumpertx-build
end_fold "T16.default"
