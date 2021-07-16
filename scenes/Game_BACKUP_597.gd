extends Node2D


var fade = preload("res://scene_assets/Fade.tscn")


func load_scene(new_scene):
	
	var scene = load(Globals.scenes[new_scene]).instance()
	
	var player = load("res://entities/player/Player.tscn").instance()
	
	add_child(fade.instance())
	
	$Fade/AnimationPlayer.play("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	
	self.get_child(0).queue_free()
	
	self.add_child(scene)
	
	scene.add_child(player)
	
	player.global_position = Globals.pos[new_scene]
	
	$Fade/AnimationPlayer.play_backwards("Fade")
<<<<<<< HEAD
	$Player.position = coords
	$Fade.queue_free()
||||||| 385e942
	$Player.position = coords
=======
	yield($Fade/AnimationPlayer, "animation_finished")
	
	$Fade.queue_free()


func init():
	
	self.load_scene("MainRoom")

>>>>>>> bb4618d8a6071f54bf8e1a500fea9ca6fb478c96

func _ready():
	
	self.call_deferred("init")
