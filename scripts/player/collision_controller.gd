extends Node2D
class_name CollisionController

var player: PlayerController

func setup(body) -> void:
	player = body

func update(delta: float) -> void:
	pass



func game_over():
	"""
	Elimina al jugador y reinicia el juego.
	"""
	player.queue_free()
	get_tree().reload_current_scene()

# Todas las señales apartir de aca...

func _on_dead_area_entered(area: Area2D) -> void:
	"""
	Proposito:
		Elimina al jugador y reinicia la escena si este entra en un area que corresponda al 
		layer 'DeadObject'.
	"""
	game_over()
