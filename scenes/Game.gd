extends Node2D

var fade = preload("res://scene_assets/Fade.tscn")
var current_scene = null

var is_inventory_visible = false

func load_room(previous_scene, new_scene : String): 
	
	if(previous_scene != null):
		previous_scene.queue_free()
	
	var scene = load(Globals.scenes[new_scene]).instance()
	
	var player = load("res://entities/player/Player.tscn").instance()
	
	var inventory_ui = load("res://ui/inventory/InventoryUI.tscn")
	scene.add_child(inventory_ui.instance())
	
	current_scene = scene
	
	add_child(fade.instance())
	
	$Fade/AnimationPlayer.play("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	
	self.add_child(scene)
	scene.add_child(player)
	
	player.global_position = Globals.player_spawn_location[new_scene]
	
	$Fade/AnimationPlayer.play_backwards("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	
	$Fade.queue_free()
	
func _get_node(searched_scene, node_name):
	for node in searched_scene.get_children():
		if(node.name == node_name):
			return node
	return null
	
func _input(event):
	
	var is_just_pressed = event.is_action_pressed("ui_cancel")
	if(is_just_pressed && is_inventory_visible):
		
		var ui_node = _get_node(current_scene, "UI")
		var canvas_layer = ui_node.get_child(0)
		_get_node(canvas_layer, "Inventory").queue_free()
		is_inventory_visible = false
	
func init():
	self.load_room(null, "MainRoom")

func _ready():
	init()
	for child in current_scene.get_children():
		print(child.name)
	
