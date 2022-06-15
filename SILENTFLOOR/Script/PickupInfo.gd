extends Label

const MAX_LINES = 5
var pickups_info = []

func _ready():
	text = ""

func add_pickups_info(pickup_type, amount:int):
	$RemoveInfoTimer.start()
	match pickup_type:
		Pickup.PICKUP_TYPES.HEALTH:
			pickups_info.push_back("PICKED UP HEALTH" + str(amount))
		Pickup.PICKUP_TYPES.MACHINE_GUN:
			pickups_info.push_back("PICKED UP MACHINE GUN")
		Pickup.PICKUP_TYPES.MACHINE_GUN_AMMO:
			pickups_info.push_back("PICKED UP MACHINE GUN AMMO" + str(amount))
		Pickup.PICKUP_TYPES.SHOTGUN:
			pickups_info.push_back("PICKED UP SHOTGUN")
		Pickup.PICKUP_TYPES.SHOTGUN_AMMO:
			pickups_info.push_back("PICKED UP SHOTGUN AMMO" + str(amount))
		Pickup.PICKUP_TYPES.ROCKET_LAUNCHER:
			pickups_info.push_back("PICKED UP ROCKET LAUNCHER")
		Pickup.PICKUP_TYPES.ROCKET_LAUNCHER_AMMO:
			pickups_info.push_back("PICKED UP ROCKET LAUNCHER AMMO" + str(amount))
	while pickups_info.size() >= MAX_LINES:
		pickups_info.pop_front()
	update_display()

func update_display():
	text = ""
	for pickups_info_text in pickups_info:
		text += pickups_info_text + "\n"

func remove_pickup_info():
	if pickups_info.size() > 0:
		pickups_info.pop_front()
	update_display()
