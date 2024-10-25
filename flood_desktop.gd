extends Node

@onready var generate_files_button = $GenerateFilesButton  # Adjust the path if needed
var amount_of_images = 20
func _ready():
	# Connect the button pressed signal to the function
	generate_files_button.pressed.connect(on_generate_files_button_pressed)

func on_generate_files_button_pressed():
	print("Button pressed, generating empty files...")
	create_empty_files_on_desktop(amount_of_images)  # Change the number to create more or fewer files

func create_empty_files_on_desktop(file_count: int):
	# Get the path to the desktop
	var desktop_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)

	for i in range(file_count):
		# Create a file path for the empty file
		var file_path = desktop_path + "/empty_file_" + str(i) + ".txt"  # Change extension if needed

		# Create an empty file using FileAccess
		var file = FileAccess.open(file_path, FileAccess.WRITE)
		
		if file:
			file.close()  # Close the file after creating it
			print("Created empty file:", file_path)
		else:
			print("Failed to create file:", file_path)

	print("Finished creating empty files.")
