#!/bin/bash
set -ev

# Some helpers which will 'fold' the output to make the Travis logs easier to grok
start_fold() { echo -e "travis_fold:start:$1\r"; }
end_fold() { echo -e "\ntravis_fold:end:$1\r"; }
run_folded_command() { start_fold $1; travis_time_start; echo $2; `$2`; travis_time_finish; end_fold $1; }

echo
# Build for T16 with no extra cmake flags
run_folded_command "T16.default" "docker run --rm -it -v /tmp/JumperTX:/jumpertx benlye/jumpertx-build"

run_folded_command "T16.lang.German" "docker run --rm -it -v /tmp/JumperTX:/jumpertx -e \"CMAKE_FLAGS=TRANSLATIONS=DE\" benlye/jumpertx-build"

#run_folded_command "T12.default" "docker run --rm -it -v /tmp/JumperTX:/jumpertx -e \"CMAKE_FLAGS=PCB=T12\" benlye/jumpertx-build"

#start_fold "T16.default" "docker run --rm -it -v /tmp/JumperTX:/jumpertx benlye/jumpertx-build"
#echo "docker run --rm -it -v /tmp/JumperTX:/jumpertx benlye/jumpertx-build"
#docker run --rm -it -v /tmp/JumperTX:/jumpertx benlye/jumpertx-build
#end_fold "T16.default"
