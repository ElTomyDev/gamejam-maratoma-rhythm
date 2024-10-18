extends Node2D
class_name AnimationController

var player: PlayerController

@onready var anim: AnimationPlayer = $AnimationPlayer as AnimationPlayer

func setup(body) -> void:
	player = body


func update(delta: float) -> void:
	update_animations()

func update_animations():
	"""
	Proposito:
		Actualiza, gestiona y elige todas las animaciones que tiene el jugador.
	"""
	play_idle_anim()
	play_walk_anim()
	play_jump_anim()
	play_fall_anim()

func play_walk_anim():
	"""
	Proposito:
		Ejecuta la animacion de caminar si el player en la direccion horizontal
		es diferente a 0.
	"""
	if player.get_hor_direction() != 0:
		anim.play('Walk')

func play_idle_anim():
	"""
	Proposito:
		Ejecuta la animacion de estar quieto si el player en la direccion horizontal
		es igual a 0.
	"""
	if player.get_hor_direction() == 0:
		anim.play('Idle')

func play_jump_anim():
	"""
	Proposito:
		Ejecuta la animacion de saltar si el jugador preciono la tecla de salto (is_jumping).
	"""
	if player.is_jumping():
		anim.play('Jump')

func play_fall_anim():
	"""
	Proposito:
		Ejecuta la animacion de caer si el player no esta en el suelo
	"""
	if player.in_air():
		anim.play('Fall')
