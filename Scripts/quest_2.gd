extends TextureRect

func _on_blue_pressed() -> void:
	$".".visible = false
	$"../MainScene".visible = true
	$"../MainScene/Q1".disabled = false
	$"../MainScene/Q3".disabled = false
	$"../MainScene/Q2".disabled = false
	$"../MainScene/Q4".disabled = false
	$"../MainScene/Q1".visible = true
	$"../MainScene/Q2".visible = true
	$"../MainScene/Q3".visible = true
	$"../MainScene/Q4".visible = true
	$"../../Button".disabled = false
	$"../../Button2".disabled = false
	$"../../Button3".disabled = false
	$"../MainScene/Q2".modulate = Color(0,1,0)
	
	$"../MainScene/Q2".icon.load("res://.godot/imported/fileWirte.png-7a131dc8f8081ad60e6f3f4da5f89cd8.ctex")
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$"../MainScene/Q2".mouse_filter = Control.MOUSE_FILTER_IGNORE
	$"../../CanvasLayer2/Info".text = ""
	var main_node = get_node("../..") 
	main_node.handle_solved()
	
