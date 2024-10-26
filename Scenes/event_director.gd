extends Control

# Parametry rotacji
var rotation_speed: float = 0.0
var is_rotating: bool = false  # Kontrola obrotu
var events = []

func _ready() -> void:
	events = [volume_down]
	start_random_event()  # Rozpocznij losowy event po starcie

# Funkcja losująca i uruchamiająca event
func start_random_event():
	var event_index = randi() % events.size()
	var selected_event = events[event_index]
	selected_event.call()  # Wywołaj wylosowany event za pomocą `call`
	
func volume_down() -> void:
	#$"../Background/MainScene".on_vol_down_pressed()
	$"../VolDown".pressed
	$"../VolDown/Timer".start()
	await $"../VolDown/Timer".timeout
	#$"../VolDown".texture_normal
	start_random_event()
		
func volume_up():
	$"../VolUp".pressed
	
# Funkcja odpowiedzialna za uruchomienie obrotu z losową prędkością i czasem
func start_random_rotation():
	# Losowanie prędkości obrotu (prędkość może być dodatnia lub ujemna)
	$"../Background/MainScene".pivot_offset = $"../Background/MainScene".size/2
	rotation_speed = randf_range(-0.1, 0.1)
	is_rotating = true  # Włączenie obrotu

	# Losowy czas obrotu
	var rotation_duration = randf_range(2.0, 5.0)
	$SpinTimer.start(rotation_duration)  # Ustawienie timera na losowy czas

# Funkcja `_process` odpowiedzialna za aktualizację obrotu w każdej klatce
func _process(delta: float) -> void:
	if is_rotating:
		# Obracaj tło zgodnie z wylosowaną prędkością
		$"../Background/MainScene".rotation += rotation_speed * delta

# Funkcja zatrzymująca obrót (wywoływana po zakończeniu `SpinTimer`)
func stop_rotation():
	is_rotating = false  # Wyłączenie obrotu
	var event_delay = randf_range(1,1)
	$EventTimer.start(event_delay)
	
# Sygnał `timeout` z `SpinTimer`, zatrzymuje obrót po ustalonym czasie
func _on_SpinTimer_timeout() -> void:
	stop_rotation()

# Sygnał `timeout` z `EventTimer`, wywołujący nowy losowy event
func _on_EventTimer_timeout() -> void:
	start_random_event()  # Wywołaj nowy losowy event
