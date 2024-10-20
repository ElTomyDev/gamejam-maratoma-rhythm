extends CharacterBody2D
class_name ColumnController

@onready var movement: MoveObstacle = $move_obstacle as MoveObstacle

@export_category('Movement')
@export var speed:float = 25
@export var current_dir:StringName = ""


func _ready() -> void:
	movement.setup(self)


func _process(delta: float) -> void:
	movement.update(delta)


func _on_detect_dir_points_area_entered(area: Area2D) -> void:
	"""pass # Replace with function body.
	Proposito:
		Cambia la direccion actual del obstaculo dependiendo si este colisiono con algun
		punto de direccion. La direccion se obtiene de dicho punto.
	"""
	if area.is_in_group('DirectionPoints'):
		current_dir = area.direction
