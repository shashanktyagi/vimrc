#Source: https://fazlearefin.blogspot.com/2014/08/disable-touchpad-using-keyboard-shortcut.html
TOUCHPADID=12    # change this id

SYNSTATE=$(xinput list-props "$TOUCHPADID" | grep "Device Enabled" | grep -Eo '.$')
if [ $SYNSTATE = 0 ]; then
    xinput set-prop "$TOUCHPADID" "Device Enabled" 1
else
    xinput set-prop "$TOUCHPADID" "Device Enabled" 0
fi

