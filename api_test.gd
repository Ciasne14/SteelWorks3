extends Node

@onready var http_request = $HTTPRequest
@onready var button = $RequestButton  # Adjust the path if needed

const CAT_FACT_URL = "https://catfact.ninja/fact"

func _ready():
	button.pressed.connect(on_button_pressed)
	http_request.request_completed.connect(_on_HTTPRequest_request_completed)

func on_button_pressed():
	print("Button pressed, sending request for a cat fact...")
	var error = http_request.request(CAT_FACT_URL)
	if error != OK:
		print("Request failed to start, error code:", error)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print("Response body:", body.get_string_from_utf8())  # For debugging
	var json = JSON.new()
	print("Cat Fact:", body.get_string_from_utf8())  # This will print just the fact
	$ResponseText.text=body.get_string_from_utf8()
