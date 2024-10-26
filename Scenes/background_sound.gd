extends AudioStreamPlayer

func _on_finished() -> void:
	var new_audio_stream = load("res://Images/background_at_start.mp3")
	$".".stream = new_audio_stream
	$".".play()
