# Bazman`s SuPeRsCrIpT v1.1
# Written by Bazman : bazman@loveconnections4all.com
# Date: 1/15/2008
# Updated by Icari

# I tested it on Eggdrop 1.6.19, and I didn't find any bugs :)
# If you find one, pls email it to me: bazman@loveconnections4all.com

# Version history:
# 1.0beta - my first attempt at this script, it may have some bugs (I hope not).
# 1.0 I have fixed the unban and added: !deshit, !reload, !rehash, !restart, !die bugs fixed bugs at userlevs and added: !users, !bans, !slap, !massop, !massvoice, (chanmode +/-voiceall)
# 1.1 Some commands were broken and have now been updated to work, if somethings is disable that either means it was not tested or might not work correctly.

# Msg Commands are: slap, hop

# Public Commands are set to: !date, !version, !time, !server, !status, !ping, !hop
# !mode, !addm, !addop, !adduser, !msg, !say, !topic, !kick, !del, !away
# *!fuck*, !kb, !unban, !shit, !deshit, !fishbot, !back, !ccs, !join, !part
# !op, !deop, !fop, !voice, !devoice, *!halfop*, *!dehalfop*, !reload, !rehash
# !restart, !die, !away, !back, !users, !bans, !slap, !mop, !mvoice

# * = optional

# NOTE: THIS SCRIPT WILL MAKE YOUR BOT KINDA RUDE.
# I do not take responsability for any damage this script may cause to teh sever or
# computer it is on or the network or bot...
# I also am warning everyone that uses this script that it can be offenceive to sum!

# ------------Thanks, Bazman ;) ------------

############################################################################################
################################ C O N F I G U R A T I O N #################################
############################################################################################

# I added a new channel flag "voiceall", if it's set to 1, the bot will voice everyone who
# joins the channel. If it's set to 0 the bot will not voice all users who join the channel.
# You can change this flag, as the others. (via DCC CHAT: .chanset #chan +/-voiceall)

# If your bot is on QuakeNet network, you can invite fishbot (a fun bot) to your channel
# with one command.
#Requested by Gr|ep ;)
# If you want to use this command, set this to 1.
# If you don't want it, set to 0.
 set fishbot 0

# If your IRC server uses chanmode +h (halfop), set this to 1.
# If it doesn't, set to 0.
 set usehalfop 0

# "Fuck" is a bad word (If you don't like seals lol) 
# I added a command to this tcl, it's just for fun (Try It).
# If you want to enable !fuck, set this to 1.
# If you don't like bad words, set it to 0.
 set dofuck 0

# Just a little deop protection... 
# This is a 2 part protection...
# Set this to 1 if you want the bot to /hop upon getting deopped,
# or set it to 0 if it should ignore it.
 set hopondeop 1

# Now that the bot is pissed...
# Set this to 1 to kick those who deoped it, 0 if your to scared of retaleation.
# NOTE: The bot owner will be immune to this kick even if it is enabled.
 set kickondeop 0

############################################################################################
################################# S U P E R - S C R I P T ##################################
############################################################################################
############ d o n ' t   e v e n  t h i n k  a b o u t  e d i t i n g  b e l o w ###########
################# U n l e s s  y o u r  a  g o d  l i k e  m e ! ! ! #######################
######################################### ;) ###############################################
############################################################################################

putlog "Bazman`s SuPeRsCrIpT v1.1 AcTiVaTeD."

#unbind msg - help * msg:help
bind pub -|- !version pub_say_ver
bind pub -|- !server pub_do_srv
bind pub m|m !ccs pub_do_ccs
bind pub o|o !mode pub_do_mode

