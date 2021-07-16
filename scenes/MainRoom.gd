extends Node2D


func _on_Portal_body_entered(body):
	
	if body.is_in_group("Player"):
		get_parent().load_scene(self, "Hall")
