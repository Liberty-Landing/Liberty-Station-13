//Report datums for use with the report editor and other programs.

/*Format
FLC
(Freeport Colony)

GEN / COM / SKS / etc etc
(Department, GEN = General, COM = Command, SKS = Skylight Syndicate etc.)

000
(Number of reports in same department so if I have COM-002 that means this report is SECOND in the category)

TFF
(Shorthand of the name of the actual form so armory log would be ARL)

Don't add : at end of the fields as the program does it automatically even during printing.
*/

/datum/computer_file/report/recipient
	form_name = "FLC-TEST-000-ERR"
	title = "INDEX - ERROR PLEASE CONTACT ADMINISTRATOR"
	logo = "\[logo\]"
	available_on_ntnet = 1

//////////////////////////////
/* Command / Heads of Staff */
//////////////////////////////

/datum/computer_file/report/recipient/command/transfer
	form_name = "FLC-COM-001-TFF"
	title = "Command - Transfer Form"

/datum/computer_file/report/recipient/command/transfer/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Liberty Colony - High Council")
	add_field(/datum/report_field/instruction, "Additional Access Form")
	add_field(/datum/report_field/simple_text, "Name")
	add_field(/datum/report_field/simple_text, "Rank")
	add_field(/datum/report_field/instruction, "Liberty Colony")
	add_field(/datum/report_field/simple_text, "From Department")
	add_field(/datum/report_field/simple_text, "To Department")
	add_field(/datum/report_field/simple_text, "Requested Position")
	add_field(/datum/report_field/simple_text, "Reason")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/signature, "Signature of Transferring Head of Staff")
	add_field(/datum/report_field/signature, "Signature of Recieving Head of Staff")
	add_field(/datum/report_field/signature, "Signature of the Board Secretary")

/datum/computer_file/report/recipient/command/reassignment
	form_name = "FLC-COM-002-RGO"
	title = "Command - Reassignment Order"

/datum/computer_file/report/recipient/command/reassignment/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Liberty Colony - High Council")
	add_field(/datum/report_field/instruction, "Reassignment Order")
	add_field(/datum/report_field/simple_text, "Employee")
	add_field(/datum/report_field/simple_text, "Original Position")
	add_field(/datum/report_field/simple_text, "New Position")
	add_field(/datum/report_field/simple_text, "Reason for Assignment")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff")
	add_field(/datum/report_field/signature, "Signature of the Board Secretary")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/command/dismissal
	form_name = "FLC-COM-003-DMO"
	title = "Command - Dismissal Order"

/datum/computer_file/report/recipient/command/dismissal/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Liberty Colony - High Council")
	add_field(/datum/report_field/instruction, "Access Change Order")
	add_field(/datum/report_field/simple_text, "Employee")
	add_field(/datum/report_field/simple_text, "Original Position")
	add_field(/datum/report_field/simple_text, "Reason for Dismissal")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff")
	add_field(/datum/report_field/signature, "Signature of the Board Secretary")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/command/access_modification
	form_name = "FLC-COM-004-AMA"
	title = "Command - Access Modification Application"

/datum/computer_file/report/recipient/command/access_modification/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/instruction, "Liberty Colony - High Council")
	add_field(/datum/report_field/people/from_manifest, "Name (XO)")
	add_field(/datum/report_field/people/from_manifest, "Name (applicant)", required = 1)
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/simple_text, "Present position")
	add_field(/datum/report_field/simple_text, "Requested access")
	add_field(/datum/report_field/pencode_text, "Reason stated")
	add_field(/datum/report_field/simple_text, "Duration of expanded access")
	add_field(/datum/report_field/instruction, "The following fields render the document invalid if not signed clearly.")
	add_field(/datum/report_field/signature, "Applicant signature")
	xo_fields += add_field(/datum/report_field/signature, "Board Secretary's signature")
	xo_fields += add_field(/datum/report_field/number, "Number of personnel in relevant position")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/command/awol
	form_name = "FLC-COM-005-MIA"
	title = "Command - Employee AWOL/MIA"

