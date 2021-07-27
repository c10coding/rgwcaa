extends Button

var inventory = preload("res://ui/inventory/Inventory.tscn")
var count = 0

func _on_InventoryButton_button_up():
	var canvas_layer = get_parent()
	if count == 0:
		canvas_layer.add_child(inventory.instance())
	else:
		canvas_layer.get_child(1).queue_free()
	count = 1 - count
