extends Node2D

var fade = preload("res://scenes/Fade.tscn")

const SCENE_PATH = "res://scenes/%s.tscn"

func load_scene(scene_name):
	if self.has_node("Scene"):
		self.remove_child(self.get_node("Scene"))
	var scene = load(SCENE_PATH % scene_name).instance()
	self.add_child(scene)
	scene.connect("load_scene", self, "scene_change")

func init():
	load_scene("MainRoom")

func _ready():
	call_deferred("init")

func scene_change(scene, coords):
	add_child(fade.instance())
	$Fade/AnimationPlayer.play("Fade")
	yield($Fade/AnimationPlayer, "animation_finished")
	load_scene(scene)
	$Fade/AnimationPlayer.play_backwards("Fade")
	$Player.position = coords

func _on_Button_button_up():
	print("Hello")
	pass # Replace with function body.
