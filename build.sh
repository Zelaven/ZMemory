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
if [[ $thin_arg == "source" ]]; then
  7za a -tzip ../ZMemory.pk3 -r -x\!*.sh -xr\!acs_source
else
  7za a -tzip ../ZMemory.pk3 -r -x\!*.sh
fi

