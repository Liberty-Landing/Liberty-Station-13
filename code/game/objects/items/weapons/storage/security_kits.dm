/obj/item/storage/box/m_kit
	name = "Marshal Kit"
	desc = "A standard kit."
	cant_hold = list(/obj/item) //stops them from being used as storage solutions - items can't be put back in.
	w_class = ITEM_SIZE_BULKY //these carry guns and lots of items! Makes sense to make them bigger than some tiny box
	icon_state = "box"

// Primary kits
/obj/item/storage/box/m_kit/specialist
	name = "Five-Oh Kit"
	desc = "The standard Liberty Watch box kit containing a \"Five-Oh\" submachine gun. An SMG worthy of main-carry or concealed carry, depending on a user's preference."

	populate_contents()
		new /obj/item/gun/projectile/automatic/specialist(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/m_kit/trench
	name = "Trench Kit"
	desc = "The standard Liberty Watch box kit containing a Trench shotgun, perfect for trench warfare!"

	populate_contents()
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun/beanbag(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/m_kit/cog
	name = "Cog Kit"
	desc = "The standard Liberty Watch box kit containing a Cog laser carbine, a common staple of most police forces galaxy wide."

	populate_contents()
		new /obj/item/gun/energy/cog(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/storage/pouch/tubular(src)

//Armorer kits
/obj/item/storage/box/m_kit/typewriter
	name = "Sunrise Laser SMG kit"
	desc = "The standard Marshal box kit containing a Marshal Gunsmith made laser SMG, for the discerning specialist."

	populate_contents()
		new /obj/item/gun/energy/sunrise(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/m_kit/judge
	name = "Judge Kit"
	desc = "The standard Marshal box kit containing a judge automatic shotgun. What is lacks in penetration it makes up for with ammo capacity and fire rate."

	populate_contents()
		new /obj/item/gun/projectile/shotgun/judge(src)
		new /obj/item/ammo_casing/shotgun/beanbag/pepperball/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/m_kit/kalash
	name = "Kalash Rifle Kit"
	desc = "The standard Marshal box kit containing a Kalsh rifle. Decent quality, decent caliber, decently average."

	populate_contents()
		new /obj/item/gun/projectile/automatic/ak47(src)
		new /obj/item/ammo_magazine/rifle_75/rubber(src)
		new /obj/item/ammo_magazine/rifle_75(src)
		new /obj/item/ammo_magazine/rifle_75(src)
		new /obj/item/storage/pouch/ammo(src)

//Criminal Investigator kits
/obj/item/storage/box/m_kit/wristbreaker
	name = "Ranger revolver Kit"
	desc = "The standard Marshal box kit containing a Ranger revolver, a famous Martian Logistics firearm with an infamous service history."

	populate_contents()
		new /obj/item/gun/projectile/revolver/wristbreaker(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/ammo_magazine/ammobox/light_rifle_257_small(src)
		new /obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber(src)

/obj/item/storage/box/m_kit/operator_rifle
	name = "Operator rifle Kit"
	desc = "The standard Liberty Watch box kit containing an Operator rifle, a powerhouse for operators prefering silenced and traceless weapons."

	populate_contents()
		new /obj/item/gun/projectile/automatic/operator_rifle(src)

/obj/item/storage/box/m_kit/sweeper
	name = "Street Sweeper automatic shotgun Kit"
	desc = "The standard Marshal box kit containing a Peackeeper energy shotgun, a lethal and non-lethal powerhouse of engineering."

	populate_contents()
		new /obj/item/gun/projectile/shotgun/sweeper(src)
		new /obj/item/cell/medium/high(src)

// Secondary kits
/obj/item/storage/box/m_kit/taser
	name = "Counselor Secondary kit"
	desc = "The standard Marshal box kit containing a counselor stun gun. An all round solid sidearm to round out the Marshals non-lethal kit."

	populate_contents()
		new /obj/item/gun/energy/taser(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/clothing/accessory/holster/hip(src)

/obj/item/storage/box/m_kit/stinger
	name = "Stinger Secondary Kit"
	desc = "The standard Liberty Watch box kit containing a Stinger 9mm pistol. The staple icon of the Watch, commonly found on most hiring posters! \
			Known for its low recoil, ability to fit a drum magazine and being an overall reliable workhorse."

	populate_contents()
		new /obj/item/gun/projectile/stinger/pepperball(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/clothing/accessory/holster/hip(src)

// Armor Kits
/obj/item/storage/box/m_kit/standard_armor
	name = "Standard Visor Armor Kit"
	desc = "A standard Marshal armor kit with a plate carrier and visor helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/vest/ironhammer(src)
		new /obj/item/clothing/head/helmet/marshal(src)

/obj/item/storage/box/m_kit/armored_overcoat
	name = "\improper Armored Overcoat Armor Kit"
	desc = "An armor kit containg an armored overcoat and a full helmet."

	populate_contents()
		new /obj/item/clothing/suit/storage/armor/marshal_coat(src)


/obj/item/storage/box/m_kit/bullet_proof
	name = "Bullet Proof Kit"
	desc = "A standard Marshal armor kit containing bullet proof armor and a helmet with tacked on nightvision, perfect for dealing with hostile colonist and infiltrators, but bulky and slowing."

	populate_contents()
		new /obj/item/clothing/suit/armor/bulletproof/ironhammer(src)
		new /obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg(src)

/obj/item/storage/box/m_kit/laser_armor
	name = "Ablative Armor Kit"
	desc = "A standard Marshal armor kit containing a full ablative marshal branded suit for countering laser weaponry."

	populate_contents()
		new /obj/item/clothing/suit/armor/vest/ablative/ironhammer(src)
		new /obj/item/clothing/head/helmet/laserproof/marshal(src)
		new /obj/item/clothing/gloves/thick/ablasive(src)
		new /obj/item/clothing/shoes/ablasive(src)

/obj/item/storage/box/m_kit/riot
	name = "Riot Armor Kit"
	desc = "An standard Marshal armor kit containing riot armor and a riot helmet, perfect for dealing with hostile fauna and anyone in melee, but bulky and slowing."

	populate_contents()
		new /obj/item/clothing/suit/armor/heavy/riot/ironhammer(src)
		new /obj/item/clothing/head/helmet/riot_hud(src)
