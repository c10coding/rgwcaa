extends Node

var scenes = {
	"MainRoom": "res://scenes/MainRoom.tscn",
	"Hall": "res://scenes/Hall.tscn",
	"Facility": "res://scenes/Facility.tscn"
}

var ui = {
	scenes = {
		
	},
	scripts = {
		"Slot_Script": "res://ui/inventory/Slot.gd",
		"Item_Script": "res://ui/invetory/Item.gd"
	}
}

var player_spawn_location = {
	"MainRoom": Vector2(160, 90),
	"Hall": Vector2(160, 90)
}
