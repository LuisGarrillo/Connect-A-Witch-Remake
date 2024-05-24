extends RigidBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var attacking = false
var walking : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not attacking or walking:
		animated_sprite_2d.play("idle")
		
	if attacking: 
		animated_sprite_2d.play("attack")
		if animated_sprite_2d.flip_h:
			position.x += 10 * delta
		else:
			position.x -= 10 * delta


func attack(player_horizontal_position):
	attacking = true
	if player_horizontal_position > position.x:
		animated_sprite_2d.flip_h = true
	else:
		if animated_sprite_2d.flip_h:
			animated_sprite_2d.flip_h = false


func _on_vision_area_player_entered(player_horizontal_position):
	attack(player_horizontal_position)


func _on_vision_area_player_left():
	attacking = false