/datum/computer_file/report/recipient/command/awol/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "CD-14 Form: Colonist missing while on duty")
	add_field(/datum/report_field/simple_text, "Name/Aliases")
	add_field(/datum/report_field/simple_text, "Assignment")
	add_field(/datum/report_field/simple_text, "Reason for Colonist missing from duty")
	add_field(/datum/report_field/simple_text, "What can be done to rectify this issue")
	add_field(/datum/report_field/simple_text, "Is executive action required")
	add_field(/datum/report_field/simple_text, "Head of Department")
	add_field(/datum/report_field/instruction, "Colonist delinquent of duty are governed by the  protocol 348-60-9, and the relevant faction withholds the right to perform any and all acts of reasonable punishment and repossession upon said employee under protocol 348-60-2. Colonist are at minimum docked of pay till such time as recommencement as governed by contract 24-5. Any and all losses caused by the employee colonist loss and excessive loss is defined within protocol 23-13B. The relevant faction withholds the right to deny, permit, override all concordant or orders of command staff from other factions except those given by a lawful order or council vote.")

/datum/computer_file/report/recipient/command/access_change
	form_name = "FLC-COM-006-ACO"
	title = "Command - Access Change Order"

/datum/computer_file/report/recipient/command/access_change/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Access Change Order")
	add_field(/datum/report_field/simple_text, "Employee")
	add_field(/datum/report_field/simple_text, "Access Added/Removed")
	add_field(/datum/report_field/simple_text, "Reasoning for Addition/Removal")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff")
	add_field(/datum/report_field/signature, "Signature of the Board Secretary")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/command/staff_assessment
	form_name = "FLC-COM-007-SAP"
	title = "Command - Staff Assessment Paperwork"

/datum/computer_file/report/recipient/command/staff_assessment/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Shift Departmental Staff Assessment")
	add_field(/datum/report_field/simple_text, "Department")
	add_field(/datum/report_field/simple_text, "Employee Name")
	add_field(/datum/report_field/simple_text, "Current Job")
	add_field(/datum/report_field/simple_text, "Current Duties")
	add_field(/datum/report_field/simple_text, "Does the staff member wear the correct uniform or protective gear")
	add_field(/datum/report_field/simple_text, "Rate the staff members performance, 1-10")
	add_field(/datum/report_field/simple_text, "Does the staff member require further training")
	add_field(/datum/report_field/simple_text, "Head of Department")
	add_field(/datum/report_field/instruction, "Contained review materials are not representative of the views of the relevant faction. Said faction is not liable for any bias or offensive language contained within said review materials. The relevant faction in question withholds the right to action upon any information contained within this assessment.")

/datum/computer_file/report/recipient/command/docked
	form_name = "FLC-COM-008-DVR"
	title = "Command - Docked Vessel Report"

/datum/computer_file/report/recipient/command/docked/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Liberty Ship Visitation and Logging")
	add_field(/datum/report_field/instruction, "General Info")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/simple_text, "Vessel Name")
	add_field(/datum/report_field/simple_text, "Vessel Pilot/Owner")
	add_field(/datum/report_field/simple_text, "Vessel Intended Purpose")
	add_field(/datum/report_field/people/from_manifest, "Docking Authorized by")
	add_field(/datum/report_field/instruction, "General Cargo Info")
	add_field(/datum/report_field/pencode_text, "List the types of cargo onboard the vessel")
	add_field(/datum/report_field/instruction, "Hazardous Cargo Info")
	add_field(/datum/report_field/options/yes_no, "Weaponry")
	add_field(/datum/report_field/options/yes_no, "Live Cargo")
	add_field(/datum/report_field/options/yes_no, "Biohazardous material")
	add_field(/datum/report_field/options/yes_no, "Chemical or radiation hazard")
	add_field(/datum/report_field/signature, "To indicate authorization for vessel entry, sign here")
	add_field(/datum/report_field/instruction, "Undocking and Departure")
	add_field(/datum/report_field/time, "Undocking Time")
	add_field(/datum/report_field/pencode_text, "Additional Undocking Comments")

