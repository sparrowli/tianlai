#!/bin/bash
ncpu=`sysctl -n hw.ncpu`
path=`dirname $0`

find . \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name ".hpp" \) -print0 \
       | xargs -0 -P $ncpu -n 6 $path/cpplint.py --linelength=80 --headers=hpp --extensions=c,h,cc,cpp,hpp

exit $?
