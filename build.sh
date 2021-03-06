#!/bin/bash
rm ZMemory.pk3
cd src

# compile the ACS source
cd acs_source
bash compile.sh
cd ..

# Bundle everything that isn't:
#  .sh  : a shell script.
thin_arg=$1
version=$(cat ../version.txt)
if [[ $thin_arg == "thin" ]]; then
  7za a -tzip ../ZMemory_v$version\_thin.pk3 -r -x\!*.sh -x\!acs/.gitignore -xr\!acs_source
else
  7za a -tzip ../ZMemory_v$version.pk3 -r -x\!*.sh -x\!acs/.gitignore
fi


