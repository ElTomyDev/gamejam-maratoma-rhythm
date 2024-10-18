extends Node2D
class_name PlayerJump

var player : PlayerController

func setup(body) -> void:
	player = body


func update(delta: float) -> void:
	apply_jump(delta)

func apply_jump(delta):
	"""
	Proposito:
		Le aplica al player una fuerza de salto en el eje (Y) si es que el jugador preciono la 
		tecla de salto (is_jumping)
	Precondiciones:
		'player' no debe ser null y debe ser un nodo de la clase 'PlayerController'.
	"""
	if player.is_jumping() and player.is_on_floor():
		player.velocity.y = player.jump_force * delta
