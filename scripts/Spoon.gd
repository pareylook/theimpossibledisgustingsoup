extends KinematicBody2D

export var speed = 20
var velocity = Vector2.ZERO


func _physics_process(delta):
	velocity.x = 0
	if (Input.is_action_pressed("move_left")):
		velocity.x -= speed
	if (Input.is_action_pressed("move_right")):
		pass
		velocity.x += speed
		
	move_and_collide(velocity)
