/obj/item/book/manual/evaguide
	name = "Silicon Log: Breach
	"
	icon_state = "book_eva"
	author = "Maria Crash, Senior Atmospherics Technician"
	title = "EVA Gear and You: Not Spending All Day Inside"
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1><a name="Foreword">EVA Gear and You: Not Spending All Day Inside</a></h1>
				<I>Or: How not to suffocate because there's a hole in your shoes</I><BR>

				<h2><a name="Contents">Contents</a></h2>
				<ol>
					<li><a href="#Foreword">A foreword on using EVA gear</a></li>
					<li><a href="#Civilian">Donning a Civilian Suit</a></li>
					<li><a href="#Hardsuit">Putting on a Hardsuit</a></li>
					<li><a href="#Equipment">Cyclers and Other Modification Equipment</a></li>
					<li><a href="#Final">Final Checks</a></li>
				</ol>
				<br>

				<h2><a name="Final">Final Checks</a></h2>
				<ul>
					<li>Are all seals fastened correctly?</li>
					<li>If you have modified it manually, is absolutely everything sealed perfectly?</li>
					<li>Do you either have shoes on under the suit, or magnetic boots on over it?</li>
					<li>Do you have a mask on and internals on the suit or your back?</li>
					<li>Do you have a way to communicate with the station in case something goes wrong?</li>
					<li>Do you have a second person watching if this is a training session?</li><BR>
				</ul>

				If you don't have any further issues, go out and do whatever is necessary.

				</body>
			</html>
			"}
/*********************MANUALS (BOOKS)***********************/

/obj/item/book/log
	icon = 'icons/obj/library.dmi'
	due_date = 0 // Game time in 1/10th seconds
	unique = TRUE   // All logs are

/obj/item/book/manual/engineering_construction
	name = "Station Repairs and Construction"
	icon_state ="book_construction"
	author = "Engineering Encyclopedia"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Station Repairs and Construction"

/obj/item/book/lectures
	name = "Hearth Lantern"
	desc = "Used to channel radiance into lectures."
	icon = 'icons/obj/custodians_melee.dmi'
	icon_state = "hearth_lantern"
	item_state = "hearth_lantern"

/obj/item/book/eletronic
	name = "leaked Hologram E-book data"
	desc = "You are not supposed to see this."
	icon = 'icons/obj/library.dmi'
	icon_state ="hologram"
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL		 //hologram flashdrives are small and portable.
	attack_verb = list("waved", "smashed", "pushed")
	var/dat			 // Actual page content
	var/due_date = 0 // Game time in 1/10th seconds
	var/author		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	var/unique = TRUE // FALSE - Normal book, TRUE - Should not be treated as normal book, unable to be copied, unable to be modified
	var/title		 // The real name of the book.
	var/carved = 0	 // Has the book been hollowed out for use as a secret storage item?
	var/obj/item/store	//What's in the book?
	var/window_size = null // Specific window size for the book, i.e: "1920x1080", Size x Width

/obj/item/book/eletronic/rebelleak
	name = "27-04-2716 PublicChat Leak"
	desc = "The insurgents have leaked the public communications during code red so everyone can see the cruelty done by some factions of Freeport Liberty.\
	They clearly censored some of their own words and the point of view of the other party to suit their needs of propaganda."
	icon = 'icons/obj/library.dmi'
	author = "PublicChat Log: 1"
	title = "The Custodian's Brutality Exposed"
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1><a name="Foreword">EVA Gear and You: Not Spending All Day Inside</a></h1>
				<I>Or: How not to suffocate because there's a hole in your shoes</I><BR>

				<h2><a name="Contents">Contents</a></h2>
				<ol>
					<li><a href="#Foreword">A foreword on using EVA gear</a></li>
					<li><a href="#Civilian">Donning a Civilian Suit</a></li>
					<li><a href="#Hardsuit">Putting on a Hardsuit</a></li>
					<li><a href="#Equipment">Cyclers and Other Modification Equipment</a></li>
					<li><a href="#Final">Final Checks</a></li>
				</ol>
				<br>

				<h2><a name="Final">Final Checks</a></h2>
				<ul>
					<li>Are all seals fastened correctly?</li>
					<li>If you have modified it manually, is absolutely everything sealed perfectly?</li>
					<li>Do you either have shoes on under the suit, or magnetic boots on over it?</li>
					<li>Do you have a mask on and internals on the suit or your back?</li>
					<li>Do you have a way to communicate with the station in case something goes wrong?</li>
					<li>Do you have a second person watching if this is a training session?</li><BR>
				</ul>

				If you don't have any further issues, go out and do whatever is necessary.

				</body>
			</html>
			"}
