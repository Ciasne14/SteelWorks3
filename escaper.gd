extends  Sprite2D

const chaseSPEED = 500
var escapeSPEED = 2000.0
# The margin to keep the sprite inside the screen
var margin: float = 10.0
var chase = true
@export var button1: Button
	
func _ready():
	$Timer.start()

func _process(delta):
	if(chase):
		if is_mouse_over():
			$AudioStreamPlayer.play()
		else:
			print("Mouse is not over the sprite.")
		var vec = get_viewport().get_mouse_position() - self.position # getting the vector from self to the mouse
		vec = vec.normalized() * delta * chaseSPEED # normalize it and multiply by time and speed
		position += vec # move by that vector
	else:
		var mouse_pos = get_global_mouse_position()
		var direction = position - mouse_pos
		if direction.length() > 0:
			direction = direction.normalized()
			position += direction * escapeSPEED * delta
			clamp_position_within_screen()

func clamp_position_within_screen():
	var screen_size = get_viewport().get_visible_rect().size
	# Clamp the position on the x-axis
	position.x = clamp(position.x, margin, screen_size.x - margin)
	# Clamp the position on the y-axis
	position.y = clamp(position.y, margin, screen_size.y - margin)
	
func is_mouse_over() -> bool:
	# Get the mouse position relative to the scene
	var mouse_pos = get_global_mouse_position()
	# Check if the mouse is within the sprite's rectangle area
	return get_rect().has_point(to_local(mouse_pos))


func _on_timer_timeout() -> void:
	chase = false
	print("Boolean changed to: ", chase)

signal health_changed(new_value)

func clicked():
	emit_signal("monsterCatched")
	
func _on_button_pressed() -> void:
	var test = get_node("../Q1")
	test.modulate = Color(0,0,0)
