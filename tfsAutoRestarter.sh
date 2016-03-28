
#!/bin/bash
 ulimit -c unlimited

while true; do
  ./theforgottenserver > data/logs/output.log &
  PID=
  echo  > theforgottenserver.pid
  wait 
  sleep 60
done

