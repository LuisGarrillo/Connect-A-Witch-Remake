extends Node
class_name Hurtbox

@export var health_component : Health

func damage(value : Attack):
	if health_component:
		health_component.damage(value)
