// This system defines news that will be displayed in the course of a round.
// Uses BYOND's type system to put everything into a nice format.
/datum/news_announcement
	var
		round_time // time of the round at which this should be announced, in seconds
		message // body of the message
		author = "Liberty Group Editor"
		channel_name = "Liberty Daily"
		can_be_redacted = 0
		message_type = "Story"

	ceti_station_overtake

		program
			round_time = 60*10
			message = {"Reports have leaked that HexaOptimum has launched revolutionary program aboard
						it's Tau Ceti research station Gamma focused on reproducing long eliminated
						plagues and pathogens. What the reason behind this is was kept from us by
						HexaOptimum security forces."}
			author = "Intern Editor TC-WD-344"
			channel_name = "The Tau Ceti Monthly"

		contact_loss
			round_time = 60*40
			message = {"Earlier reports have proven to be true as station Gamma has seemingly lost any
						contact with it's sister stations, dispatched PentaOptium vessel failed to
						report to back it's command post and most assume the worst. We will keep you all
						updated on developments."}
			author = "Intern Editor TC-WD-344"
			channel_name = "The Tau Ceti Monthly"

		agent
			round_time = 60*90
			message = {"The worse has come to worst, the patrol vessel was shot down by the station
						defenses and any further attempts have been put on hold. However we recieved
						promising reports of an inside agent working on resolving the situation, what
						said situation is still unknown but possibly related to recent wave of BEL
						terror attacks."}
			author = "Intern Editor TC-WD-344"
			channel_name = "The Tau Ceti Monthly"

		ceti_station_ending
			round_time = 60*120
			message = {"We finally recieved fresh report on the station Gamma station situation.
						In unprecedented act of heroism a trio of cryoslept cybernetically enhanced
						HexaOptimum employees managed to dispatch around fourty Black Eagle legionaries
						with only procured equipment. The current CEO Salazar Diego refused to comment on
						this entire debacle but has promised to award these brave souls and hold a ceremony
						for those that have fallen in defense of progress."}
			author = "Intern Editor TC-WD-344"
			channel_name = "The Tau Ceti Monthly"

	astrakhan_strike

		a_new_plant
			author = "Editor Carl Ritz"
			channel_name = "The Worker's Truth"
			round_time = 60*20
			message = {"A new motor pool has been opened on the 27th January and already there has been
						disagreements over it's intended purpose, while mayor Henderson has cited his predecesor's
						speech about the need for Tabila to industrilize this only served more to anger the farmers.
						Over 1000 citizens have rallied on town's square in protest and demanded closure of the pool,
						this was after 3 hours dispersed under pretenses of public health safety due to rapidly spreading
						C2-11 plague within the county."}

	random_junk

		cheesy_honkers
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Pallas Mammoth"
			message = {"Do cheesy honkers increase risk of having a miscarriage? Several health administrations
						say so!"}
			round_time = 60 * 15

		net_block
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Pallas Mammoth"
			message = {"Several corporations banding together to block access to 'wetskrell.nt', site administrators
			claiming violation of net laws."}
			round_time = 60 * 50

		found_ssd
			channel_name = "The Solarian Courier"
			author = "Doctor Eric Hanfield"

			message = {"Several people have been found unconscious at their terminals. It is thought that it was due
						to a lack of sleep or of simply migraines from staring at the screen too long. Camera footage
						reveals that many of them were playing games instead of working and their pay has been docked
						accordingly."}
			round_time = 60 * 90

	lotus_tree

		explosions
			channel_name = "The Solarian Courier"
			author = "Reporter Leland H. Howards"

			message = {"The newly-christened civillian transport Lotus Tree suffered two very large explosions near the
						bridge today, and there are unconfirmed reports that the death toll has passed 50. The cause of
						the explosions remain unknown, but there is speculation that it might have something to do with
						the recent change of regulation in the Moore-Lee Corporation, a major funder of the ship, when M-L
						announced that they were officially acknowledging inter-species marriage and providing couples
						with marriage tax-benefits."}
			round_time = 60 * 30

	food_riots

		breaking_news
			channel_name = "The Solarian Courier"
			author = "Reporter Ro'kii Ar-Raqis"

			message = {"Breaking news: Food riots have broken out throughout the Refuge asteroid colony in the Tenebrae
						Lupus system. This comes only hours after Terran officials announced they will no longer trade with the
						colony, citing the increased presence of \"hostile factions\" on the colony has made trade too dangerous to
						continue. Terran officials have not given any details about said factions. More on that at the top of
						the hour."}
			round_time = 60 * 10

		more
			channel_name = "The Solarian Courier"
			author = "Reporter Ro'kii Ar-Raqis"

			message = {"More on the Refuge food riots: The Refuge Council has condemned Terran withdrawal from
			the colony, claiming \"there has been no increase in anti-Terran activity\", and \"\[the only] reason
			Federation withdrew was because the \[Tenebrae Lupus] system's Hydrogen clathrates have been completely mined out.
			We have little to trade with them now\". Federation officials have denied these allegations, calling them
			\"further proof\" of the colony's anti-Terran stance. Meanwhile, Refuge Security has been unable to quell
			the riots. More on this at 6."}
			round_time = 60 * 60
/*
	colonial_occourences

		underground_activities
			author = "Editor Rowling Mancier"
			channel_name = "The Sounds of Liberty"
			round_time = 60*20
			message = pick(list(
				"In a surge reminiscent of migrations, more colonial refugees are flocking to Freeport Liberty, our neutral outpost amidst the frontier turmoil. \
				The colonial warfare, piracy, and economic hardships have displaced countless families from their homes. Now facing severe financial strain, \
				many colonies grapple with crumbling infrastructure and collapsing services. Soaring costs of living and rampant inflation \
				drive families to seek refuge in Freeport Liberty, a symbol of stability in the frontier on the brink. All coming from tight-packed, entrepreneur private ships, \
				their only option for space travel after selling all their assets for a mere travel and edge of a stateroom.",

				"Renowned for their nomadic prowess and agility, the Sablekyne species, often associated with piracy, is undergoing a significant shift. \
				A curiously large number of Sablekyne refugees are choosing sanctuary in Freeport Liberty amid cosmic conflicts, distancing from Kriosan sovereignty. \
				This paradigm sees Sablekyne actively rejecting their species' piracy stereotype. Opting for Freeport Liberty for a new beginning, \
				liberated from criminal stereotypes and embracing their traditional peace-seeking culture before their homeplanet annexation by the Kriosan.",

				"Guided by the human ideals of freedom and autonomy, some Kriosan citizens - rebels and moderates - driven by a pursuit of personal liberty, \
				challenges the societal norms of honor, loyalty and collectivism that once shaped their existence.  Now seeking an inclusive environment, \
				Freeport Liberty was the choice of many of these refugees this week, which may go noticed by our fellow Sablekyne and Neptunians, but hopefully \
				the past narratives will not go toe-to-toe with the current ones, as those who dwell on freeport lands are unbound by the rigid principles of authoritarian past.",

				"After an exhaustive month-long quest tinged with anxiety, rescuers on this day located the remnants of the handwrought Sharley Ship, which vanished during its expedition to explore wreckage. \
				All nine entrepenours has perished. This outcome, not anticipated by those who harbored even the slightest hope of a successful rescue, prompted divergent reactions \
				- with the public on FacePalm social media downplaying the tragedy of the lost lives. 'The Ship imploded, instantly killing nine billionaries. Can we now address the hypocritical double \
				standards for Sablekyne migrants left in the void trying reach here?' remarked one user. 'The rich deserve to meet their demise in space, on the skies- just anywhere. \
				We don't deserve the consequences billionaries intentionally cause for profit,'posted another. The response diverges from reaction to other tragedies, despite potential \
				flaw in the ships design - something remarked even by Black Bolt Company - and questions about the necessity of exploring space wreckage without using Custodian Gatepyre \
				Technology, the stark reality remains... families will never reunite with their loved ones."
			))
*/

var/global/list/newscaster_standard_feeds = list(/datum/news_announcement/ceti_station_overtake, /datum/news_announcement/astrakhan_strike, /datum/news_announcement/lotus_tree, /datum/news_announcement/random_junk,  /datum/news_announcement/food_riots)

proc/process_newscaster()
	check_for_newscaster_updates(SSticker.newscaster_announcements)

var/global/tmp/announced_news_types = list()
proc/check_for_newscaster_updates(type)
	for(var/subtype in typesof(type)-type)
		var/datum/news_announcement/news = new subtype()
		if(news.round_time * 10 <= world.time && !(subtype in announced_news_types))
			announced_news_types += subtype
			announce_newscaster_news(news)

proc/announce_newscaster_news(datum/news_announcement/news)
	var/datum/feed_channel/sendto
	for(var/datum/feed_channel/FC in news_network.network_channels)
		if(FC.channel_name == news.channel_name)
			sendto = FC
			break

	if(!sendto)
		sendto = new /datum/feed_channel
		sendto.channel_name = news.channel_name
		sendto.author = news.author
		sendto.locked = 1
		sendto.is_admin_channel = 1
		news_network.network_channels += sendto

	var/author = news.author ? news.author : sendto.author
	news_network.SubmitArticle(news.message, author, news.channel_name, null, !news.can_be_redacted, news.message_type)
