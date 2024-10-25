extends Control

# Assuming you have a PopupMessage scene
var PopupMessageScene = preload("res://popup_message.tscn")
var popup_instance: Control

func _ready() -> void:
	# Instance the popup message and add it to the scene
	popup_instance = PopupMessageScene.instantiate()
	add_child(popup_instance)

	# Example of showing a message
	show_popup("Hello, this is a popup message!")

func show_popup(message: String) -> void:
	popup_instance.show_message(message)  # Call the modified function