bind pub o|o !voice pub_do_voice
bind pub o|o !devoice pub_do_devoice
bind pub o|o !halfop pub_do_halfop
bind pub o|o !dehalfop pub_do_dehalfop
bind pub n !addm pub_do_addm
bind pub m|m !adduser pub_add_user
bind pub -|- !msg pub_do_msg
bind pub o|o !topic pub_do_topic
bind pub m|m !addop pub_do_addop
bind pub o|o !op pub_do_op
bind pub o|o !fop pub_do_fakeop
bind pub o|o !fvoice pub_do_fakevoice
bind pub o|o !fb pub_do_fakeb
bind pub -|- !say pub_do_say
bind pub m|m !chattr pub_do_chattr
bind pub o|o !kb pub_do_ban
bind pub -|- !Pingg pub_do_ping
bind pub -|- !marco pub_do_marco
bind pub -|- !ding pub_do_ding
bind pub n !del pub_do_del
bind pub o|o !deop pub_do_deop
bind pub o|o !kick pub_do_kick
bind pub o|o !remove pub_do_remove
bind pub m|m !ban pub_do_pban
bind pub n !away pub_do_away
bind pub n !back pub_do_back
bind pub -|- !fuck pub_do_fuck
bind pub o|o !unban pub_do_unban
bind pub m|m !deban pub_do_deshit
bind pub m|m !users pub_do_users
bind pub m !bans pub_do_bans
bind pub n|n !slap pub_do_slap
bind pub -|- !sleep pub_do_sleep
bind pub -|- !wakeup pub_do_wakeup
bind pub -|- !shower pub_do_shower
bind pub -|- !poke pub_do_poke
bind pub -|- !hug pub_do_hug
bind pub -|- !laugh pub_do_laugh
bind pub m !status pub_do_status
bind pub n !reload pub_do_reload
bind pub n !rehash pub_do_rehash
bind pub n !restart pub_do_restart
bind pub n !die pub_do_die
bind pub o|o !mvoice pub_do_massv
bind pub o|o !mop pub_do_massop
bind pub -|o !fishbot pub_do_invfishbot
bind pub n|n !join pub_do_join
bind pub n|n !part pub_do_part
bind msg -|m hop msg_do_hop
bind msg -|- slap msg_do_slap
bind msg -|- hug msg_do_hug
bind msg -|- laugh msg_do_laugh
bind mode - * mode_do_hop
bind pub -|- !do pub_do_doa
bind pub -|- -o/ pub_do_wave
bind pub -|- !leave pub_do_leave
bind pub -|- !invite pub_do_invite
bind pub -|- !bringback pub_do_bringback
bind pub -|- -back pub_do_ba
bind pub -|- !lunch pub_do_lunch

bind join - * pub:join

setudef flag voiceall

#voice all ppl who join the channel
bind join - * pub:join
proc pub:join {nick uhost hand chan} {
if {[channel get $chan voiceall]} {
putserv "mode $chan +v $nick"
}
}
#end of pub:join

#add channel to bot
proc pub_do_join {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !join <#channel>"
return 1
}
if {[validchan $who]} {
putserv "NOTICE $channel :$nick I'm on $who, you are lame."
return 1
}
channel add $who
set owna [nick2hand $nick $channel]
putserv "PRIVMSG $channel :Done: Added new channel: $who."
putserv "PRIVMSG $who :Hi! $who has been sucessfully added to Channel- Database by $nick."
chattr $owna |+amno $who
return 1
}
#end of pub_do_join

#part channel
proc pub_do_part {nick host handle channel testes} {
putserv "PRIVMSG $channel :$channel will now be deleted by $nick. Chow, Chow"
putserv "PRIVMSG $channel :Done: Removed from Channel-Database: $channel"
channel remove $channel
}
#end of pub_do_part

# Invites fishbot to #channel
proc pub_do_invfishbot {nick host handle channel testes} {
global fishbot owner
if {$fishbot == 1} {
if {[onchan fishbot $channel]} {
putserv "PRIVMSG $channel :Test|bot2 is here, lame. Let's NOT have a orgasim, if you do you can clean it..."
return 1
}
if {![onchan fisbot $channel]} {
putserv "INVITE fishbot $channel"
putserv "PRIVMSG $channel :Done: Invited Test|bot2 to $channel by $nick."
}
}
if {$fishbot == 0} {
if {[matchattr $nick +n]} {
putserv "PRIVMSG $channel :This command is disabled. This is not Quakenet."
return 1
}
putserv "PRIVMSG $channel :This command is disabled, it's no Quakenet here according to $owner."
}
}
#end of pub_do_invfishbot

