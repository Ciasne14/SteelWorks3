extends TextureRect
# Path to the local image file
var local_path = "C:\\Users\\pawel\\Desktop\\copied_wallpaper.png"


func _ready():
	use_copied_wallpaper(get_current_wallpaper())
	print(get_current_wallpaper())
	
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

#func copy_current_wallpaper():
	#var wallpaper_path = get_current_wallpaper()
	#if wallpaper_path != "":
		#var user_data_path = OS.get_user_data_dir() + "/copied_wallpaper.jpg"  # Change extension if needed
		#
		## Copy the wallpaper to the user data directory
		#var command = "cmd.exe"
		#var args = ["/C", "copy", wallpaper_path, user_data_path.replace("/","\\")]
		#var result = OS.execute(command, args)
		#
		#if result != OK:
			#print("Failed to copy wallpaper.")
			#return
#
		#print("Wallpaper copied to: ", user_data_path)
		##use_wallpaper(user_data_path)
		## Load the copied wallpaper as a texture
		#use_copied_wallpaper(user_data_path)
	#else:
		#print("Failed to get current wallpaper path.")
		
func use_copied_wallpaper(local_path):
	var image = Image.new()
	var error = image.load(local_path)
	
	if error != OK:
		print("Error loading image:", error)
		return
	
	if image.is_empty():
		print("Loaded image is empty.")
		return
	
	print("Image width:", image.get_width(), "Image height:", image.get_height())
	
	var texture = ImageTexture.new()
	var ready_texture = texture.create_from_image(image)
	
	var sprite = $"."  # Adjust node path as needed
	if sprite and sprite is TextureRect or sprite is Sprite2D:
		sprite.texture = ready_texture
		print("Texture applied successfully.")
	else:
		print("Sprite node not found or invalid node type.")

func get_wallpaper_path(output: String) -> String:
	var pattern = r"C:\\[^\s]+\.jpg"
	var regex = RegEx.new()
	regex.compile(pattern)
	var match = regex.search(output)
	if match:
		return (match.get_string())
	else:
		return "No match found."
