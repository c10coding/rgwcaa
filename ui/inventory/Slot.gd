extends Panel

var ItemClass = preload("res://ui/inventory/Item.tscn")
var item = null

func _ready():
	item = ItemClass.instance()
	add_child(item)
	
