extends Node

var is_fullscreen: bool = false

func _ready():
	$Q1.modulate = Color(255,255,255)
	$Q2.modulate = Color(255,255,255)
	$Q3.modulate = Color(255,255,255)
	$Q4.modulate = Color(255,255,255)
	get_tree().set_auto_accept_quit(false)

func _input(event):
	# Check if the event is a KeyEvent (keyboard event)
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == Key.KEY_ALT:
				print("Alt key is blocked.")
				return  # Ignore the Alt key press


func _on_q_1_mouse_entered() -> void:
	$Q1.modulate = Color(0,0,1)

func _on_q_1_mouse_exited() -> void:
	$Q1.modulate = Color(255,255,255)

func _on_q_2_mouse_entered() -> void:
	$Q2.modulate = Color(0,0,1)

func _on_q_2_mouse_exited() -> void:
	$Q2.modulate = Color(255,255,255)


func _on_q_3_mouse_entered() -> void:
	$Q3.modulate = Color(0,0,1)

func _on_q_3_mouse_exited() -> void:
	$Q3.modulate = Color(255,255,255)

func _on_q_4_mouse_entered() -> void:
	$Q4.modulate = Color(0,0,1)

func _on_q_4_mouse_exited() -> void:
	$Q4.modulate = Color(255,255,255)
