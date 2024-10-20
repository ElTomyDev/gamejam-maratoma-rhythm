extends Node2D
class_name MusicController

@onready var drums_player: AudioStreamPlayer2D = $drums as AudioStreamPlayer2D
@onready var other: AudioStreamPlayer2D = $other as AudioStreamPlayer2D

func _ready() -> void:
	drums_player.play()
	other.play()
