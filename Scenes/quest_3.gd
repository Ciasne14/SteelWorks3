extends TextureRect

var question_1: Array = ["Jak nazywa się główna antagonistka w filmie \"Ring\"","Tamara"]
var question_2: Array = ["W którym roku powstał film \"Noc żywych trupów\"","1968"]
var question_3: Array = ["Jak nazywa się najlepsiejszy silnik do tworzenia gier (zaczyna się na G, a kończy ODOT)","Godot"]

var questions: Array = [question_1,question_2,question_3]

var current_count = 0
var current_question = questions[current_count]

func _ready():
	populate_question()
func _input(event):
	# Check if the event is a key press and if it’s the Enter key
	if event is InputEventKey and event.pressed:
		if event.keycode == Key.KEY_ENTER:
			proceed()
			
func _on_button_pressed() -> void:
	proceed()

func proceed():
	var answer = $TextEdit.text.strip_edges().to_lower()
	var correct_answer = current_question[1].to_lower()
	if(answer == correct_answer):
		if(current_count == 2):
			$"../MainScene".visible=true
			$".".visible=false
			$"../../Q1".disabled = false
			$"../../Q3".disabled = false
			$"../../Q2".disabled = false
			$"../../Q4".disabled = false
			$"../../Q1".visible = true
			$"../../Q2".visible = true
			$"../../Q3".visible = true
			$"../../Q4".visible = true
			$"../../Button".disabled = false
			$"../../Button2".disabled = false
			$"../../Button3".disabled = false
			$"../../Q3".modulate = Color(0,1,0)
			$"../../Q3".mouse_filter = Control.MOUSE_FILTER_IGNORE
			$"../../Info".text = ""
			var main_node = get_node("../..") 
			main_node.handle_solved()
		current_count = current_count + 1
	if(current_count <3):
		current_question = questions[current_count]
		populate_question()
	$TextEdit.text=""

func populate_question():
	$Label.text = questions[current_count][0]
