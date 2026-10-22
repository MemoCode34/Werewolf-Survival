class_name MovementComponent
extends Node

@export var max_speed : Vector2
@export var acceleration : float
@export var friction : float

var dir : Vector2


func move(body : CharacterBody2D, delta : float) -> void:
	if dir != Vector2.ZERO:
		body.velocity = body.velocity.move_toward(max_speed * dir, acceleration * delta)
	else:
		body.velocity = body.velocity.move_toward(Vector2.ZERO, friction * delta)
	body.move_and_slide()
