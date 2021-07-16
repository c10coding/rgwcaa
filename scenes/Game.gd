extends Node2D

var fade = preload("res://scene_assets/Fade.tscn")

func load_scene(previous_scene, new_scene):
	
	if(previous_scene != null):
		previous_scene.queue_free()
	
	var scene = load(Globals.scenes[new_scene]).instance()
	var player = load("res://entities/player/Player.tscn").instance()
	
	add_child(fade.instance())
	
	$Fade/AnimationPlayer.play("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	
	self.add_child(scene)
	
	scene.add_child(player)
	
	player.global_position = Globals.pos[new_scene]
	
	$Fade/AnimationPlayer.play_backwards("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	
	$Fade.queue_free()

func load_inventory_ui():
	var inventory_ui = load("res://ui/inventory/InventoryUI.tscn")
	self.add_child(inventory_ui.instance())

func init():
	self.load_scene(null, "MainRoom")
	self.load_inventory_ui()

func _ready():
	self.call_deferred("init")