#mass voice
proc pub_do_massv {nick host hand chan arg} { 
foreach {who} [chanlist $chan] { 
if {![botisop $chan]} {
putserv "NOTICE $chan :I'm not op'd, dumbass."
}
if {[isop $who $chan] || [isvoice $who $chan]} { continue } 
pushmode $chan "+v" $who 
} 
flushmode $chan
putserv "NOTICE $chan :Done: Mass-voice on $chan"
}
#end of pub_do_massv

#mass op
proc pub_do_massop {nick host hand chan arg} { 
global fishbotop
foreach {who} [chanlist $chan] { 
if {![botisop $chan]} {
putserv "PRIVMSG $channel :I'm not op'd, Dumbass."
return 1
}
if {[isop $who $chan]} { continue } 
pushmode $chan "+o" $who 
} 
flushmode $chan 
putserv "NOTICE $chan :Done: Mass-op on $chan"
}
#end of pub_do_massop

#userlist
proc pub_do_users {nick uhost hand chan text} {  
     puthelp "PRIVMSG $nick :- \037\002User List\002\037"  
foreach {a b c d} [userlist $chan] {  
     puthelp "PRIVMSG $nick :- [format %-12s%-12s%-12s%-12s $a $b $c $d]" 
     } 
     puthelp "PRIVMSG $nick :- \037\002User List Completed\002\037" 
}
#end of userlist

#banlist
proc pub_do_bans {nick uhost hand chan text} {  
     putserv "PRIVMSG $chan :- \037\002Ban List\002\037"  
foreach {a b c d} [banlist $chan] {  
     putserv "PRIVMSG $chan :- [format %-12s%-12s%-12s%-12s $a $b $c $d]" 
     } 
     putserv "PRIVMSG $chan :- \037\002Ban List Completed\002\037" 
}
#end of banlist

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
putserv "PRIVMSG $channel :\001ACTION loves his owna'\001"
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
putserv "PRIVMSG $channel :\001ACTION does not want his owna' to sleep\001"
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
putserv "PRIVMSG $channel :\001ACTION does want his owna' to wake up\001"
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

#Shower sbody on #channel
proc pub_do_shower {nick host handle channel testes} {  
global botnick showers showeroutput randnum
set who [lindex [split $testes] 0]
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set showers { 
	"watches a bucket of hot water fall on $who"
	"watches a ton of ice cold water fall on $who"
} 
set showeroutput [lindex $showers [rand [llength $showers]]]  
if {$who == ""} {  
putserv "NOTICE $channel :Usage: shower <nick>"  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $showeroutput]\001"
}
#end of pub_do_shower

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
putserv "PRIVMSG $channel :\001ACTION loves his owna'\001"
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
putserv "PRIVMSG $channel :\001ACTION loves his owna'\001"
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
putserv "PRIVMSG $where :\001ACTION likes his owna'\001"
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


# Adds user with flag +ao on #channel to the bot
proc pub_do_addop {nick host handle channel testes} {
set who [lindex $testes 0]
set ophost [getchanhost $who $channel]
set mhost [maskhost [getchanhost $who $channel]]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !addop <Nick to add>"
return 1
}
if {[matchattr [finduser [maskhost $ophost]] +o $channel] == 1} {
putserv "PRIVMSG $channel :$who is in oplist, lame."
return 1
}
adduser $who $mhost
putserv "PRIVMSG $channel :Done: +ao $who on $channel."
set ophandle [nick2hand $who $channel]
chattr $ophandle +hp|+ao $channel
#addhost $ophandle $mhost
}
#End of pub_do_addop

#Make the bot fake op someone (just cos it's fun! =))
proc pub_do_fakeop {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !fop <Nick you want to give fake ops.>"
return 1
}
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd, dumbass."
return 1
}

if {[isop $who $channel]} {
putserv "NOTICE $channel :$who is op'd on $channel."
return 1
} 
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "MODE $channel +o $who"
putserv "MODE $channel -o $who"
putserv "PRIVMSG $channel :How'd it feel to have ops for about 1 second $who?"

putserv "PRIVMSG $channel :$who you are not special!"
}
#End of pub_do_fakeop

#Make the bot fake ban someone (just cos it's fun! =))
proc pub_do_fakeb {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !fb <Nick you want to fake ban.>"
return 1
}
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd."
return 1
}

