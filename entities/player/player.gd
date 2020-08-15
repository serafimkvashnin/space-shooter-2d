extends KinematicBody2D

export var speed = 400

# y axis limits
const MAX_TOP_POSITION: int = 48
const MAX_DOWN_POSITION: int = 360 - MAX_TOP_POSITION

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
	
	# limits player position on y axis
	position.y = clamp(position.y, MAX_TOP_POSITION, MAX_DOWN_POSITION)
	
	if position.y > MAX_TOP_POSITION and input_y < 0: 
		animation.flip_h = false
		animation.play("turn_up")
	elif position.y < MAX_DOWN_POSITION and input_y > 0:
		animation.flip_h = true
		animation.play("turn_down")
	else: 
		animation.play("turn_back")
