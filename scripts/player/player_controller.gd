extends CharacterBody2D
class_name PlayerController

@onready var movement: PlayerMovement = $movement as PlayerMovement

# Variables para el movimiento horizontal
@export_category('Movement')
@export var max_speed: float = 180
@export var acceleration: float = 12
@export var deceleration: float = 10

@export_category('Controls')
@export var move_right_key: StringName = 'move_right'
@export var move_left_key: StringName = 'move_left'

func _ready() -> void:
	movement.setup(self)

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	movement.update(delta)
	move_and_slide()

func get_hor_direction():
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
		Le aplica al jugador una fuerza de gravedad constante si es que este no esta en el suelo.
	Observacion:
		La fuerza de gravedad se obtiene de las configuraciones del proyecto dentro del motor
		la cual por defecto es 980.
	"""
	if not is_on_floor():
		velocity += get_gravity() * delta
