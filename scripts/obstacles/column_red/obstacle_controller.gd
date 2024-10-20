extends CharacterBody2D
class_name ObstacleController

@onready var movement: MoveObstacle = $move_obstacle as MoveObstacle
@onready var spectrum: SpectrumSoundController = $spectrum_controller as SpectrumSoundController

@export_category('Movement')
@export var normal_speed:float = 40
var speed:float = normal_speed
@export var current_dir:StringName = ""


func _ready() -> void:
	movement.setup(self)


func _process(delta: float) -> void:
	toggle_speed_to_drums()
	movement.update(delta)

func toggle_speed_to_drums():
	"""
	Proposito:
		Cambia le velocidad de el obstaculo dependiendo el instrumento de bateria
		que suene en la istrumental. Si es el bombo (kick) la velocidad es 25.0, si el instrumento que suena
		es el redoblante (snare) la velocidad cambia a 0.
	"""
	if spectrum.kick == true:
		speed = normal_speed
	elif spectrum.snare == true:
		speed = 0

func _on_detect_dir_points_area_entered(area: Area2D) -> void:
	"""
	Proposito:
		Cambia la direccion actual del obstaculo dependiendo si este colisiono con algun
		punto de direccion. La direccion se obtiene de dicho punto.
	"""
	if area.is_in_group('DirectionPoints'):
		current_dir = area.direction
