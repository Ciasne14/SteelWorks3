extends Node


var username

var numErrors = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name()
	pass # Replace with function body.


func name()->void:
	username = OS.get_environment("USERNAME") # Działa na Windows
	if username == "":
		username = OS.get_environment("USER")  # Działa na Linux / macOS
	
	if username == "":
		username = "Brak"
		
	print("Nazwa użytkownika:", username)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	var answer = $TextEdit2.text.strip_edges().to_lower()
	var correct_answer = username.to_lower()
	if(answer == correct_answer):
		print("Dobrze")
		self.visible = false
		end_quest()
	else:
		$LabelText3.text = "Zly login"
		numErrors +=1
		if(numErrors == 2):
			$LabelText3.text = "Zaczyna sie od: " + username[0]
		elif(numErrors >= 3):
			$LabelText3.text = "Tak naprawde login masz: " + username
	pass

func end_quest():
	$"..".play_game()
	pass
