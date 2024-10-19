extends CharacterBody2D
class_name PlayerController

@onready var movement: PlayerMovement = $movement as PlayerMovement
@onready var jump: PlayerJump = $jump as PlayerJump
@onready var animation_controller: AnimationController = $animation_controller as AnimationController
@onready var collision_controller: CollisionController = $collision_controller as CollisionController

# Variables para el movimiento horizontal
@export_category('Movement')
@export var max_speed: float = 180
@export var acceleration: float = 12
@export var deceleration: float = 10

@export_category('Jump')
@export var jump_force: float = -30000

@export_category('Controls')
@export var move_right_key: StringName = 'move_right'
@export var move_left_key: StringName = 'move_left'
@export var jump_key: StringName = 'jump'

func _ready() -> void:
	animation_controller.setup(self)
	collision_controller.setup(self)
	movement.setup(self)
	jump.setup(self)

func _process(delta: float) -> void:
	collision_controller.update(delta)
	animation_controller.update(delta)

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	movement.update(delta)
	jump.update(delta)
	move_and_slide()

func is_jumping() -> bool:
	"""
	Proposito:
		Indica si el jugador preciono o no la tecla de salto.
	"""
	return Input.is_action_just_pressed(jump_key)

func is_falling() -> bool:
	"""
	Proposito:
		Indica si el jugador esta o no en el aire.
	"""
	return self.velocity.y > 0

func get_hor_direction() -> int:
	"""
	Proposito:
		Indica el valor para cada tecla del teclado. 1 si es a la derecha, -1 si es a la izquierda
		y 0 si no se preciona nada.
	Tipo:
		Numero.
	"""
	return Input.get_action_strength(move_right_key) - Input.get_action_strength(move_left_key)

func apply_gravity(delta:float):
	"""
	Proposito:
		Le aplica al player una fuerza de gravedad constante si es que este no esta en el suelo.
	Observacion:
		La fuerza de gravedad se obtiene de las configuraciones del proyecto dentro del motor
		la cual por defecto es 980.
	"""
	if not is_on_floor():
		velocity += get_gravity() * delta
