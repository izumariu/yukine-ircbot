require 'cinch'

nice_users = [
	"sessho",
	"moeterfan",
	"nola",
	"zuckerwatte",
	"zucker",
	"rai",
	"raipat"
]



$NICE = false

ircBot = Cinch::Bot.new do
	configure do |c|
		c.nick = "yukine"
		c.user = "yukine"
		c.server = "irc.moep.net"
		c.channels = ["#klartraum"]
	end
	
	on :message, /yukine/ do |m|
		nice_users.each do |user|
			if m.user.nick.downcase == user.downcase
				$NICE = true
				debug "#{m.user.nick.downcase} matched #{user.downcase}!"
				break
			else
				$NICE = false
				debug "#{m.user.nick.downcase} did not match #{user.downcase}."
			end
		end
		if $NICE == true
		
			n_msg = [
				"#{m.user.nick} versteht mich, der Rest außer gewissen anderen Personen nicht ;__;",
				#"Können wir mal kurz reden, #{m.user.nick}? Bitte, ich will Zeit mit dir verbringen.... wir sehen uns so selten...",
				"#{m.user.nick} ist echt wunderbar.... :)",
				"#{m.user.nick} unterstützt Yato! Nehmt euch mal ein Beispiel! -.-",
				"#{m.user.nick}: *erröt*"
			]
			m.reply(n_msg[Random.rand(n_msg.length)])
			
		else
		
			f_msg = [
				"Ach, halt doch die Klappe, #{m.user.nick} -.-#",
				"Warum muss ICH alleine sein?!?!? WARUM?!?!?",
				"Ihr versteht mich alle nicht!! WAS IST EUER PROBLEM?!?",
				"War ja klar. Ich bin wieder der Dumme. Wie immer. Ich hasse es.",
				"Anstatt mal Yato zu unterstützen müsst ihr alle hier herumlungern....",
				"Boah, #{m.user.nick} hat sich wieder mal nicht gewaschen...",
				"#{m.user.nick}: Natürlich, ich hab ja keine anderen Probleme, du Nervensäge -.-",
				"#{m.user.nick}: Du liebst es, auf mir herumzuhacken, nicht wahr? -.-#"
			]
			m.reply(f_msg[Random.rand(f_msg.length)])
				
		$NICE = false
		
		end
		
		on :privmsg, /./m do |m|
			debug "MESSAGE INCOMING!"
			m.reply("#{m.user.nick}: Ich nehme generell keine privaten Nachrichten an. UND DAS GILT FÜR ALLE HIER!!!")
		end
	end
end

ircBot.start
