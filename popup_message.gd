extends Control

# Duration for which the popup will be displayed
var display_time: float = 3.0
var fade_out_time: float = 1.0

func _ready() -> void:
	# Start with the popup hidden
	hide()
	modulate.a = 1  # Ensure the alpha is set to fully visible

func show_message(message: String) -> void:
	$Label.text = message  # Set the message text
	show()  # Show the popup
	_fade_out()  # Start fading out after showing

func _fade_out() -> void:
	# Set up a timer for the display duration
	var timer = Timer.new()
	timer.wait_time = display_time
	timer.one_shot = true

	# Connect the timer's timeout signal using a Callable
	timer.timeout.connect(Callable(self, "_on_timeout"))
	add_child(timer)
	timer.start()

func _on_timeout() -> void:
	# Start fading out the popup
	var dd= 1

func _on_fade_out_complete(tween: Node, key: String) -> void:
	hide()  # Hide the popup after fading out
