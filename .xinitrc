###############################################################################
# Custom key bindings

# Reclaim the Caps Lock key for yakuake
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = notsign"

# Pop the caps lock key on Alt_GR
xmodmap -e 'keycode 108 = Caps_Lock'
xmodmap -e 'add Lock = Caps_Lock'



