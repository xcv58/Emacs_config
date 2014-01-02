existNsFrame=$(/usr/local/bin/emacsclient -e "(exist-ns-frame)")
if [ "$existNsFrame" == "" ]; then
	/usr/local/bin/emacs --daemon
	/usr/local/bin/emacsclient -c -n
else if [ "$existNsFrame" == "nil" ]; then
	/usr/local/bin/emacsclient -c -n -a ""
fi
fi
