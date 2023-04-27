extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5
@export var bullet_scene: PackedScene

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	var collision_info = move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider().is_in_group("asteroid")):
			print("hit asteroid")
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		bullet.position = $BulletSpawnpoint.global_position
		bullet.rotation = transform.get_rotation()

