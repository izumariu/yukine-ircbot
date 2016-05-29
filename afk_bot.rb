#!/usr/bin/ruby
require 'cinch' #gem install cinch

ircBot = Cinch::Bot.new do
	configure do |c|
		c.server = "irc.moep.net"
		c.channels = ["#klartraum"]
		c.nick = "sessho_ist_afk_bot"
		c.user = "sessho_ist_afk_bot"
	end
	
	on :message, /sessho/ do |m|
		r_msgs = [
			"ICH BIN NICHT DA!!!",
			"Hört auf, über mich zu reden! Ich bin AFK!",
			"Ich bin nicht da, versteht ihr das nicht?",
			"Ähm... hallo? Ich bin abwesend?",
			"Ist mir egal, was mit mir ist, ich bin eh grad nicht hier!"
		]
		m.reply(r_msgs[Random.rand(r_msgs.length)])
	end
	
end

ircBot.start
