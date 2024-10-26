extends TextureRect

var buttons: Array 
var max_val = 0

func _ready():
	buttons = [$Button, $Button2, $Button3, $Button4, $Button5, $Button6, $Button7, $Button8, $Button9]
	set_random_values()

func set_random_values():
	max_val=0
	for button in buttons:
		var random_number = randi() % 100 + 1 
		button.disabled = false #
		button.text = str(random_number)
		if(random_number > max_val):
			max_val = random_number

func _on_button_pressed() -> void:
	$Button.disabled = true
	check_for_value(int($Button.text))

func _on_button_2_pressed() -> void:
	$Button2.disabled = true
	check_for_value(int($Button2.text))

func _on_button_3_pressed() -> void:
	$Button3.disabled = true
	check_for_value(int($Button3.text))

func _on_button_4_pressed() -> void:
	$Button4.disabled = true
	check_for_value(int($Button4.text))

func _on_button_5_pressed() -> void:
	$Button5.disabled = true
	check_for_value(int($Button5.text))

func _on_button_6_pressed() -> void:
	$Button6.disabled = true
	check_for_value(int($Button6.text))

func _on_button_7_pressed() -> void:
	$Button7.disabled = true
	check_for_value(int($Button7.text))

func _on_button_8_pressed() -> void:
	$Button8.disabled = true
	check_for_value(int($Button8.text))

func _on_button_9_pressed() -> void:
	$Button9.disabled = true
	check_for_value(int($Button9.text))

func check_for_value(button_val):
	if(button_val<=max_val ):
		max_val = button_val
	else:
		set_random_values()
	if are_all_buttons_disabled():
		$"../MainScene".visible=true
		$".".visible=false
		$"../../Q1".disabled = false
		$"../../Q3".disabled = false
		$"../../Q2".disabled = false
		$"../../Q4".disabled = false
		$"../../Q1".visible = true
		$"../../Q2".visible = true
		$"../../Q3".visible = true
		$"../../Q4".visible = true
		$"../../Button".disabled = false
		$"../../Button2".disabled = false
		$"../../Button3".disabled = false
		$"../../Q4".modulate = Color(0,1,0)
		$"../../Q4".mouse_filter = Control.MOUSE_FILTER_IGNORE
		$"../../CanvasLayer2/Info".text = ""
		var main_node = get_node("../..") 
		main_node.handle_solved()
		
func are_all_buttons_disabled() -> bool:
	for button in buttons:
		if not button.disabled:  # Check if the button is not disabled
			return false  # Return false if any button is enabled
	return true  # Return true if all buttons are disabled
