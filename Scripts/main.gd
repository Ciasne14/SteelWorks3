extends Node

var is_fullscreen: bool = false
var buttons_are_enabled = true
var solved = 0

func _ready():
	get_tree().set_auto_accept_quit(false)
	_on_q_start_pressed()

func _input(event):
	# Check if the event is a KeyEvent (keyboard event)
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == Key.KEY_ALT:
				$althandler.visible = true
				return  # Ignore the Alt key press

func _on_q_1_mouse_entered() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q1.modulate != Color(0,1,0)):
		$Background/MainScene/Q1.modulate = Color(0,0,1)

func _on_q_1_mouse_exited() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q1.modulate != Color(0,1,0)):
		$Background/MainScene/Q1.modulate = Color(255,255,255)

func _on_q_2_mouse_entered() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q2.modulate != Color(0,1,0)):
		$Background/MainScene/Q2.modulate = Color(0,0,1)

func _on_q_2_mouse_exited() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q2.modulate != Color(0,1,0)):
		$Background/MainScene/Q2.modulate = Color(255,255,255)

func _on_q_3_mouse_entered() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q3.modulate != Color(0,1,0)):
		$Background/MainScene/Q3.modulate = Color(0,0,1)

func _on_q_3_mouse_exited() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q3.modulate != Color(0,1,0)):
		$Background/MainScene/Q3.modulate = Color(255,255,255)

func _on_q_4_mouse_entered() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q4.modulate != Color(0,1,0)):
		$Background/MainScene/Q4.modulate = Color(0,0,1)

func _on_q_4_mouse_exited() -> void:
	if(buttons_are_enabled && $Background/MainScene/Q4.modulate != Color(0,1,0)):
		$Background/MainScene/Q4.modulate = Color(255,255,255)

func _on_q_1_pressed() -> void:
	$Background/MainScene/Q1.visible=false
	$Background/MainScene/Q2.visible=false
	$Background/MainScene/Q3.visible=false
	$Background/MainScene/Q4.visible=false
	$CanvasLayer2/Info.text = "Uciekaj!"
	var escaper =$Escaper
	escaper.activated = true
	$Escaper/Timer.start()
	$Escaper.visible=true
	disable_enable_buttons(true)

func _on_q_2_pressed() -> void:
	$Background/MainScene/Q1.visible=false
	$Background/MainScene/Q2.visible=false
	$Background/MainScene/Q3.visible=false
	$Background/MainScene/Q4.visible=false
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	$CanvasLayer2/Info.text = "Nacisnij granatowe pole"
	$Background/MainScene/Quest2.visible = true

func disable_enable_buttons(disableOrEnable):
	buttons_are_enabled = disableOrEnable
	$Button.disabled = disableOrEnable
	$Button2.disabled = disableOrEnable
	$Button3.disabled = disableOrEnable
	if($Background/MainScene/Q1.modulate != Color(0,1,0)):
		$Background/MainScene/Q1.disabled = disableOrEnable
	if($Background/MainScene/Q2.modulate != Color(0,1,0)):
		$Background/MainScene/Q2.disabled = disableOrEnable
	if($Background/MainScene/Q3.modulate != Color(0,1,0)):
		$Background/MainScene/Q3.disabled = disableOrEnable
	if($Background/MainScene/Q4.modulate != Color(0,1,0)):
		$Background/MainScene/Q4.disabled = disableOrEnable


func _on_q_3_pressed() -> void:
	$Background/MainScene/Q1.visible=false
	$Background/MainScene/Q2.visible=false
	$Background/MainScene/Q3.visible=false
	$Background/MainScene/Q4.visible=false
	$Background/MainScene/Quest3.visible = true

# Function to create and display a popup
func _create_popup():
	#var popup_instance = popup_scene.instantiate()  # Create an instance of the popup
	#add_child(popup_instance)  # Add popup to the scene
	#popup_instance.popup_centered()  # Show the popup in the center of the screen
	pass

func _on_q_4_pressed() -> void:
	$CanvasLayer2/Info.text = "Wyeliminuj klocki od najwyższej wartości"
	$Background/MainScene/Q1.visible=false
	$Background/MainScene/Q2.visible=false
	$Background/MainScene/Q3.visible=false
	$Background/MainScene/Q4.visible=false
	$Background/MainScene/Quest4.visible = true

func handle_solved():
	solved = solved +  1
	$"Event Director".haunt += 1
	if(solved == 4):
		$CanvasLayer2/Info.text = "Twoja dusza jest wolna, ale nie od gulaszu"
		$Stop.disabled=false
		$"Event Director/EventTimer".stop()
		
func _on_q_start_pressed() -> void:
	$CanvasLayer2/Info.text = "Wpisz nazwe uzytkownika: "
	$Background/MainScene/Q1.visible=false
	$Background/MainScene/Q2.visible=false
	$Background/MainScene/Q3.visible=false
	$Background/MainScene/Q4.visible=false
	
