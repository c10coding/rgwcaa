extends Node2D

signal load_scene(scene)

func _on_Portal_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("load_scene", "Hall", Vector2(160, 90))