//////////////////////////////
/* Security - Liberty Watch */
//////////////////////////////

/datum/computer_file/report/recipient/sec
	form_name = "FLC-FLW-001-SIR"
	title = "Liberty Watch - Security Incident Report"
	logo = "\[solcrest\]" //Placeholder until their actual logo

/datum/computer_file/report/recipient/sec/New()
	..()
	set_access(access_security)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/sec/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Liberty Watch Security Department")
	add_field(/datum/report_field/instruction, "To be filled out by Watchman on duty responding to the Incident. Report must be signed and submitted before the end of the shift!")
	add_field(/datum/report_field/people/from_manifest, "Reporting Watchman")
	add_field(/datum/report_field/simple_text, "Offense/Incident Type")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time of incident")
	add_field(/datum/report_field/people/list_from_manifest, "Assisting Watchman(en)")
	add_field(/datum/report_field/simple_text, "Location")
	add_field(/datum/report_field/pencode_text, "Personnel involved in Incident", "\[small\]\[i\](V-Victim, S-Suspect, W-Witness, M-Missing, A-Arrested, RP-Reporting Person, D-Deceased)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Description of Items/Property", "\[small\]\[i\](D-Damaged, E-Evidence, L-Lost, R-Recovered, S-Stolen)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "Narrative")
	add_field(/datum/report_field/signature, "Reporting Watchman's signature")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/investigation
	form_name = "FLC-FLW-002-IGR"
	title = "Liberty Watch - Investigation Report"

/datum/computer_file/report/recipient/sec/investigation/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Liberty Watch Security Department")
	add_field(/datum/report_field/instruction, "For internal use only.")
	add_field(/datum/report_field/people/from_manifest, "Name")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Case name")
	add_field(/datum/report_field/pencode_text, "Summary")
	add_field(/datum/report_field/pencode_text, "Observations")
	add_field(/datum/report_field/signature, "Signature")
	set_access(access_edit = access_security)


/datum/computer_file/report/recipient/sec/evidence
	form_name = "FLC-FLW-003-EPF"
	title = "Liberty Watch - Evidence and Property Form"

/datum/computer_file/report/recipient/sec/evidence/generate_fields()
	..()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/instruction, "Liberty Watch Security Department")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/people/from_manifest, "Confiscated from")
	add_field(/datum/report_field/pencode_text, "List of items in custody/evidence lockup")
	set_access(access_edit = access_security)
	temp_field = add_field(/datum/report_field/signature, "Armorer's signature")
	temp_field.set_access(access_edit = list(access_security, access_armory))
	temp_field = add_field(/datum/report_field/signature, "Criminal Investigator's signature")
	temp_field.set_access(access_edit = list(access_security, access_forensics_lockers))

/datum/computer_file/report/recipient/sec/mech
	form_name = "FLC-FLW-004-CMP"
	title = "Liberty Watch - Combat Mech Usage Permit"

/datum/computer_file/report/recipient/sec/mech/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Liberty Watch Security Department")
	add_field(/datum/report_field/people/from_manifest, "Name")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Mech's Title")
	add_field(/datum/report_field/simple_text, "Mech's Type")
	add_field(/datum/report_field/simple_text, "Mech's Equipment")
	add_field(/datum/report_field/instruction, "These are non-negotiable, any modifications to the Mech void this permit.")
	add_field(/datum/report_field/signature, "Signature of Deputy Chief")
	add_field(/datum/report_field/signature, "Signature of Board Secretary (if applicable)")
	set_access(access_edit = access_security)

//////////////////////////////////
/* Service - Skylight Syndicate */
//////////////////////////////////

/datum/computer_file/report/recipient/sks
	form_name = "FLC-SKS-001-SPR"
	title = "Skylight - Shipping Receipt"
	logo = "\[solcrest\]" //Placeholder until their actual logo

/datum/computer_file/report/recipient/sks/New()
	..()
	set_access(access_hydroponics)

