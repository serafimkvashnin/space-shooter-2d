extends Area2D

export var speed = 1000

onready var notifier = $Notifier


func _physics_process(delta):
	position += Vector2.RIGHT * speed * delta
	
	
func _process(_delta):
	if not notifier.is_on_screen():
		queue_free()
