class_name CandyBar extends Node2D

func _ready() -> void:
	$AudioStreamPlayer.play(0.7)

func _process(delta: float) -> void:
	position.x += 10
	rotation_degrees += 1