if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "MODE $channel +b $who"
putserv "MODE $channel -b $who"
putserv "PRIVMSG $channel :How'd it feel to be banned for about 1 second $who?"
}
#End of pub_do_fakeop

#Make the bot fake voice someone (just cos it's fun! =))
proc pub_do_fakevoice {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !fvoice <Nick you want to give fake voice.>"
return 1
}
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd, dumbass."
return 1
}

if {[isvoice $who $channel]} {
putserv "NOTICE $channel :$who is voice'd on $channel, gitersquirt."
return 1
}

if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "MODE $channel +v $who"
putserv "MODE $channel -v $who"
putserv "PRIVMSG $channel :How'd it feel to have voice for about 1 second $who?"
}
#End of pub_do_fakevoice

#Make the bot op someone
proc pub_do_op {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
#if {![botisop $channel]} {
#putserv "NOTICE $channel :I'm not op'd."
#return 1
#}
if {[isop $nick $channel]} {
putserv "NOTICE $channel :You are op'd on $channel, Gimplord. $nick now has the gimps "
return 1
}
putserv "MODE $channel +o $nick"
return 1
}
#if {![botisop $channel]} {
#putserv "NOTICE $channel :I'm not op'd."
#return 1
#}

if {[isop $who $channel]} {
putserv "NOTICE $channel :$who is op'd on $channel."
return 1
} 
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "MODE $channel +o $who"
}
#End of pub_do_op

#Make the bot halfop someone
proc pub_do_halfop {nick host handle channel testes} {
global usehalfop owner
set who [lindex $testes 0]
if {$usehalfop == 1} {
if {$who == ""} {
if {![botisop $channel]} {
putserv "PRIVMSG $channel :I'm not op'd."
return 1
}
if {[ishalfop $channel]} {
putserv "PRIVMSG $channel :You are halfop'd on $channel, GimpPage.$nick has been paged by the gimp."
return 1
}
putserv "MODE $channel +h $nick"
return 1
}
if {![botisop $channel]} {
putserv "PRIVMSG $channel :I'm not op'd, Dumbass."
return 1
}

if {[ishalfop $who $channel]} {
putserv "PRIVMSG $channel :$who is halfop'd on $channel, lameass."
return 1
} 
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I can't see $who on $channel! Change your glasses, degenerate."
putserv "PRIVMSG $channel :eh.."
return 1
} 
putserv "MODE $channel +h $who"
putserv "PRIVMSG $channel :Done: Halfop $who on $channel."
return 1
}
if {$usehalfop == 0} {
if {[matchattr $nick +n]} {
putserv "PRIVMSG $channel :Halfop isn't enabled. To enable, config your script."
return 1
}
putserv "PRIVMSG $channel :Halfop isn't enabled. If this server uses halfop, tell it to $owner"
}
}
#End of pub_do_halfop

#Make the bot voice someone
proc pub_do_voice {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd, Think about it."
return 1
}
if {[isvoice $channel]} {
putserv "NOTICE $channel :You are voice'd on $channel, Thanks."
return 1
}
putserv "MODE $channel +v $nick"
return 1
}
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd, duhhhhh!."
return 1
}

if {[isvoice $who $channel]} {
putserv "PRIVMSG $channel :$who is voice'd on $channel."
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "MODE $channel +v $who"
}
#End of pub_do_voice

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

#Change an existing users attributes 
proc pub_do_chattr {nick host handle channel testes} { 
	set who [lindex $testes 0] 
	set why [lindex $testes 1] 
	set flags [lindex $testes 1] 
	#chattr $who $flags 
	if {$who == ""} { 
		putserv "PRIVMSG $channel :Usage: !chattr <Changer Users attributes.>" 
		return 1 
	} 
	if {[matchattr $who n|n $channel]} { 
		putserv "PRIVMSG $channel :You can't change the owna's attributes!" 
		return 1 
	} 
	chattr $who -|$flags $channel
	putserv "PRIVMSG $channel :Done: Add attribute $why to $who." 
	return 1 
} 
#End of pub_do_chattr

