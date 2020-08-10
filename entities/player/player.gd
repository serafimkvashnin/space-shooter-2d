extends KinematicBody2D

var speed = 400

onready var animation = $Ship

func _get_input() -> float:
	var input: float = 0

	if Input.is_action_pressed("KEY_UP"):
		input = -1
	elif Input.is_action_pressed("KEY_DOWN"):
		input = 1

	return input

func _physics_process(delta): 
	var input_y = _get_input()
	position.y += input_y * speed * delta

	if input_y > 0:
		animation.flip_h = true
		animation.play("turn_down")
	elif input_y < 0: 
		animation.flip_h = false
		animation.play("turn_up")
	else: 
		animation.play("turn_back")
