extends Node2D

# This is a comment for the Github demonstration
func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://assets/Strawberry.png")
	else:
		$TextureRect.texture = load("res://assets/Book.png")
