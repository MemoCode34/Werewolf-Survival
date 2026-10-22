class_name HealthComponent
extends Node


@export var max_health : float 
@export var over_heal_rate : float


var over_health : float
var is_dead : bool
var curr_hp : float
signal health_changed(curr_health, max_health)
signal died(dead)

func _ready() -> void:
	is_dead = false
	curr_hp = max_health
	over_health = max_health * (6.0 / 5.0)

func _process(_delta: float) -> void:
	if is_dead:
		curr_hp = 0

func on_hit(dmg_amount : float) -> void:
	curr_hp -= dmg_amount
	if curr_hp <= 0:
		is_dead = true
		died.emit()
		return
	health_changed.emit(curr_hp, max_health)
	print(curr_hp)

func heal(heal_amount : float) -> void:
	if curr_hp < max_health:
		curr_hp += heal_amount
		if curr_hp > max_health:
			curr_hp -= (curr_hp - max_health) * over_heal_rate
			if curr_hp > over_health:
				curr_hp = over_health
		health_changed.emit(curr_hp, max_health)
	if curr_hp < over_health and curr_hp >= max_health:
		curr_hp += heal_amount * over_heal_rate
		if curr_hp > over_health:
			curr_hp = over_health
		health_changed.emit(curr_hp, max_health)
	print(curr_hp)
