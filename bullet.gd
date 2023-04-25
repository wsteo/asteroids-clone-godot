extends RigidBody2D

@export var speed = 1000

var velocity = Vector2(0,0)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
