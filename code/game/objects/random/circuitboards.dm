/obj/random/circuitboard
	name = "random circuitboard"
	icon_state = "tech-blue"

/obj/random/circuitboard/item_to_spawn()
	return pickweight(list(/obj/random/pack/rare = 1,
				/obj/item/circuitboard/autolathe = 8,
				/obj/item/circuitboard/air_management = 1,
				/obj/item/circuitboard/arcade/battle = 3,
				/obj/item/circuitboard/area_atmos = 1,
				/obj/item/circuitboard/atmos_alert = 3,
				/obj/item/circuitboard/atmoscontrol = 1,
				/obj/item/circuitboard/biogenerator = 3,
				/obj/item/circuitboard/bluespacerelay = 1,
				/obj/item/circuitboard/broken = 4,
				/obj/item/circuitboard/circuit_imprinter = 2,
				/obj/item/circuitboard/comm_monitor = 1,
				/obj/item/circuitboard/comm_server = 1,
				/obj/item/circuitboard/communications = 2,
				/obj/item/circuitboard/curefab = 1,
				/obj/item/circuitboard/destructive_analyzer = 2,
				/obj/item/circuitboard/industrial_grinder = 4,
				/obj/item/circuitboard/med_data = 2,
				/obj/item/circuitboard/message_monitor = 1,
				/obj/item/circuitboard/ntnet_relay = 1,
				/obj/item/circuitboard/operating = 2,
				//obj/item/circuitboard/ordercomp = 1,
				/obj/item/circuitboard/pacman = 4,
				/obj/item/circuitboard/powermonitor = 2,
				/obj/item/circuitboard/protolathe = 2,
				/obj/item/circuitboard/rdconsole_unlicensed = 2,
				/obj/item/circuitboard/rdserver = 2,
				/obj/item/circuitboard/rdservercontrol = 2,
				/obj/item/circuitboard/smes = 2,
				/obj/item/circuitboard/solar_control = 1,
				/obj/item/circuitboard/splicer = 1,
				/obj/item/circuitboard/stationalert = 2,
				/obj/item/circuitboard/teleporter = 1,
				/obj/item/circuitboard/telecomms/broadcaster = 1,
				/obj/item/circuitboard/telecomms/bus = 1,
				/obj/item/circuitboard/telecomms/hub = 1,
				/obj/item/circuitboard/telecomms/processor = 1,
				/obj/item/circuitboard/telecomms/receiver = 1,
				/obj/item/circuitboard/telecomms/relay = 1,
				/obj/item/circuitboard/telecomms/server = 1,
				/obj/item/airalarm_electronics = 1,
				/obj/item/airlock_electronics = 1,))

/obj/random/circuitboard/low_chance
	name = "low chance random circuitboard"
	icon_state = "tech-blue-low"
	spawn_nothing_percentage = 60
