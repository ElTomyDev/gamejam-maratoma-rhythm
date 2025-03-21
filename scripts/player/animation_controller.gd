extends Node2D
class_name AnimationController

var player: PlayerController

@onready var anim: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var player_sprite: Sprite2D = $"../player_sprite" as Sprite2D
@onready var dead_sprite: Sprite2D =  $"../dead_sprite" as Sprite2D

func setup(body) -> void:
	player = body
	player_sprite.visible = true
	dead_sprite.visible = false


func update(delta: float) -> void:
	update_animations()

func update_animations():
	"""
	Proposito:
		Actualiza, gestiona y elige todas las animaciones que tiene el jugador.
	"""
	flip_animations()
	play_idle_anim()
	play_walk_anim()
	play_jump_anim()
	play_fall_anim()
	play_dead_anim()

func flip_animations():
	if player.velocity.x < 0:
		player_sprite.flip_h = true
	elif player.velocity.x > 0:
		player_sprite.flip_h = false

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
	if !player.is_falling() && !player.is_on_floor():
		anim.play('Jump')

func play_fall_anim():
	"""
	Proposito:
		Ejecuta la animacion de caer si el player no esta en el suelo
	"""
	if player.is_falling() && !player.is_on_floor():
		anim.play('Fall')


func play_dead_anim():
	"""
	Proposito:
		Ejecuta la animacion de morir si el player esta muerto.
	"""
	if player.dead == true:
		player_sprite.visible = false
		dead_sprite.visible = true
		#anim.stop()
		if dead_sprite.visible == true:
			anim.play('Dead')