/datum/computer_file/report/recipient/sks/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Skylight Shipping Receipt")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "You were served by")
	add_field(/datum/report_field/pencode_text, "You bought the following items")
	add_field(/datum/report_field/simple_text, "Your Total")
	add_field(/datum/report_field/signature, "Signature")

/datum/computer_file/report/recipient/sks/shipping_invoice
	form_name = "FLC-SKS-002-SPI"
	title = "Skylight - Shipping Invoice"

/datum/computer_file/report/recipient/sks/shipping_invoice/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Skylight Shipping Invoice")
	add_field(/datum/report_field/simple_text, "Employee")
	add_field(/datum/report_field/simple_text, "Original Price of Item/Order")
	add_field(/datum/report_field/simple_text, "Item/Order sold")
	add_field(/datum/report_field/simple_text, "80% of the above is")
	add_field(/datum/report_field/simple_text, "The seller is entilted to a maximum amount of")
	add_field(/datum/report_field/simple_text, "The seller has taken")
	add_field(/datum/report_field/instruction, "The seller is entitled to a maximum of 20% of the profits made. Going over is a breach of contract and will result in your demotion. The receipt of sale is required to be attached to this paperwork for it to be considered valid.")

/datum/computer_file/report/recipient/sks/confirmation_form
	form_name = "FLC-SKS-003-CFF"
	title = "Skylight - Confirmation Form"

/datum/computer_file/report/recipient/sks/confirmation_form/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Confirmation Form")
	add_field(/datum/report_field/simple_text, "Shipment Destination")
	add_field(/datum/report_field/instruction, "Ores/Material in this Shipment")
	add_field(/datum/report_field/simple_text, "Iron Ore")
	add_field(/datum/report_field/simple_text, "Metal")
	add_field(/datum/report_field/simple_text, "Plasteel")
	add_field(/datum/report_field/simple_text, "Sand")
	add_field(/datum/report_field/simple_text, "Glass")
	add_field(/datum/report_field/simple_text, "Reinforced Glass")
	add_field(/datum/report_field/simple_text, "Gold Ore")
	add_field(/datum/report_field/simple_text, "Gold Bars")
	add_field(/datum/report_field/simple_text, "Silver Ore")
	add_field(/datum/report_field/simple_text, "Silver Bars")
	add_field(/datum/report_field/simple_text, "Plasma Ore")
	add_field(/datum/report_field/simple_text, "Solid Plasma")
	add_field(/datum/report_field/simple_text, "Uranium Ore")
	add_field(/datum/report_field/simple_text, "Uranium")
	add_field(/datum/report_field/simple_text, "Diamond Ore")
	add_field(/datum/report_field/simple_text, "Diamonds")
	add_field(/datum/report_field/pencode_text, "Miscellaneous")
	add_field(/datum/report_field/signature, "Supply Personel Signature")
	add_field(/datum/report_field/signature, "Recipient Signature")
	add_field(/datum/report_field/instruction, "By signing this form as recipient, you agree that all materials listed were present at the time of signing. You also agree that after signing, you and your department take full responsibility for the materials delivered.")

//////////////////////////////////////
/* Engineering - Terra-Therma Union */
//////////////////////////////////////

/datum/computer_file/report/recipient/ttu
	form_name = "FLC-TTU-001-MGR"
	title = "Terra-Therma - Mining Report"

/datum/computer_file/report/recipient/ttu/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Mining Report")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Mined by")
	add_field(/datum/report_field/pencode_text, "Detailed amount of Materials after processing")
	add_field(/datum/report_field/simple_text, "Total Shipping Profits of All Materials (Standard Value)")
	add_field(/datum/report_field/pencode_text, "What materials were sold to other departments?")
	add_field(/datum/report_field/simple_text, "Total amount of profit")
	add_field(/datum/report_field/simple_text, "The miner is entitled to")
	add_field(/datum/report_field/simple_text, "Was a guard present during mining operation?")
	add_field(/datum/report_field/simple_text, "The guard is entilted to")
	add_field(/datum/report_field/signature, "Buyer's Signature")
	add_field(/datum/report_field/signature, "Guard Signature(if applicable)")

