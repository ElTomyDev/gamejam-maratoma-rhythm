extends Control
class_name MenuController

@onready var play_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	"""
	Proposito:
		Inicia el juego si se preciona el boton play.
	"""
	get_tree().change_scene_to_file("res://scenes/Words/level_1.tscn")
