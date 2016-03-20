# ---------------------------------------
# Anti Idle by dirty Inc.
# 
# HOW TO USE!!!!
# Set the channel to +noidleop +noidlehalfop
# or/and +noidlevoice
# ---------------------------------------

# Set here the maximum time of idle in minutes
set dty_antii(time) "60"

# DO NOT EDIT PASS THIS LINE (AT YOUR OWN RISK)
setudef flag noidleop
setudef flag noidlehalfop
setudef flag noidlevoice

bind time - "*0 * * * *" no_idle_users
bind time - "*5 * * * *" no_idle_users

proc no_idle_users {a b c d e} {
	global dty_antii
	
	foreach chan [channels] {
		if {[channel get $chan noidleop] && [botisop $chan]} {
			foreach user [chanlist $chan] {
				if {[isop $user $chan] && [getchanidle $user $chan] > $dty_antii(time) && ![isbotnick $user] } {
					pushmode $chan -o $user
				}
			}
		}
		if {[channel get $chan noidlehalfop] && [botisop $chan]} {
			foreach user [chanlist $chan] {
				if {[ishalfop $user $chan] && [getchanidle $user $chan] > $dty_antii(time) && ![isbotnick $user]} {
					pushmode $chan -h $user
				}
			}
		}
		if {[channel get $chan noidlevoice] && [botisop $chan]} {
			foreach user [chanlist $chan] {
				if {[isvoice $user $chan] && [getchanidle $user $chan] > $dty_antii(time) && ![isbotnick $user]} {
					pushmode $chan -v $user
				}
			}
		}
	}
}
putlog "Anti Idle by dirty Inc. (adjusted by ArNz|8o8) loaded." 