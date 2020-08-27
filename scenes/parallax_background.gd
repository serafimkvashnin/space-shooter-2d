extends ParallaxBackground

onready var space = get_parent()

const SPEED = 400.0
var speed = 0

func _process(delta):
	speed = SPEED + space.score * Constants.BACKGROUND_SPEED_MULTIPLIER
	scroll_offset += Vector2.LEFT * speed * delta
