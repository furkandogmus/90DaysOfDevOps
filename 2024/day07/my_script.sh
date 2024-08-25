#!/bin/bash
/usr/bin/cat <<EOF >> /home/furkan/90DaysOfDevOps/daily.log
$(/bin/date) tarihine kadar $(/bin/ls -R /home/furkan/90DaysOfDevOps/2024 | /bin/grep sh | /usr/bin/wc -l) tane script yazdin.
EOF
cd /home/furkan/90DaysOfDevOps/
/usr/bin/git add /home/furkan/90DaysOfDevOps/daily.log
/usr/bin/git commit -m "Daily log added."
/home/furkan/90DaysOfDevOps/2024/day07/git_push.exp

