extends Area2D

@export var damage := 1


func _on_area_entered(area: Hurtbox):
	if area is Hurtbox:
		print("hitted")
		var hurtbox: Hurtbox = area
		
		var attack = Attack.new()
		attack.damage = damage
		area.damage(attack)
