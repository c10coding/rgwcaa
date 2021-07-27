extends Node2D

const SlotClass = preload("res://ui/inventory/Slot.gd")
onready var inventory_slots = $GridContainer
var holding_item = null 

# Called when the node enters the scene tree for the first time.
func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self, "slot_gui_input", [inv_slot])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null: # Place holding item to slot
				if !slot.item:
					slot.put_into_slot(holding_item)
					holding_item = null
				else: # Swap holding item with item in slot
					var temp_item = slot.item
					slot.pick_from_slot()
					temp_item.global_position = holding_item.global_position
					slot.put_into_slot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pick_from_slot()
				holding_item.global_position = get_global_mouse_position()
				_adjust_holding_item_position(holding_item)	
				
func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
		_adjust_holding_item_position(holding_item)

func _adjust_holding_item_position(item):
	item.global_position.x -= 10
	item.global_position.y -= 5
