extends Node2D

var inventory = preload("res://ui/inventory/Inventory.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_InventoryButton_button_up():
	var canvas_layer = $"../CanvasLayer"
	print(canvas_layer.name)
	canvas_layer.add_child(inventory.instance())