extends Button

var inventory = preload("res://ui/inventory/Inventory.tscn")

func _on_InventoryButton_button_up():
	var game_node = get_parent().get_parent().get_parent().get_parent()
	var canvas_layer = get_parent()
	if !game_node.is_inventory_visible:
		game_node.is_inventory_visible = true
		canvas_layer.add_child(inventory.instance())
	else:
		game_node.is_inventory_visible = false
		canvas_layer.get_child(1).queue_free()