/////////////////////
/* Research - PIRS */
/////////////////////

/datum/computer_file/report/recipient/pirs/excavation
	form_name = "FLC-PRI-001-MGR"
	title = "Phokorus Institute - Excavation Report"

/datum/computer_file/report/recipient/pirs/excavation/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Excavation Report")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Excavated by")
	add_field(/datum/report_field/simple_text, "Excavated item list")
	add_field(/datum/report_field/simple_text, "Was a guard present during mining operation?")
	add_field(/datum/report_field/simple_text, "The guard is entilted to")
	add_field(/datum/report_field/signature, "The guard's signature(if applicable)")
	add_field(/datum/report_field/simple_text, "The employee is entitled to")
	add_field(/datum/report_field/signature, "The employee's signature")

/datum/computer_file/report/recipient/pirs/borging
	form_name = "FLC-PRI-002-CRC"
	title = "Phokorus Institute - Cyborgification Contract"

/datum/computer_file/report/recipient/pirs/borging/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/instruction, "PIRS")
	add_field(/datum/report_field/people/from_manifest, "Name (XO)")
	add_field(/datum/report_field/people/from_manifest, "Name (subject)", required = 1)
	add_field(/datum/report_field/date, "Date filed")
	add_field(/datum/report_field/time, "Time filed")
	add_field(/datum/report_field/instruction, "I, undersigned, hereby agree to willingly undergo a Regulation Lobotimization with intention of cyborgification or AI assimilation, and I am aware of all the consequences of such act. I also understand that this operation may be irreversible, and that my employment contract will be terminated.")
	add_field(/datum/report_field/signature, "Subject's signature")
	xo_fields += add_field(/datum/report_field/signature, "Research Provost's signature")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approved")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)

/////////////////////
/* Medical - CAPSA */
/////////////////////

/datum/computer_file/report/recipient/cap
	form_name = "FLC-CAP-001-BGR"
	title = "CAPSA Group - Billing Receipt"

/datum/computer_file/report/recipient/cap/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "CAPSA Billing Receipt")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "You were served by")
	add_field(/datum/report_field/pencode_text, "You were provided services")
	add_field(/datum/report_field/simple_text, "Your Total")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/instruction, "NOTE The below area to be stamped by a CAPSA Employee.")

/////////////
/* Generic */
/////////////

/datum/computer_file/report/recipient/item_request
	form_name = "FLC-GEN-001-IRF"
	title = "General - Item Request Form"

/datum/computer_file/report/recipient/item_request/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Item Request Form")
	add_field(/datum/report_field/simple_text, "Applicant Name:")
	add_field(/datum/report_field/simple_text, "Requested Item:")
	add_field(/datum/report_field/simple_text, "Reason for Request:")
	add_field(/datum/report_field/signature, "Applicant Signature:")
	add_field(/datum/report_field/signature, "Signature of Relevant Head Of Staff:")
	add_field(/datum/report_field/signature, "Signature of the Board Secretary:")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")

/datum/computer_file/report/recipient/item_application
	form_name = "FLC-GEN-002-ITA"
	title = "General - Item Application"

/datum/computer_file/report/recipient/item_application/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Item Application")
	add_field(/datum/report_field/simple_text, "Applicant Name:")
	add_field(/datum/report_field/simple_text, "Requested Item:")
	add_field(/datum/report_field/signature, "Applicant Signature:")
	add_field(/datum/report_field/signature, "Signature of Applicant Head Of Staff:")
	add_field(/datum/report_field/signature, "Signature of Relevant Head Of Staff:")
	add_field(/datum/report_field/signature, "Signature of the Board Secretary:")
	add_field(/datum/report_field/instruction, "By singing this form as applicant you are agreeing that you understand the faction in question does not provide any warranty whatsoever that the item will be free of defects or faults. In no respect shall the faction in questionincur any liability for any damages, injury or loss, including, but not limited to, direct, indirect, special, or consequential damages arising out of, resulting from, or any way connected to the use of the item. The item if provided, remains the providing factions property and is in no way your own.")
	add_field(/datum/report_field/instruction, "Stamps of Command Staff placed below this line.")

