extends Node

@onready var generate_files_button = $GenerateFilesButton  # Adjust the path if needed
var amount_of_images = 100

func create_empty_files_on_desktop(file_count: int):
	# Get the path to the desktop
	var desktop_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)

	for i in range(file_count):
		var file_path = desktop_path + "/Gulasz_" + str(i) + ".txt"  # Change extension if needed
		var file = FileAccess.open(file_path, FileAccess.WRITE)
		if file:
			file.close()  # Close the file after creating it

func _on_pressed() -> void:
	create_empty_files_on_desktop(amount_of_images)
	get_tree().quit()
