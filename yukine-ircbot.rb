#!/usr/bin/ruby
require 'cinch' #gem install cinch

$nice_users = [
	"sessho",
	"moeterfan",
	"nola",
	"zuckerwatte",
	"rai",
	"raipat",
	"efa"
]

$NICE = false
$SH = false



ircBot = Cinch::Bot.new do
	configure do |c|
		c.nick = "yukine"
		c.user = "yukine"
		c.server = "irc.moep.net"
		c.channels = ["#klartraum"]
	end
	
	on :message, /\s{0}\S{1,}\+\+.{0}/m do |m|
		if m.params[1].split("++")[0].downcase != "yukine"
			$nice_users.each do |user|
				if m.params[1].split("++")[0].downcase == user.downcase
					$NICE = true
					debug "#{m.params[1].split("++")[0].downcase} matched #{user.downcase}!"
					break
				else
					$NICE = false
					debug "#{m.params[1].split("++")[0].downcase} did not match #{user.downcase}."
				end
			end
			sleep 5
			if $NICE == true
				n_msg = [
					"#{m.params[1].split("++")[0]} hat dieses Lob verdient!",
					#"Können wir mal kurz reden, #{m.params[1].split("++")[0]}? Bitte, ich will Zeit mit dir verbringen.... wir sehen uns so selten...",
					"#{m.params[1].split("++")[0]}: Stimmt, da hat sie Recht... wenn es nichts perverses ist...",
					"#{m.params[1].split("++")[0]}: Definitiv!",
					"#{m.params[1].split("++")[0]}: Muss ich efa Recht geben!"
				]
				m.reply(n_msg[Random.rand(n_msg.length)])
			else
				f_msg = [
					"Scher dich dahin, wo der Pfeffer wächst, #{m.params[1].split("++")[0]} -.-#",
					#"Ihr versteht mich alle nicht!! WAS IST EUER PROBLEM?!?",
					"#{m.params[1].split("++")[0]} hat sich das nicht verdient, so gelobt zu werden...",
					#"Anstatt mal Yato zu unterstützen müsst ihr alle hier herumlungern....",
					"Boah, #{m.params[1].split("++")[0]}? Das glaubst du ja wohl selber nicht, efa!",
					"#{m.params[1].split("++")[0]}: Sei doch so nett und HALT DIE KLAPPE.",
					"#{m.params[1].split("++")[0]}: Ist klar. Du hast bisher noch NICHTS in diesem IRC hier richtig gemacht. Und in deinem Leben wahrscheinlich auch nicht."
				]
				m.reply(f_msg[Random.rand(f_msg.length)])
			end
		else
			sleep 5
			m.reply("Danke, efa... *erröt*")
		end
		$NICE = false
	end
	
	on :message, /\s{0}\S{1,}\-\-.{0}/m do |m|
		if m.params[1].split("--")[0].downcase != "yukine"
			$nice_users.each do |user|
				if m.params[1].split("--")[0].downcase == user.downcase
					$NICE = true
					debug "#{m.params[1].split("--")[0].downcase} matched #{user.downcase}!"
					break
				else
					$NICE = false
					debug "#{m.params[1].split("--")[0].downcase} did not match #{user.downcase}."
				end
			end
			sleep 5
			if $NICE == true
				n_msg = [
					"#{m.params[1].split("--")[0]} hat das nicht verdient! :(",
					#"Können wir mal kurz reden, #{m.params[1].split("--")[0]}? Bitte, ich will Zeit mit dir verbringen.... wir sehen uns so selten...",
					"#{m.params[1].split("--")[0]} beleidigen! Die schlechteste Idee, auf die du je gekommen bist, efa!",
					"#{m.params[1].split("--")[0]}: Hör nicht auf efa, sie meint es nicht so...",
					"#{m.params[1].split("--")[0]}: efa ist eine alte Schrapnelle, nimm das nicht ernst."
				]
				m.reply(n_msg[Random.rand(n_msg.length)])
			else
				f_msg = [
					"Scher dich dahin, wo der Pfeffer wächst, #{m.params[1].split("--")[0]} -.-#",
					#"Ihr versteht mich alle nicht!! WAS IST EUER PROBLEM?!?",
					"#{m.params[1].split("--")[0]} hat sich das verdient, so gedemütigt zu werden...",
					#"Anstatt mal Yato zu unterstützen müsst ihr alle hier herumlungern....",
					"Boah, #{m.params[1].split("--")[0]}! Einer muss es ja sagen, efa!",
					"#{m.params[1].split("--")[0]}: Genau. Sei doch so nett und HALT DIE KLAPPE.",
					"#{m.params[1].split("--")[0]}: Siehst du? Du hast bisher noch NICHTS in diesem IRC hier richtig gemacht. Und in deinem Leben wahrscheinlich auch nicht."
				]
				m.reply(f_msg[Random.rand(f_msg.length)])
			end
		else
			sleep 5
			m.reply("efa!! WARUM NUR??? *efa eine knall*")
		end
		$NICE = false
	end
	
