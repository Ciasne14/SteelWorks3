extends Node

@onready var copy_wallpaper_button = %CopyWallpaperButton  # Adjust the path if needed

func _ready():
	# Connect the button pressed signal to the function
	copy_wallpaper_button.pressed.connect(on_copy_wallpaper_button_pressed)
	copy_current_wallpaper()

func on_copy_wallpaper_button_pressed():
	print("Button pressed, copying wallpaper...")
	copy_current_wallpaper()

func copy_current_wallpaper():
	var wallpaper_path = get_current_wallpaper()
	if wallpaper_path != "":
		var user_data_path = OS.get_user_data_dir() + "/copied_wallpaper.jpg"  # Change extension if needed
		
		# Copy the wallpaper to the user data directory
		var command = "cmd.exe"
		var args = ["/C", "copy", wallpaper_path, user_data_path.replace("/","\\")]
		var result = OS.execute(command, args)
		
		if result != OK:
			print("Failed to copy wallpaper.")
			return

		print("Wallpaper copied to: ", user_data_path)
		use_wallpaper(user_data_path)
		# Load the copied wallpaper as a texture
		load_wallpaper_as_texture(user_data_path)
	else:
		print("Failed to get current wallpaper path.")

func get_current_wallpaper() -> String:
	var path = ""
	var temp_file = OS.get_user_data_dir() + "/wallpaper_path.txt"
	
	var command = "cmd.exe"
	var args = ["/C", "reg", "query", "HKCU\\Control Panel\\Desktop", "/v", "Wallpaper", ">", temp_file]
	
	var result = OS.execute(command, args)
	
	if result != OK:
		print("Error retrieving wallpaper path.")
		return path
	
	# Read the wallpaper path from the temporary file
	if FileAccess.file_exists(temp_file):
		var file_access = FileAccess.open(temp_file, FileAccess.READ)
		var output = file_access.get_as_text()
		file_access.close()
		
		# Parse the output to find the wallpaper path
		path = get_wallpaper_path(output)
	else:
		print("Temporary file not found.")

	# Clean up the temporary file
	FileAccess.open(temp_file, FileAccess.WRITE).store_string("")  # Clear the temp file

	return path

func load_wallpaper_as_texture(image_path: String):
	var image = Image.new()
	if image.load(image_path) == OK:
		var texture = ImageTexture.new()
		texture.create_from_image(image)
		
		# Assuming you have a Sprite node to display the wallpaper
		var sprite = Sprite2D.new()
		sprite.texture = texture
		add_child(sprite)  # Add to the scene
	else:
		print("Failed to load image from: ", image_path)

func get_wallpaper_path(output: String) -> String:
	var pattern = r"C:\\[^\s]+\.jpg"
	var regex = RegEx.new()
	regex.compile(pattern)
	var match = regex.search(output)
	if match:
		return (match.get_string())
	else:
		return "No match found."

func use_wallpaper(image_path1):
	var image_path = "C:\\Users\\pawel\\AppData\\Roaming\\Godot\\app_userdata\\SteelWorks3\\copied_wallpaper.jpg"
	var image_texture = load_image(image_path)
	
	if image_texture:
		%Sprite.texture = image_texture
	else:
		print("Failed to load texture from: ", image_path)

# Function to load an image file and return a Texture
func load_image(path: String) -> Texture:
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var image_data = file.get_buffer(file.get_len())
		file.close()

		var image = Image.new()
		if image.load_png_from_buffer(image_data) == OK:
			var texture = ImageTexture.new()
			texture.create_from_image(image)
			return texture
		else:
			print("Failed to load image from buffer.")
	else:
		print("Failed to open file: ", path)

	return null

	return null