#Kickban someone 
proc pub_do_ban {nick host handle channel testes} {
global botnick
proc gethandle {nick} {
set host [getchanhost $nick]
set handle [finduser "*!$host"]
return $handle
}
set why [lrange $testes 1 end]
set who [lindex $testes 0]
set ban [maskhost [getchanhost $who $channel]]
if {[string tolower $who] == [string tolower $botnick]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :Think that's funny? Trying to make me kickban myself?"
return 1 
}
if {$who == ""} {
putserv "NOTICE $channel :Usage: !kb <nick to bankick> <reason>"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +n|n]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :I cant kickban an owna'"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +I|I]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :I cant kickban $who"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "MODE $channel +b $ban"
putserv "KICK $channel $who :$why"
putserv "PRIVMSG $channel :Done: Kick-Ban $who on $channel with reason: $why."
return 1
}
#End of pub_do_ban

#Delete a host from the banlist.
proc pub_do_unban {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: <Host to unban>"
return 1
}
putserv "MODE $channel -b $who"
putserv "PRIVMSG $channel :Done: Deleted $who from $channel banlist."
return 1
}
#end of pub_do_unban

#Remove host from shitlist
proc pub_do_deshit {nick host handle channel testes} {
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: <Shit to remove>"
return 1
}
killchanban $channel $who
putserv "NOTICE $channel :Done: Delete $who from shitlist of $channel."
return 1
}
#end of pub_do_deshit

#Publically ping the bot (just fun)
proc pub_do_ping {nick host handle channel testes} {
putserv "PRIVMSG $channel :PoNG!!!!!"
return 1
}
#end of pub_do_ping

#Publically marco the bot (just fun)
proc pub_do_marco {nick host handle channel testes} {
putserv "PRIVMSG $channel :POLO!!!!!!!!!"
return 1
}
#end of pub_do_marco

proc pub_do_ding {nick host handle channel testes} {
putserv "PRIVMSG $channel :Congrats!!!!!!!!!!!!! I dont think i want to know what level $nick is at, i am only at 0"
return 1
}

proc pub_do_doa {nick host hand chan text} {
putquick "PRIVMSG $chan :\001ACTION $text\001"
}

proc pub_do_wave {nick host hand chan text} {
putquick "PRIVMSG $chan :\001ACTION waves\001"
}

proc pub_do_leave {nick host hand chan text} {
putquick "PRIVMSG $chan :\001ACTION watches $nick leave\001"
}


#Change topic on channel
proc pub_do_topic {user host handle channel testes} {
set what [lrange $testes 0 end]
if {$what == ""} {
putserv "PRIVMSG $channel :Usage: !topic <Topic you want.>"
return 1
}
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd on $channel dumbass you have to have me op first, duhhhhhhh."
return 1
}
putserv "TOPIC $channel :$what"
return 1
}
#end of pub_do_topic

#Delete an user from the records.
proc pub_do_del {nick host handle channel testes} {
set who [lindex $testes 0]
if {[matchattr $who +n]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :Trying to delete an owna' eh? Funny."
return 1
}
if {$who == ""} {
putserv "NOTICE $channel :Usage: !del <User to Delete>"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
set thandle [nick2hand $who $channel]
if {$thandle == "*"} {
putserv "NOTICE $channel :$who isn't in user database."
return 1
}
deluser $thandle
putserv "NOTICE $channel :Done: Deleted $who from User-Database."
return 1
}
#end of pub_do_del

#Deop someone
proc pub_do_deop {nick host handle channel testes} {
global botnick
proc gethandle {nick} {
set host [getchanhost $nick]
set handle [finduser "*!$host"]
return $handle
}
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !deop <Nick to Deop>"
return 1
}
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :I donno why you'r so lame to want to deop yourself $nick, but i'm gonna do it."
putserv "MODE $channel -o $nick"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +I|I]} {
putserv "PRIVMSG $channel :I cant deop $who"
return 1
}
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd, lamer."
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :Think that's funny ? Trying to make me deop myself ? Leave me alone"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +n]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :I aint deopin my owna'!"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
if {![isop $who $channel]} {
putserv "PRIVMSG $channel :$who is already deop'd, clean your glasses."
return 1
}

putserv "MODE $channel -o $who"
return 1
}
#end of pub_do_deop

