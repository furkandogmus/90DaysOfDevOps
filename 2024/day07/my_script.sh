#!/bin/bash
cat <<EOF >> ~/90DaysOfDevOps/daily.log
$(date) tarihine kadar $(ls -R /home/furkan/90DaysOfDevOps/2024 | grep sh | wc -l) tane script yazdin.
EOF
cd ~/90DaysOfDevOps/
git add ~/90DaysOfDevOps/daily.log
git commit -m "Daily log added."
./git_push.exp

