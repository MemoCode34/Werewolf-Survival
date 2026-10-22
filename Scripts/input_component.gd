class_name InputComponent
extends Node


var move_dir : Vector2

func update() -> void:
	move_dir = Input.get_vector("left", "right", "up", "down").normalized()
