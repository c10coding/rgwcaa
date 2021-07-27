extends Node2D

export(int) var book_chance = 10
export(int) var happy_chance = 90

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var random_num = randi() % 100 + 1 # Generates a num between 1 and 100
	if random_num < book_chance:
		$TextureRect.texture = load("res://assets/Book.png")
	else:
		$TextureRect.texture = load("res://assets/Happy.png")
