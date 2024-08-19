extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RustNetwork.connect("new_map_received", handle_new_map)
	RustNetwork.connect("update_map_received", handle_update_map)

func handle_new_map(height: int, width: int, gold: int):
	for x in range(width):
		for y in range(height):
			$Map/Ground.set_cell(Vector2i(x, y), 2, Vector2i(9, 2))
	$UI/MarginContainer/HSplitContainer/NbGold.text = str(gold)
	
func handle_update_map(gold: int):
	$UI/MarginContainer/HSplitContainer/NbGold.text = str(gold)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var coords = $Map/Ground.local_to_map($Map/Ground.to_local(event.position))
			RustNetwork.send_build_message(coords.x, coords.y)
			$Map/Buildings.set_cell(coords, 0, Vector2i(0, 0))
