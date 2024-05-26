extends CharacterBody2D
class_name Player

@export var jump_cap : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@onready var jump_velocity : float = ((2.0 * jump_cap) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_cap) / (jump_time_to_peak ** 2)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_cap) / (jump_time_to_descent ** 2 )) * -1.0

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
var direction
var jumping = false

func _physics_process(delta):
	input()
	
	velocity.y += get_gravity() * delta
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if is_on_floor():
		jumping = false
		if direction:
			animated_sprite_2d.play("run")
			animated_sprite_2d.flip_h = bool(direction - 1)
		else:
			animated_sprite_2d.play("idle")
	else:
		if velocity.y < 0:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")

	move_and_slide()

func no_health():
	queue_free()

func get_gravity():
	return jump_gravity if velocity.y < 0 else fall_gravity


func jump():
	if not jumping:
		velocity.y = jump_velocity
		jumping = true

func input():
	direction = Input.get_axis("move_left", "move_right")
	
	if Input.is_action_just_pressed("jump"):
		jump()
		
	if Input.is_action_just_pressed("shoot"):
		print("shooted")
		