#Dehalfop someone
proc pub_do_dehalfop {nick host handle channel testes} {
global botnick
set who [lindex $testes 0]
if {$usehalfop == 1} {
if {$who == ""} {
putserv "PRIVMSG $channel :Usage: !dehalfop <Nick to Devoice>"
return 1
}
if {![botisop $channel]} {
putserv "PRIVMSG $channel :I'm not op'd, lame."
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "MODE $channel -h $nick"
putserv "PRIVMSG $channel :Think that's funny? Trying to make me dehalfop myself?."
return 1
}
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :I donno why you'r so lame to want to dehalfop yourself $nick, but i'm gonna do it."
putserv "MODE $channel -h $nick"
return 1
}
if {[matchattr $who +n]} {
putserv "MODE $channel -h $nick"
putserv "PRIVMSG $channel :I aint dehalfopin my owna'!"
return 1
}
if {![ishalfop $who $channel]} {
putserv "PRIVMSG $channel :$who is already dehalfop'd."
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "MODE $channel -h $who"
return 1
}
if {$usehalfop == 0} {
if {[matchattr $nick +n]} {
putserv "PRIVMSG $channel :Halfop isn't enabled. No need on Undernet."
return 1
}
putserv "PRIVMSG $channel :Halfop isn't enabled. If this server uses halfop, tell it to $owner"
}
}
#end of pub_do_dehalfop

#Devoice someone
proc pub_do_devoice {nick host handle channel testes} {
global botnick
set who [lindex $testes 0]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !devoice <Nick to Devoice>"
return 1
}
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd, lame."
return 1
}
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :I donno why you'r so lame to want to devoice yourself $nick, but i'm gonna do it."
putserv "MODE $channel -v $nick"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
if {![isvoice $who $channel]} {
putserv "NOTICE $channel :$who is already devoice'd."
return 1
}
putserv "MODE $channel -v $who"
return 1
}
#end of pub_do_devoice

#Kick someone
proc pub_do_kick {nick host handle channel testes} {
global botnick
proc gethandle {nick} {
set host [getchanhost $nick]
set handle [finduser "*!$host"]
return $handle
}
set who [lindex $testes 0]
set why [lrange $testes 1 end]
if {[string tolower $who] == [string tolower $botnick]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :Dont go trying to kick me $nick"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +I|I]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :I cant kick $who"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +n|n]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :$nick Trying to kick an owna' eh?"
return 1
}
if {$who == $nick} {
putserv "PRIVMSG $channel :Why the hell do you want to kick yourself $nick?"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
if {$who == ""} {
putserv "PRIVMSG $channel :Usage: !kick <nick to kick>"
return 1
}
if {![botisop $channel]} {
putserv "PRIVMSG $channel :I'm not op'd, dummy."
return 1
}
putserv "KICK $channel $who :$why (Leave us alone $who, $nick does not want you here)"
return 1
}
#End of pub_do_kick

#remove someone
proc pub_do_remove {nick host handle channel testes} {
global botnick
proc gethandle {nick} {
set host [getchanhost $nick]
set handle [finduser "*!$host"]
return $handle
}
set who [lindex $testes 0]
set why [lrange $testes 1 end]
if {[string tolower $who] == [string tolower $botnick]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :Dont go trying to remove me $nick"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +I|I]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :I cant remove $who"
return 1
}
set hand [gethandle $who]
if {[matchattr $hand +n|n]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :Trying to remove an owna' eh?"
return 1
}
if {$who == ""} {
putserv "NOTICE $channel :Usage: !remove <nick to remove>"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
putserv "REMOVE $channel $who :$why (removed by $nick)"
return 1
}
#End of pub_do_remove


#Permban someone
proc pub_do_pban {nick host handle channel testes} {
global botnick
set why [lrange $testes 1 end]
set who [lindex $testes 0]
set ban [maskhost [getchanhost $who $channel]]
if {$who == ""} {
putserv "PRIVMSG $channel :Usage: !shit <Nick to shitlist>"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "KICK $channel $nick :Eh, funny."
return 1
}
if {[matchattr $who +n]} {
putserv "NOTICE $who :$nick tried to shitlist you. Better have a talk with him."
putserv "PRIVMSG $channel :You tried to shitlist $who, He's the owna'! I tell it him now..."
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
} 
newchanban $channel $ban $nick $why
stick $ban $channel
putserv "KICK $channel $who :$why (shitlisted by $nick)"
return 1
}
#end of pub_do_pban

#Set the bot away.
proc pub_do_away {nick host handle channel testes} {
set why [lrange $testes 0 end]
if {$why == ""} {
putserv "PRIVMSG $channel :!away <away msg>"
return 1
}
putserv "AWAY :$why"
putserv "PRIVMSG $channel :Done: Set away with reason: $why."
return 1
}
#end of pub_do_away

#Set the bot back.
proc pub_do_back {nick host handle channel testes} {
putserv "AWAY :"
putserv "PRIVMSG $channel :Done: Back from away."
}
#end of pub_do_back

#Make the bot MSG someone...
proc pub_do_msg {nick host handle channel testes} {
set who [lindex $testes 0]
set why [lrange $testes 1 end]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !msg <nick> <message>"
return 1
}
putserv "PRIVMSG $who :$why"
putserv "NOTICE $channel :Done: Msg $who with: $why"
return 1
}
#end of pub_do_msg

