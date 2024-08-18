extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RustNetwork.connect("new_map_received", handle_new_map)

func handle_new_map(height: int, width: int, gold: int):
	for x in range(width):
		for y in range(height):
			$Map/Ground.set_cell(Vector2i(x, y), 2, Vector2i(9, 2))
	$UI/MarginContainer/HSplitContainer/NbGold.text = str(gold)