/datum/computer_file/report/recipient/requisition
	form_name = "FLC-GEN-003-RQF"
	title = "General - Requisition Form"

/datum/computer_file/report/recipient/requisition/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Requisition Approval Sheet")
	add_field(/datum/report_field/instruction, "The following is to be filled out in order to facilitate the deliver process of requisitions from cargo. Only appoved requisitions are to be listed on this form. All requisitions listed on this form are to be attached to this form. Requisitions listed may be from a single individual or faction.")
	add_field(/datum/report_field/instruction, "Requester Information")
	add_field(/datum/report_field/simple_text, "Name")
	add_field(/datum/report_field/simple_text, "Department")
	add_field(/datum/report_field/pencode_text, "Ordered Items")
	add_field(/datum/report_field/simple_text, "Total Cost")
	add_field(/datum/report_field/simple_text, "Location of Delivery")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/instruction, "NOTE: Items may be delievered or picked up at cargo.")
	add_field(/datum/report_field/signature, "Club Manager's/Fixer's Signature")
	add_field(/datum/report_field/signature, "Requesters Signature")
	add_field(/datum/report_field/instruction, "NOTE: The below area to be stamped by Skylight Employee.")

/datum/computer_file/report/recipient/access_form
	form_name = "FLC-GEN-004-AAF"
	title = "General - Additional Access Form"

/datum/computer_file/report/recipient/access_form/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "Additional Access Form")
	add_field(/datum/report_field/simple_text, "Name")
	add_field(/datum/report_field/simple_text, "Rank")
	add_field(/datum/report_field/instruction, "Liberty Colony")
	add_field(/datum/report_field/simple_text, "Requested Access")
	add_field(/datum/report_field/simple_text, "Reason")
	add_field(/datum/report_field/signature, "Signature of relevant Head of Staff")
	add_field(/datum/report_field/signature, "Signature of the Board Secretary")

/////////////////////
/* Generic - Faxes */
/////////////////////

/datum/computer_file/report/recipient/council_communication
	form_name = "FLC-FAX-001-HCF"
	title = "Fax - High Council Communication Form"

/datum/computer_file/report/recipient/council_communication/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "LIBERTY QUANTUM ENTANGLEMENT NETWORK")
	add_field(/datum/report_field/instruction, "FORM FLC-FAX-001-HCF:")
	add_field(/datum/report_field/instruction, "GENERAL TRANSMISSION")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/instruction, "QUANTUM ENTANGLEMENT TRANSMISSION")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/simple_text, "Origin")
	add_field(/datum/report_field/simple_text, "Department")
	add_field(/datum/report_field/simple_text, "Destination")
	add_field(/datum/report_field/simple_text, "Sender's Name")
	add_field(/datum/report_field/simple_text, "Sender's Rank")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/simple_text, "Priority")
	add_field(/datum/report_field/simple_text, "Subject")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/pencode_text, "Message Body")
	add_field(/datum/report_field/signature, "Sender's Signature")
	add_field(/datum/report_field/signature, "Signatures of additional authorities")
	add_field(/datum/report_field/instruction, "Stamps of applicable authorities below this line.")

/datum/computer_file/report/recipient/emergency_transmission
	form_name = "FLC-FAX-002-EGT"
	title = "Fax - Emergency Transmission"

/datum/computer_file/report/recipient/emergency_transmission/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "EMERGENCY TRANSMISSION")
	add_field(/datum/report_field/instruction, "")
	add_field(/datum/report_field/simple_text, "Sender")
	add_field(/datum/report_field/simple_text, "Position")
	add_field(/datum/report_field/pencode_text, "Message")
	add_field(/datum/report_field/signature, "Signed")
