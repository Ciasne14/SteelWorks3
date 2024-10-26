var local_path = "C:\\image.png"

func _ready():
	var image = Image.new()
	var error = image.load(local_path)
	
	if error == OK:
		var image_texture = ImageTexture.new()
		image_texture.create_from_image(image)
		var texture_rect = $TextureRect
		texture_rect.texture = image_texture
		print("Texture applied successfully")
	else:
		print("Failed to load the image file:", error)
