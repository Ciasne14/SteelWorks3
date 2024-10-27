extends Control

# Zmienna przechowująca listę linii dialogowych
var lines = []
var current_line = 0

# Referencja do Label
@onready var label = $Label

# Funkcja do ustawienia tekstu
func set_lines(new_lines: Array):
	lines = new_lines
	current_line = 0
	show_line()

# Wyświetla bieżącą linię dialogu
func show_line():
	if current_line < lines.size():
		label.text = lines[current_line]
		current_line += 1
	else:
		queue_free() # Usuń dymek, gdy dialog się skończy

# Wywoływana, gdy gracz kliknie na dymek lub naciśnie przycisk
func _input(event):
	if event.is_action_pressed("ui_accept"):
		show_line()