#Add a user to the bot
proc pub_add_user {nick host handle channel testes} {
set who [lindex $testes 0]
set thost [getchanhost $who $channel]
set mhost [maskhost [getchanhost $who $channel]]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !adduser <User to Add.>"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I can't see $who on $channel!"
return 1
} 
adduser $who $mhost
putserv "PRIVMSG $channel :Done: Add $who to User-Database."
set thandle [nick2hand $who $channel]
chattr $thandle +h
#addhost $thandle $mhost
return 1
}
#end of pub_add_user

#Add a MASTER to the bot.
proc pub_do_addm {nick host handle channel testes} {
set who [lindex $testes 0]
set masterhost [getchanhost $who $channel]
set mhost [maskhost [getchanhost $who $channel]]
if {$who == ""} {
putserv "NOTICE $channel :Usage: !addm <Nick to add>"
return 1
}
if {[matchattr [finduser [maskhost $masterhost]] +m $channel] == 1} {
putserv "NOTICE $channel :$who is a master, lame."
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I dont see $who on $channel"
return 1
}
adduser $who $mhost
putserv "PRIVMSG $channel :Done: +amo $who on $channel."
set ophandle [nick2hand $who $channel]
chattr $ophandle +hp|+amo $channel
#addhost $ophandle $mhost
}
#End of pub_do_addm

#Make he bot fuck someone (just 4 fun)
proc pub_do_fuck {nick host handle channel testes} {
global botnick dofuck owner
set who [lindex $testes 0]
if {$dofuck == 1} {
if {$who == ""} {
if {[matchattr $nick +n]} {
putserv "PRIVMSG $channel :I don't wanna fuck ya, mummy."
return 1
}
putserv "PRIVMSG $channel :Get lost ya fuckin' asshole!"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "MODE $channel -o $nick"
putserv "PRIVMSG $channel :Haha, I don't wanna fuck myself, asshole."
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :I don't wanna fuck my owna'. Get lost $nick."
putserv "MODE $channel -o $nick"
return 1
}
if {![onchan $who $channel]} {
putserv "PRIVMSG $channel :I can't see $who on $channel! Change your glasses, lame."
putserv "PRIVMSG $channel :eh.."
return 1
} 
putserv "PRIVMSG $channel :Get lost $who, ya fuckin' asshole."
return 1
}
if {$dofuck == 0} {
if {[matchattr $nick +n]} {
putserv "PRIVMSG $channel :Fuckin' isn't enabled. To enable, config your script."
return 1
}
putserv "PRIVMSG $channel :Fuckin' isn't enabled. If you want to use this bad word, tell it to $owner"
}
}
#End of pub_do_fuck

#Change the mode in the channel
proc pub_do_mode {nick host handle channel testes} {
set who [lindex $testes 0]
if {![botisop $channel]} {
putserv "NOTICE $channel :I'm not op'd on $channel."
return 1
}
if {$who == ""} {
putserv "NOTICE $channel :Usage: !mode <Channel mode you want to set>"
return 1
}
putserv "MODE $channel $who"
return 1
}
#end of pub_do_mode

