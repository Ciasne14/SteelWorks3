extends Control

# Parametry rotacji
var rotation_speed: float = 0.0
var is_rotating: bool = false 
var events = []
var haunt: float = 0.0

func _ready() -> void:
	events = [start_random_rotation, volume_down, volume_up, play_whisper]

# Funkcja losująca i uruchamiająca event
func start_random_event():
	var event_index = randi() % events.size()
	var selected_event = events[event_index]
	selected_event.call()
	$EventTimer.wait_time = randf_range(3.5-haunt, 7-haunt*2)
	$EventTimer.start()
	
func _on_event_timer_timeout() -> void:
	start_random_event()
	
func play_whisper():
	$"../Background/MainScene".play_whisper()
	
func volume_down() -> void:
	var vol_down_button = $"../VolDown"
	vol_down_button.texture_normal = preload("res://Images/buttonpressed.png")
	$"../Background/MainScene".on_vol_down_pressed()
	await get_tree().create_timer(1.0).timeout  # Czekaj na 1 sekundę
	vol_down_button.texture_normal = preload("res://Images/button.png")  # Przywróć normalną teksturę
	
		
func volume_up():
	var vol_up_button = $"../VolUp"
	vol_up_button.texture_normal = preload("res://Images/buttonpressed.png")
	$"../Background/MainScene".on_vol_up_pressed()
	await get_tree().create_timer(1.0).timeout  # Czekaj na 1 sekundę
	vol_up_button.texture_normal =  preload("res://Images/button.png")
	
# Funkcja odpowiedzialna za uruchomienie obrotu z losową prędkością i czasem
func start_random_rotation():
	# Losowanie prędkości obrotu (prędkość może być dodatnia lub ujemna)
	$"../Background/MainScene".pivot_offset = $"../Background/MainScene".size/2
	rotation_speed = randf_range(-0.05, 0.05)
	is_rotating = true  # Włączenie obrotu

	# Losowy czas obrotu
	var rotation_duration = randf_range(1.0, 4.0)
	$SpinTimer.start(rotation_duration)  # Ustawienie timera na losowy czas

# Funkcja `_process` odpowiedzialna za aktualizację obrotu w każdej klatce
func _process(delta: float) -> void:
	if is_rotating:
		# Obracaj tło zgodnie z wylosowaną prędkością
		$"../Background/MainScene".rotation += rotation_speed * delta

	
# Sygnał `timeout` z `SpinTimer`, zatrzymuje obrót po ustalonym czasie
func _on_SpinTimer_timeout() -> void:
	is_rotating = false
