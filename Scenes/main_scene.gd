extends TextureRect

var bus_name: String
var bus_index: int

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
		


func _on_stop_pressed() -> void:
	get_tree().quit()


# Maksymalna i minimalna wartość głośności, tutaj ustawiona od 0 do 1 (czyli od 0% do 100%)
@export var max_volume: float = 1.0
@export var min_volume: float = 0.0

# Krok głośności, który zwiększa/zmniejsza się za każdym naciśnięciem przycisku
@export var volume_step: float = 0.1

# Aktualna głośność
var current_volume: float = 0.5

# Metoda zwiększająca głośność
func _on_vol_up_pressed() -> void:
	current_volume = min(current_volume + volume_step, max_volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(current_volume))
	print("Głośność zwiększona: ", current_volume)

# Metoda zmniejszająca głośność
func _on_vol_down_pressed() -> void:
	current_volume = max(current_volume - volume_step, min_volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(current_volume))
	print("Głośność zmniejszona: ", current_volume)


func _on_credits_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$CenterContainer/Credits.show()
	else:
		$CenterContainer/Credits.hide()
