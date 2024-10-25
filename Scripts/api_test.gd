extends Node

@onready var http_request = $HTTPRequest
@onready var button = $RequestButton  # Adjust the path if needed

const troll_url = "https://7404-193-193-81-36.ngrok-free.app/api/my_chat/"

func _ready():
	button.pressed.connect(on_button_pressed)
	http_request.request_completed.connect(_on_HTTPRequest_request_completed)
	# Get the Timer node
	var api_timer = %ApiTimer  # Adjust this path if needed
	api_timer.wait_time = 1.0  # Set the timer to 1 second
	api_timer.one_shot = false  # Ensure it repeats
	api_timer.start()  # Start the timer

	# Connect the timeout signal
	api_timer.timeout.connect(Callable(self, "connect_to_api"))

	connect_to_api()

func on_button_pressed():
	var error = http_request.request(troll_url)
	if error != OK:
		print("Request failed to start, error code:", error)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print("Response body:", body.get_string_from_utf8())  # For debugging
	var response = body.get_string_from_utf8()
	var regex = RegEx.new()
	regex.compile('"response":\\s*"([^"]*)"')
	var match = regex.search(response)
	if match:
		var response_value = match.get_string(1)
		$ResponseText.text=response_value
		print(response_value)  # Output: "chyba dziala"
	else:
		print("No match found")

func connect_to_api():
	var error = http_request.request(troll_url)
	if error != OK:
		print("Request failed to start, error code:", error)


func _on_api_timer_timeout() -> void:
	var dd = 5
