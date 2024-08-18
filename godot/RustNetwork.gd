extends NetworkControl

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect_to_host("127.0.0.1:5000")
