// /data/ files store data in string format.
// They don't contain other logic for now.
/datum/computer_file/data/news_article
	filetype = "XNML"
	filename = "Unknown News Entry"
	block_size = 5000 		// Results in smaller files
	read_only = 1			// Editing the file breaks most formatting due to some HTML tags not being accepted as input from average user.
	var/server_file_path 	// File path to HTML file that will be loaded on server start. Example: '/news_articles/space_magazine_1.html'. Use the /news_articles/ folder!
	var/archived			// Set to 1 for older stuff
	var/cover				//filename of cover.

/datum/computer_file/data/news_article/New(var/load_from_file = 0)
	..()
	if(server_file_path && load_from_file)
		stored_data = file2text(server_file_path)
	calculate_size()


// NEWS DEFINITIONS BELOW THIS LINE

//TODO: Make this more modular so new entries don't require a PR, perhaps SQL Database integration.

//SOJ ADDS - All from discord

//Liberty - We starting from scratch here, probably no itegration ever coming who knows.
/* Template
/datum/computer_file/data/news_article/Psionic_Ascension
	filename = "Psionic Ascension"
	server_file_path = 'news_articles/Psionic_Ascension.html'
	archived = 1
*/
/datum/computer_file/data/news_article/lionel_interview
	filename = "Lionel Interview"
	server_file_path = 'news_articles/Lionel_interview.html'
	archived = 1
