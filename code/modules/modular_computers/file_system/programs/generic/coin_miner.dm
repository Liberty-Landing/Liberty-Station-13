/datum/computer_file/program/coin_miner
	filename = "Zipped K-oin"
	filedesc = "Key-Authenticated Zip Decoder"
	nanomodule_path = /datum/nano_module/program/coin_miner
	program_icon_state = "crypto"
	program_key_state = "rd_key"
	program_menu_icon = "home"
	extended_desc = "An endlessly compressed file that when processed turns into valuable credit on the intergalactic market. The bigger the file, the more its worth."
	size = 1
	available_on_ntnet = TRUE
	requires_ntnet = FALSE //We are all that we need to run by areselfs, so you can set up in the jungel or well scaving
	clone_able = FALSE
	added_wealth = 50 //Tons!
	var/message = ""
	var/running = FALSE
	var/progress = 0
	var/target_progress = 100
	usage_flags = PROGRAM_ALL

/datum/computer_file/program/coin_miner/disk
	available_on_ntnet = FALSE
	clone_able = FALSE
	copy_cat = TRUE //Were unable to be imported or exported hardware wise, as were already pre-downloaded somehow onto a disk.

/datum/nano_module/program/coin_miner
	name = "Key-Authenticated Zipped K-oin"

/datum/computer_file/program/coin_miner/process_tick()
	. = ..()
	if(!running)
		return
	var/obj/item/computer_hardware/processor_unit/CPU = computer.processor_unit
	var/obj/item/computer_hardware/hard_drive/HD = computer.hard_drive
	var/obj/item/computer_hardware/hard_drive/portable/PD = computer.portable_drive

	if(!istype(CPU) || !CPU.check_functionality() || !istype(HD))
		message = "A fatal hardware error has been detected."
		return

	if(HD.used_capacity >= HD.max_capacity)
		message = "Storage hard drive capacity error, clear space."
		return
	if(PD)
		if(PD.used_capacity >= PD.max_capacity)
			message = "Storage disk drive capacity error, clear space."
			return

	progress += get_speed()


	if(progress >= target_progress)
		reset()
		message = "Successfully decrypted and saved operational key codes."
		size += 1
		//So are program gets bigger and takes the space!
		HD.recalculate_size()
		if(PD)
			PD.recalculate_size()

/datum/computer_file/program/coin_miner/proc/reset()
	running = FALSE
	message = ""
	progress = 0

/datum/computer_file/program/coin_miner/proc/get_speed()
	var/skill_speed_modifier = max(100 + (operator_skill - STAT_LEVEL_BASIC) * 2, 25) / 100
	return computer.processor_unit.max_programs * skill_speed_modifier

/datum/computer_file/program/coin_miner/Topic(href, href_list)
	if(..())
		return 1
	if(href_list["PRG_reset"])
		reset()
		return 1
	if(href_list["PRG_execute"])
		if(running)
			return 1
		var/obj/item/computer_hardware/processor_unit/CPU = computer.processor_unit
		if(!istype(CPU) || !CPU.check_functionality())
			message = "A fatal hardware error has been detected."
			return

		running = TRUE
		return 1


/datum/nano_module/program/coin_miner/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/nano_topic_state/state = GLOB.default_state)
	if(!ntnet_global)
		return
	var/datum/computer_file/program/coin_miner/PRG = program
	var/list/data = list()
	if(!istype(PRG))
		return
	data = PRG.get_header_data()

	if(PRG.message)
		data["message"] = PRG.message
	else if(PRG.running)
		data["running"] = 1
		data["rate"] = PRG.get_speed()

		// The UI template uses this to draw a block of 1s and 0s, the more 1s the closer you are to completion
		// Combined with UI updates this adds quite nice effect to the UI
		data["completion_fraction"] = PRG.progress / PRG.target_progress
/*
	else if(program.computer.card_slot && program.computer.card_slot.stored_card)
		var/obj/item/card/id/id_card = program.computer.card_slot.stored_card
		var/list/regions = list()
		for(var/region in ACCESS_REGION_MIN to ACCESS_REGION_MAX)
			var/list/accesses = list()
			for(var/access in get_region_accesses(region))
				if (get_access_desc(access))
					accesses.Add(list(list(
						"desc" = replacetext(get_access_desc(access), " ", "&nbsp"),
						"ref" = access,
						"allowed" = (access in id_card.access),
						"blocked" = (access in PRG.restricted_access_codes))))

			regions.Add(list(list(
				"name" = get_region_accesses_name(region),
				"accesses" = accesses)))
		data["regions"] = regions
*/
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "mpc_coin_decrypter.tmpl", "Decrypter", 550, 400, state = state)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

