extends Node2D

var screen_size
var pad_size
var direction = Vector2(1.0,0.0)

# Constant for ball speed (in pixels/second)
const INITIAL_BALL_SPEED = 80
# Speed of the ball (also in pixels/second)
var ball_speed = INITIAL_BALL_SPEED
# Constant for pads speed
const PAD_SPEED = 150

func _ready():
	screen_size = get_viewport_rect().size
	pad_size = get_node("Left").get_texture().get_size()
	set_process(true)
	pass
	
func _process(delta):
	var ball_pos = get_node("Ball").get_pos()
	var left_rect = Rect2( get_node("Left").get_pos() - pad_size*0.5, pad_size )
	var right_rect = Rect2( get_node("Right").get_pos() - pad_size*0.5, pad_size )
	# Integrate new ball position
	ball_pos += direction * ball_speed * delta
	# Flip when tocuhing roof or floor
	if ((ball_pos.y < 0 and direction.y < 0) or (ball_pos.y > screen_size.y and direction.y > 0 )):
		direction.y = -direction.y
	
	
