extends TextureRect


func _on_blue_pressed() -> void:
	$".".visible = false
	$"../MainScene".visible = true
	$"../../Q1".disabled = false
	$"../../Q3".disabled = false
	$"../../Q2".disabled = false
	$"../../Q4".disabled = false
	$"../../Q1".visible = true
	$"../../Q2".visible = true
	$"../../Q3".visible = true
	$"../../Q4".visible = true
	$"../../Stop".disabled = false
	$"../../Button".disabled = false
	$"../../Button2".disabled = false
	$"../../Button3".disabled = false
	$"../../Q2".modulate = Color(0,1,0)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$"../../Q2".mouse_filter = Control.MOUSE_FILTER_IGNORE
	$"../../CanvasLayer2/Info".text = ""
