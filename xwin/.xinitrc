cat ~/.Xresources | xrdb &
autocutsel -fork -selection CLIPBOARD
autocutsel -fork -selection PRIMARY
xinput set-prop 14 "Coordinate Transformation Matrix" 0.6 0 0 0 0.6 0 0 0 2
urxvtd -q -o -f &
exec i3 2>&1 > /dev/null