#	on :message, "!nice-on" do |m|
#		$being_nice = Thread.new {
#			loop do
#				g_msgs = [
#					" ist übrigens eine ganz tolle Person! :)",
#					" macht seine/ihre Sache gut.",
#					" ist mir einfach total sympathisch!",
#					"... hat dir heute schon mal jemand gesagt, dass du echt gut aussiehst?",
#					" mag mich hoffentlich. Ich mag die Person nämlich auch sehr...",
#					", wenn du nicht wärst, was wäre dann? Also ich definitiv nicht.",
#					", ach, wenn du wüsstest, was du für ein toller Mensch bist... :)",
#					", kannst du bitte Yato 5 Yen spenden? Das wär so nett von dir.... ;)"
#				]
#				m.reply($nice_users[Random.rand($nice_users.length)] << g_msgs[Random.rand(g_msgs.length)])
#				sleep 5
#			end
#		}
#	end
#	
#	on :message, "!nice-off" do |m|
#		Thread.kill($being_nice)
#	end
	
	on :message, "!sh-off" do |m|
		if m.user.nick == "moeterfan"
			$SH = false
			debug "$SH is now #{$SH}"
			m.reply("moeterfan verbietet jetzt das Lästern über ihre Schwester!")
		else
			m.reply("#{m.user.nick}: Du bist nicht moeterfan und hast nicht das Recht dazu, diese Eigenschaft zu modifizieren!")
		end
	end
	
	on :message, "!sh-on" do |m|
		if m.user.nick == "moeterfan"
			$SH = true
			debug "$SH is now #{$SH}"
			m.reply("moeterfan erlaubt das Lästern über ihre Schwester wieder!")
		else
			m.reply("#{m.user.nick}: Du bist nicht moeterfan und hast nicht das Recht dazu, diese Eigenschaft zu modifizieren!")
		end
	end
	
	on :message, "!sh" do |m|
		if $SH == true
		c_msgs = [
			"Möterfans Schwester ist so fett, wenn die am frühen Morgen mit einem gelben Shirt den Berg raufrennt, denken alle, die Sonne geht auf.",
			"Möterfans Schwester ist eine alte Schrapnelle.",
			"Möterfans Schwester ist so blöd, die wirft ne Orange auf den Boden und schreit „Los, Pikachu!“.",
			"Möterfans Schwester ist so dumm, die kackt vor ALDI, weil da „Bitte drücken“ steht.",
			"Möterfans Schwester ist so arm, dass sogar die Enten sie mit Brot bewerfen.",
			"Möterfans Schwester ist so fett, immer wenn sie mit High-Heels ausgeht, kommt sie mit Flip-Flops zurück.",
			"Möterfans Schwester schmeißt die Schule hin und wird Pokémon Trainer.",
			"Möterfans Schwester ist so hässlich, bei ihr wird eingebrochen nur um die Vorhänge zu schließen.",
			"Möterfans Schwester bestellt sich oft gleich zweimal das All-You-Can-Eat Menü.",
			"Möterfans Schwester ist so hässlich, Gott musste sofort das Licht wieder ausmachen, nachdem er „Es werde Licht“ gesagt hat.",
			"Möterfans Schwester ist so fett, das Foto von der 1. , Schulklasse druckt immer noch.",
			"Möterfans Schwester ist so fett, wenn man sie überfahren will, muss man auf der Hälfte nachtanken.",
			"Möterfans Schwester nutzt einen Telefonjoker, um zu fragen, welche Farbe das Weiße Haus hat.",
			"Möterfans Schwester ist so haarig, wenn sie mit ihrem Hund spazieren geht, wird sie zuerst gestreichelt.",
			"Möterfans Schwester ist so fett, als sie in den Grand Canyon fiel, ist sie stecken geblieben.",
			"Möterfans Schwester ist so fett, ihre Fingernägel lässt sie von einem Maler lackieren.",
			"Möterfans Schwester ist so fett, sie hat das iPad erfunden, als sie sich auf das iPhone gesetzt hat.",
			"Möterfans Schwester ist so dumm, sie denkt, USB ist das Nachbarland von USA.",
			"Möterfans Schwester stampft Trauben für den Tetra-Pack Wein.",
			"Möterfans Schwester heißt Dieter und abonniert Trucker-Magazine.",
			"Möterfans Schwester hat nur ein Bein und wird trotzdem getunnelt.",
			"Möterfans Schwester hat sogar Schulden beim 1€ Shop.",
			"Möterfans Schwester steckt sich eine Münze ins Ohr, wenn sie 50 Cent hören will.",
			"Möterfans Schwester ist so arm, sie kratzt an den Bäumen nach Harz IV.",
			"Ach ja, McDonalds hat angerufen: Möterfans Schwester steckt besoffen in der Rutsche fest.",
			"Wenn Möterfans Schwester vom Hochhaus springt, singt sie „Wenn der Mond auf mein Ghetto scheint“.",
			"Möterfans Schwester sortiert den Wühltisch bei KiK.",
			"Möterfans Schwester steht nackt vor KiK und schreit „ICH BIN BILLIGER!!!“.",
			"Möterfans Schwester verheddert sich im schnurlosen Telefon.",
			"Möterfans Schwester sitzt auf dem Fernseher und guckt Couch.",
			"Möterfans Schwester rennt 10 Minuten ums Haus, damit sie Vorsprung vor Dieben hat"
		]
		m.reply(c_msgs[Random.rand(c_msgs.length)])
		else
		m.reply("#{m.user.nick}: moeterfan will das nicht!")
		end
	end
	
	on :message, "!iloveyuki" do |m|
		$nice_users.each do |user|
			if m.user.nick.downcase == user.downcase
				$NICE = true
				debug "#{m.user.nick.downcase} matched #{user.downcase}!"
				break
			else
				$NICE = false
				debug "#{m.user.nick.downcase} did not match #{user.downcase}."
			end
		end
		debug "Match: #{$NICE}"
		if $NICE == true
				a_msg = [
					"Ich mag dich auch... :)",
					"Du bist wirklich toll... :)"
				]
				m.reply("#{m.user.nick}: " << a_msg[Random.rand(a_msg.length)])
			else
				a_msg = [
					"Du lügst, ohne rot zu werden. Respekt.",
					"Als ob. -.-"
				]
				m.reply("#{m.user.nick}: " << a_msg[Random.rand(a_msg.length)])
			end
		$NICE = false
	end
	
	on :message, /yukine/ do |m|
		if m.user.nick != "efa" and (m.params[1][-1] != "-" and m.params[1][-2] != "-") and (m.params[1][-1] != "+" and m.params[1][-2] != "+")
			$nice_users.each do |user|
				if m.user.nick.downcase == user.downcase
					$NICE = true
					debug "#{m.user.nick.downcase} matched #{user.downcase}!"
					break
				else
					$NICE = false
					debug "#{m.user.nick.downcase} did not match #{user.downcase}."
				end
			end
			
			debug "#{m}"
			
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
					#"Ihr versteht mich alle nicht!! WAS IST EUER PROBLEM?!?",
					"War ja klar. Ich bin wieder der Dumme, nicht wahr, #{m.user.nick}? Wie immer. Ich hasse es.",
					"Anstatt mal Yato zu unterstützen müsst ihr alle hier herumlungern....",
					"Boah, #{m.user.nick} hat sich wieder mal nicht gewaschen...",
					"#{m.user.nick}: Natürlich, ich hab ja keine anderen Probleme, du Nervensäge -.-",
					"#{m.user.nick}: Du liebst es, auf mir herumzuhacken, nicht wahr? -.-#"
				]
				m.reply(f_msg[Random.rand(f_msg.length)])
					
			end
		end
	end
	$NICE = false
end

ircBot.start
