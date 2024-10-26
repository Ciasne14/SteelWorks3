var local_path = "C:\\image.png"

func _ready():
	# Load the image from disk
	var image = Image.new()
	var error = image.load(local_path)
	
	if error == OK:
		# Create an ImageTexture and set it with the loaded image
		var image_texture = ImageTexture.new()
		image_texture.create_from_image(image)
		
		# Assume there is a TextureRect node named "TextureRect" in the scene
		var texture_rect = $TextureRect
		texture_rect.texture = image_texture
		print("Texture applied successfully")
	else:
		print("Failed to load the image file:", error)
