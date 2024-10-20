extends Node2D
class_name MoveObstacle

var obstacle: ColumnController


func setup(body) -> void:
	obstacle = body


func update(delta: float) -> void:
	move(delta, obstacle.current_dir)

func move(delta, direction):
	"""
	Proposito:
		Mueve un obstaculo hacia la direccion *direction* indicada en el parametro.
	"""
	match direction:
		"top":
			obstacle.position.y -= obstacle.speed * delta
		"down":
			obstacle.position.y += obstacle.speed * delta
		"":
			obstacle.position.y = obstacle.position.y
	
