extends KinematicBody2D

var velocity = Vector2.ZERO

signal scene_change

const ACC = 500
const SPEED = 60
const FRIC = 500

onready var player = $AnimationPlayer
onready var tree = $AnimationTree
onready var state = tree.get("parameters/playback")

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		tree.set("parameters/Idle/blend_position", input_vector)
		tree.set("parameters/Run/blend_position", input_vector)
		state.travel("Run")
		velocity = velocity.move_toward(input_vector * SPEED, ACC * delta)
	else:
		state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRIC * delta)

	velocity = move_and_slide(velocity)
	
#	for i in get_slide_count():
#		var collision = get_slide_collision(i)
#		if collision.collider is TileMap:
#			var tile_pos = collision.collider.world_to_map(position)
#			tile_pos -= collision.normal
#			var tile_id = collision.collider.get_cellv(tile_pos)
#			if tile_id == 2:
#				emit_signal("scene_change")
