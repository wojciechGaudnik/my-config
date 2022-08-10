program=$(apt-cache pkgnames | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[apt:install]'")

if [ "x$program" != "x" ]
then 
  echo $program| apt install $program
  ai.sh
fi
