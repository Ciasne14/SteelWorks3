extends Control


func _input(event):
	# Check if the event is a KeyEvent (keyboard event)
	if event is InputEventKey:
		if event.pressed:
			if event.pressed: 
				next()

func _on_video_stream_player_finished() -> void:
	next()
	
func next():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
