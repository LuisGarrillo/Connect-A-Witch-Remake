extends Node
class_name Health
signal no_health

@export var maximum := 3
@export var minimum := 0

@export var current := 3
	
func damage(attack : Attack):
	current = max(0, current - attack.damage)
	if current <= 0:
		get_parent()
