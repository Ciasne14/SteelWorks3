extends Node

var is_fullscreen: bool = false
var buttons_are_enabled = true

func _ready():
	get_tree().set_auto_accept_quit(false)
	

func _input(event):
	# Check if the event is a KeyEvent (keyboard event)
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == Key.KEY_ALT:
				print("Alt key is blocked.")
				return  # Ignore the Alt key press

func _on_q_1_mouse_entered() -> void:
	if(buttons_are_enabled):
		$Q1.modulate = Color(0,0,1)

func _on_q_1_mouse_exited() -> void:
	if(buttons_are_enabled):
		$Q1.modulate = Color(255,255,255)

func _on_q_2_mouse_entered() -> void:
	if(buttons_are_enabled):
		$Q2.modulate = Color(0,0,1)

func _on_q_2_mouse_exited() -> void:
	if(buttons_are_enabled):
		$Q2.modulate = Color(255,255,255)

func _on_q_3_mouse_entered() -> void:
	if(buttons_are_enabled):
		$Q3.modulate = Color(0,0,1)

func _on_q_3_mouse_exited() -> void:
	if(buttons_are_enabled):
		$Q3.modulate = Color(255,255,255)

func _on_q_4_mouse_entered() -> void:
	if(buttons_are_enabled):
		$Q4.modulate = Color(0,0,1)

func _on_q_4_mouse_exited() -> void:
	if(buttons_are_enabled):
		$Q4.modulate = Color(255,255,255)

func _on_q_1_pressed() -> void:
	$Escaper.visible=true
	disable_enable_buttons(true)

func disable_enable_buttons(disableOrEnable):
	buttons_are_enabled = false
	$Play.disabled = disableOrEnable
	$VolDown.disabled = disableOrEnable 
	$VolUp.disabled = disableOrEnable 
	$Credits.disabled = disableOrEnable
	$Stop.disabled = disableOrEnable
	$Button.disabled = disableOrEnable
	$Button2.disabled = disableOrEnable
	$Button3.disabled = disableOrEnable
	$Q1.disabled = disableOrEnable
	$Q3.disabled = disableOrEnable
	$Q2.disabled = disableOrEnable
	$Q4.disabled = disableOrEnable
