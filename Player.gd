extends KinematicBody2D

var d = false

class_name Player

var vel = Vector2.ZERO

const ACCELERATION = 10
const MAX_SPEED = 100
const FRICTION = 10

func _physics_process(delta):
	if d == false:
		var input_vac = Vector2.ZERO
		input_vac.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vac.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vac = input_vac.normalized()
		print(input_vac)
	
		if input_vac != Vector2.ZERO:
			vel += input_vac * ACCELERATION * delta
			vel = vel.clamped(MAX_SPEED * delta)
			print(vel)
		else:
			vel = vel.move_toward(Vector2.ZERO, FRICTION * delta)
	
		move_and_collide(vel)
	
	if Input.is_action_pressed("ui_accept"):
		if d == false:
			d = 1 as bool
		else:
			d = 0 as bool
			
