extends Label

func _ready():
	var tween = get_tree().create_tween()
	tween.set_loops(-1)  # -1 for infinite loop
	# First tween: modulate to red
	tween.tween_property($".", "modulate", Color.RED, 1.0)
	# Second tween: modulate back to white
	tween.tween_property($".", "modulate", Color.BLACK, 1.0)
