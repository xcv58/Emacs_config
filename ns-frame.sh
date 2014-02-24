existNsFrame=$(/usr/local/bin/emacsclient -e "(exist-ns-frame)")
if [ "$existNsFrame" == "" ]
then
    /usr/local/bin/emacs --daemon
fi
if [ "$existNsFrame" != "ns" ] && [ "$daemon" != "true" ]
then
    /usr/local/bin/emacsclient -c -n $*
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
