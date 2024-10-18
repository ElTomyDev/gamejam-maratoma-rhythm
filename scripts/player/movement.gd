extends Node2D
class_name PlayerMovement

var player : PlayerController

func setup(body: PlayerController) -> void:
	player = body


func update(delta: float) -> void:
	horizontal_movement(delta)

func horizontal_movement(delta: float):
	"""
	Proposito:
		Mueve al player en el eje x dependiendo de la direccion horizontal
		(get_hor_direction) a la cual el jugador se quiera mover. Este movimiento
		es suave para dar una mejor fluides.
	Precondiciones:
		'player' no debe ser null y debe ser un nodo de la clase 'PlayerController'.
	"""
	if player.get_hor_direction() != 0:
		player.velocity.x = lerp(player.velocity.x, player.max_speed * player.get_hor_direction(), player.acceleration * delta)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0 , player.deceleration * delta)
