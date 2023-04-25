extends Area2D

@export var max_range = 1200.0
@export var speed = 750.0
@export var travelled_distance = 0.0

func _physics_process(delta):
	var distance = speed * delta
	var motion = transform.x * speed * delta
	
	position += motion
	
	travelled_distance += distance
	if travelled_distance > max_range:
		queue_free()
		

func _on_body_entered(body):
	if (body.is_in_group("asteroid")):
		print("hit")
		queue_free()
