extends Node2D
class_name CollisionController

var player: PlayerController
@onready var anim: AnimationPlayer = $"../animation_controller/AnimationPlayer"

func setup(body) -> void:
	player = body

func update(delta: float) -> void:
	pass



func game_over():
	"""
	Elimina al jugador y reinicia el juego.
	"""
	player.dead = true
	player.queue_free()
	get_tree().reload_current_scene()

func win_game():
	"""
	Proposito:
		Ganas la partida y volvees al menu.
	"""
	get_tree().change_scene_to_file('res://scenes/ui/main_menu.tscn')

# Todas las señales apartir de aca...

func _on_dead_area_entered(area: Area2D) -> void:
	"""
	Proposito:
		Elimina al jugador y reinicia la escena si este entra en un area que corresponda al 
		layer 'DeadObject'.
	"""
	game_over()


func _on_win_area_entered(area: Area2D) -> void:
	"""
	Proposito:
		Hace que ganes la partida y te devuelve al menu principal
	"""
	win_game()
