pid=$(netstat -tulpn | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:open port]'" | awk '{print $7}' | awk -F/ '{print $1}')


if [ "x$pid" != "x" ]
 then 
  echo $pid | xargs kill -${1:-9}
  kn.sh
fi

