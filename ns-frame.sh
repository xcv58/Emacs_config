existNsFrame=$(/usr/local/bin/emacsclient -e "(exist-ns-frame)")
if [ $# -eq 0 ]
then
    daemon=false
else
    daemon=true
fi
if [ "$existNsFrame" == "" ]
then
    /usr/local/bin/emacs --daemon
fi
if [ "$existNsFrame" != "ns" ] && [ "$daemon" != "true" ]
then
    /usr/local/bin/emacsclient -c -n
fi
