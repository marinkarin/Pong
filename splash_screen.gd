extends TextureFrame

func _ready():
	set_process(true)
	
func _process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		get_tree().change_scene("res://Pong.tscn")
	