#change channel settings
proc pub_do_ccs {nick host handle channel testes} {
global chanset
set why [lrange $testes 0 end]
if {$why == ""} {
putserv "NOTICE $channel :Usage :!ccs <settings> :Valid settings are + means yes, - means no :autoop, clearbans, enforcebans, dynamicbans, userbans, bitch, greet, protectops and statuslog. " 
return 1
}
channel set $channel $why
putserv "NOTICE $channel :Done: Change settings on $channel to $why."
return 1
}
#End of pub_do_ccs

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

#kill the bot
proc pub_do_die {nick host handle channel testes} {
set why [lrange $testes 0 end]
	if {[matchattr $handle +n]} {
	putserv "NOTICE $channel :Done: Die with reason: $why"
	die $why
}
}

#end of pub_do_die

# rehash the bot
proc pub_do_rehash {nick host handle channel testes} {
if {[matchattr $handle +n]} {
	rehash
	putserv "NOTICE $channel :Done: Rehash."
}
}
#end of pub_do_rehash

# reload the userfile
proc pub_do_reload {nick host handle channel testes} {
	if {[matchattr $handle +n]} {
	reload
	putserv "NOTICE $channel :Done: Reload."
}
}

# restart the bot
proc pub_do_restart {nick host handle channel testes} {
	if {[matchattr $handle +n]} {
	putserv "NOTICE $channel :Restarting..."
	restart
}
}
#end of pub_do_restart

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

#make rejoin the bot from privmsg
proc msg_do_hop { nick uhost hand text } {
 putserv "PART :$text"
 putserv "JOIN :$text"
 }
#end of msg_do_hop

proc mode_do_hop { nick uhost hand chan mc vict } {
global hopondeop kickondeop botnick owner
if {$mc == "-o" && $vict == $botnick && $hopondeop == 1} {
 putlog "Hopping channel $chan due to deop"
 putserv "PRIVMSG $chan :"
 putserv "PART :$chan"
 putserv "JOIN :$chan"
 putserv "PRIVMSG $chan :"
  if {$nick != $owner && $kickondeop == 1} {
   putserv "KICK $chan $nick"
}
}
}

# Invites fishbot to #channel
proc pub_do_invite {nick host hand chan text} {
if {[onchan $text $chan]} {
putserv "PRIVMSG $chan :I see $text is already on $chan"
return 1
} 
if { (( [matchattr $hand o|o $chan] || [isop $nick $chan] ) && $text != "") } {
putserv "INVITE $text $chan" 
putserv "PRIVMSG $text :$nick has invited you to $chan"
putserv "PRIVMSG $chan :Done: Invited $text by $nick."
return
}
putserv "PRIVMSG $chan :$nick you cant do that!" 
}
#end of pub_do_invite

#bringback sbody on #channel
proc pub_do_bringback {nick host handle channel testes} {  
global botnick backs backput randnum
set who [lindex [split $testes] 0]
if {[string tolower $who] == [string tolower $nick]} {
putserv "PRIVMSG $channel :Eh... Don't waste my time, you are here already!"
return 1
}
if {[string tolower $who] == [string tolower $botnick]} {
putserv "PRIVMSG $channel :leave me alone"
return 1
}
if {[matchattr $who +n]} {
putserv "PRIVMSG $channel :\001ACTION wants his owna' to return\001"
return 1
}
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set backs { 
	"shouts 'Where is $who'"
	"screams '$who get back here' "
	"wonders when $who will return"
} 
set backput [lindex $backs [rand [llength $backs]]]  
if {$who == ""} {  
putserv "NOTICE $channel :Usage: !bringback <nick>"  
return 1  
}
putserv "PRIVMSG $channel :\001ACTION [subst $backput]\001"
}

#bringback sbody on #channel
proc pub_do_ba {nick host handle channel testes} {  
if {$testes != ""} {return}
global botnick back backput randnum
set who [lindex [split $testes] 0]
set randnum [expr [rand [expr (1000-500+1)]] + 500]
set back { 
	" wb $nick"
	} 
set backput [lindex $back [rand [llength $back]]]  
putserv "PRIVMSG $channel :[subst $backput]"
}
#end of pub_do_bringback

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