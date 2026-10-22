class_name Player
extends CharacterBody2D

@export var move_comp : MovementComponent
@export var inp_comp : InputComponent
@export var hp : HealthComponent


func _ready() -> void:
	hp.died.connect(_on_death)

func _physics_process(delta: float) -> void:
	inp_comp.update()
	move_comp.dir = inp_comp.move_dir
	move_comp.move(self, delta)
	
	if Input.is_action_just_pressed("heal"):
		hp.heal(50)
	if Input.is_action_just_pressed("hurt"):
		hp.on_hit(10)

func _on_death() -> void:
	print("Öldün çöp XD")
