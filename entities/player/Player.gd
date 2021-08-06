extends KinematicBody2D

var velocity = Vector2.ZERO

export var acceleration = 500
export var maxSpeed = 60
export var friction_force = 500

onready var player = $AnimationPlayer
onready var tree = $AnimationTree
onready var state = tree.get("parameters/playback")

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		tree.set("parameters/Idle/blend_position", input_vector)
		tree.set("parameters/Run/blend_position", input_vector)
		state.travel("Run")
		velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * delta)
	else:
		state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction_force * delta)

	velocity = move_and_slide(velocity)
