extends Node

var is_fullscreen: bool = false

func _ready():
	get_tree().set_auto_accept_quit(false)

func _input(event):
	# Check if the event is a KeyEvent (keyboard event)
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == Key.KEY_ALT:
				print("Alt key is blocked.")
				return  # Ignore the Alt key press
