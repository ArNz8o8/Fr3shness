putlog "Bot Status and Some fun tool by ArNz|8o8 loaded"

#unbind msg - help * msg:help
bind pub -|- !version pub_say_ver
bind pub -|- !server pub_do_srv
bind pub n|n !slap pub_do_slap
bind pub -|- !poke pub_do_poke
bind pub -|- !hug pub_do_hug
bind pub -|- !laugh pub_do_laugh
bind pub m !status pub_do_status

#Slap sbody on #channel
proc pub_do_slap {nick host handle channel testes} {  
global botnick slaps slapoutput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :Eh... Don't waste my time, slap yourself!"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "PRIVMSG $channel :Dont go slapping me slap yourself"
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :\001ACTION loves his owner\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set slaps { 
	"drives over $who" 
	"shreds $who with a chainsaw" 
	"steals $who's cookies. mwahaha!" 
	"pushes $who into a crevasse" 
	"follows $who into a dark avenue. Hey test my crowbar!" 
	"persuades $who to eat a cyanide sandwich" 
	"slaps $who around a bit with a large trout" 
	"forgets $who in the desert. awww" 
	"burns $who's house down"
	"throws a keyboard at $who"
	"beautifies $who with some knuckle duster imprints"
	"sends hordes of lemmings over $who"
	"slaps $who around with a pink Macintosh"
	"slaps $who around with nuclear waste"
	"throws a playstation at $who"
	"throws a green xbox at $who"
	"prepares $who to be shown on planeshift.it"
	"sneezes in $who's face"
	"stabs $who in the face"
	"slaps $who around a bit with a small Imperial-Class Stardestroyer"
	"discovers $who's picture at some random site"
	"slaps $who around with Windows 3.1"
} 
set slapoutput [lindex $slaps [rand [llength $slaps]]]  
if {$who == ""} {  
putserv "PRIVMSG $channel :Usage: slap <nick>"  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $slapoutput]\001"
}
#end of pub_do_slap

#Sleep sbody on #channel
proc pub_do_sleep {nick host handle channel testes} {  
global botnick sleeps sleepoutput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :Eh... Don't waste my time, Go to sleep!"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "PRIVMSG $channel :Eh, how funny..."
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :\001ACTION does not want his owner to sleep\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set sleeps { 
	"sends $who to bed with a bear"
	"watches $who fall asleep" 
	"hands $who a pillow and blanket"
	"wonders if $who needs any sleep"
} 
set sleepoutput [lindex $sleeps [rand [llength $sleeps]]]  
if {$who == ""} {  
putserv "NOTICE $channel :Usage: sleep <nick>"  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $sleepoutput]\001"
}
#end of pub_do_sleep

#wakeup sbody on #channel
proc pub_do_wakeup {nick host handle channel testes} {  
global botnick wakeups wakeupoutput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :Eh... Don't waste my time, you are UP!"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "PRIVMSG $channel :Eh, how funny..."
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :\001ACTION does want his owner to wake up\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set wakeups { 
	"screams at $who 'GET OUT OF BED NOW THE HOUSE IS ON FIRE' "
	"calls out for  $who 'time to get out of bed' " 
} 
set wakeupoutput [lindex $wakeups [rand [llength $wakeups]]]  
if {$who == ""} {  
putserv "NOTICE $channel :Usage: !wakeup <nick>"  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $wakeupoutput]\001"
}
#end of pub_do_wakeup


#poke sbody on #channel
proc pub_do_poke {nick host handle channel testes} {  
global botnick pokes pokeoutput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :Eh... Don't waste my time, poke yourself!"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "PRIVMSG $channel :Eh, how funny..."
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :\001ACTION loves his owner\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set pokes { 
	"pokes $who with a very sharp needle" 
	"pokes $who" 
} 
set pokeoutput [lindex $pokes [rand [llength $pokes]]]  
if {$who == ""} {  
putserv "PRIVMSG $channel :dumbo i need someone to poke."  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $pokeoutput]\001"
}
#end of pub_do_poke

#hug sbody on #channel
proc pub_do_hug {nick host handle channel testes} {  
global botnick hugs hugpoutput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $botnick]} {
putserv "PRIVMSG $channel :Eh, how funny... how do i hug myself?"
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :\001ACTION hugs and kisses $who\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set hugs { 
	"kills $who" 
	"hugs $who, I love you"	
	"wants $who dead"
	"gives $who a big hug, Do i know you?"
	"hugs $who, are you related to me?"
	"looks at $who, do i know you?"
	"wonders if $channel wants $who here"
} 
set hugoutput [lindex $hugs [rand [llength $hugs]]]  
if {$who == ""} {  
putserv "PRIVMSG $channel :Hey I am in need of someone to hug today."  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $hugoutput]\001"
}
#end of pub_do_hug


#laugh sbody on #channel
proc pub_do_laugh {nick host handle channel testes} {  
global botnick laugh laughoutput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :Eh... Don't waste my time, laugh at yourself!"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "PRIVMSG $channel :Eh, how funny..."
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :\001ACTION loves his owner\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set laughs { 
	"laughs at $who"
} 
set laughoutput [lindex $laughs [rand [llength $laughs]]]  
if {$who == ""} {  
putserv "NOTICE $channel :Usage: laugh <nick>"  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $laughoutput]\001"
}
#end of pub_do_laugh

