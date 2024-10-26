extends  Sprite2D

const SPEED = 500

func _process(delta):
	if is_mouse_over():
		print("Mouse is over the sprite!")
	else:
		print("Mouse is not over the sprite.")
	var vec = get_viewport().get_mouse_position() - self.position # getting the vector from self to the mouse
	vec = vec.normalized() * delta * SPEED # normalize it and multiply by time and speed
	position += vec # move by that vector

func is_mouse_over() -> bool:
	# Get the mouse position relative to the scene
	var mouse_pos = get_global_mouse_position()
	
	# Check if the mouse is within the sprite's rectangle area
	return get_rect().has_point(to_local(mouse_pos))
