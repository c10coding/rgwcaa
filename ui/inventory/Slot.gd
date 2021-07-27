extends Panel

var in_use_texture = preload("res://assets/ui/inventory/Inventory_Slot_Used.png")
var empty_texture = preload("res://assets/ui/inventory/InventorySlot.png")

var in_use_style = null
var empty_style = null

var item_class = preload("res://ui/inventory/Item.tscn")
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	in_use_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	in_use_style.texture = in_use_texture
	empty_style.texture = empty_texture
	
	randomize()
	if randi() % 2 == 0:
		item = item_class.instance()
		add_child(item)
		
	refresh_style()
		
func pick_from_slot():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_style()

func put_into_slot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	refresh_style()
	
func refresh_style():
	if item == null:
		set("custom_styles/panel", empty_style)
	else:
		set("custom_styles/panel", in_use_style)
	