#Slap sbody from msg
proc msg_do_slap {nick handle channel testes} {  
global botnick slaps slapoutput where randnum
set who [lindex [split $testes] 0]
set where [lindex $testes 1]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $where :Eh, funny... Don't waste my time, slap yourself!"
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $where :\001ACTION likes his owner\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set slaps { 
	"drives over $who" 
	"shreds $who with a chainsaw" 
	"steals $who's cookies. mwahaha!" 
	"pushes $who into a crevasse" 
	"follows $who into a dark avenue. Hey test my crowbar!" 
	"persuades $who to eat a cyanide sandwich" 
	"slaps $who around a bit with a large trout" 
	"forgets $who in the desert. awww" 
	"burns $who's house down"
	"throws a keyboard at $who"
	"beautifies $who with some knuckle duster imprints"
	"sends hordes of lemmings over $who"
	"slaps $who around with a pink Macintosh"
	"slaps $who around with nuclear waste"
	"throws a playstation at $who"
	"throws a green xbox at $who"
	"prepares $who to be shown on planeshift.it"
	"sneezes in $who's face"
	"stabs $who in the face"
	"slaps $who around a bit with a small Imperial-Class Stardestroyer"
	"discovers $who's picture at some random site"
	"slaps $who around with Windoze 3.1 and VISTA"
} 
set slapoutput [lindex $slaps [rand [llength $slaps]]]  
if {$who == ""} {  
putserv "PRIVMSG $channel :Usage: slap <nick> #channel"  
return 1  
}
putserv "PRIVMSG $where :\001ACTION [subst $slapoutput]\001"
}
#end of msg_do_slap

#hug sbody from msg
proc msg_do_hug {nick handle channel testes} {  
global botnick hugs hugoutput where randnum
set who [lindex [split $testes] 0]
set where [lindex $testes 1]
if {[matchattr $who +n]} {
putserv "PRIVMSG $where :\001ACTION hugs and kisses $who\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set hugs { 
	"hugs $who, I love you"	
	"gives $who a big hug, Do i know you?"
	"hugs $who, are you related to me?"
	"looks at $who, do i know you?"
} 
set hugoutput [lindex $hugs [rand [llength $hugs]]]  
if {$who == ""} {  
putserv "PRIVMSG $channel :Usage: hug <nick> #channel"  
return 1  
}
putserv "PRIVMSG $where :\001ACTION [subst $hugoutput]\001"
}
#end of msg_do_hug


#laugh sbody from msg
proc msg_do_laugh {nick handle channel testes} {  
global botnick laugh laughoutput where randnum
set who [lindex [split $testes] 0]
set where [lindex $testes 1]
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set laughs { 
	"laughs at $who"
} 
set laughoutput [lindex $laughs [rand [llength $laughs]]]  
if {$who == ""} {  
putserv "PRIVMSG $channel :Usage: laugh <nick> #channel"  
return 1  
}
putserv "PRIVMSG $where :\001ACTION [subst $laughoutput]\001"
}
#end of msg_do_laugh


#Make the bot say something..
proc pub_do_say {nick host handle channel testes} {
set who [lindex $testes 0] 
set why [lrange $testes 1 end] 
if {$who == ""} {
putserv "NOTICE $channel :Usage: !say <What you want me to say to the channel.>"
return 1
}
putserv "PRIVMSG $channel :$who $why"
return 1
} 
#End of pub_do_say









#shows the current server
proc pub_do_srv {nick host handle channel testes} {
global server
putserv "PRIVMSG $channel :I'm currently on $server."
return 1
}
#end of pub_do_srv

#version 
proc pub_say_ver {nick host handle channel testes} {
global version
putserv "PRIVMSG $channel :I'm a $version eggdrop."
return 1
}
#end of pub_do_ver


#tell the status
proc pub_do_status {nick host handle channel testes} {
	global server botname version owner
	putserv "PRIVMSG $channel :---Bot statistics:---"
	putserv "PRIVMSG $channel :User records: [countusers]"
	putserv "PRIVMSG $channel :My operating system: [unames]"
	putserv "PRIVMSG $channel :My server: $server"
	putserv "PRIVMSG $channel :My host: $botname"
	putserv "PRIVMSG $channel :My version: Eggdrop [lindex $version 0]"
    putserv "PRIVMSG $channel :My owner: $owner"
	putserv "PRIVMSG $channel :---End of statisctics---"
}
#end of pub_do_status




#lunch sbody on #channel
proc pub_do_lunch {nick host handle channel testes} {  
global botnick lunchs lunchoutput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :Eh... Don't waste my time, Go to EAT!"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set lunchs { 
	"sends $who to lunch"
	"hands $who a sandwich" 
}
set lunchoutput [lindex $lunchs [rand [llength $lunchs]]]  
if {$who == ""} {  
putserv "NOTICE $channel :Usage: !lunch <nick>"  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $lunchoutput]\001"
}
#end of pub_do_lunch

#############################################################################################
################################ E N D   O F   S C R I P T  ################################
############################################################################################