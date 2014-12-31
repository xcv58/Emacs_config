if [ ! -f ~/.emacs.pid ]; then
    osascript <<EOF
display notification with title "Open Emacs" subtitle "Please wait 3 seconds."
EOF
    /Applications/Emacs.app/Contents/MacOS/Emacs --daemon
fi
existNsFrame=$(/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -e "(exist-ns-frame)")
if [ "$existNsFrame" != "ns" ]
then
    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n $*
    osascript <<FRONTMOST
set appName to "Emacs"
set appID to bundle identifier of (info for (path to application appName))
tell application "System Events"
    set frontmost of process appName to true
end tell
FRONTMOST
else
    osascript <<TOGGLEVISIBLE
set appName to "Emacs"
set appID to bundle identifier of (info for (path to application appName))
tell application "System Events"
    if not (exists process appName) then
        tell application appID to activate
    else
        if frontmost of process appName then
            set visible of process appName to false
        else
            set frontmost of process appName to true
        end if
    end if
end tell
TOGGLEVISIBLE
fi
