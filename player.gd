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
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		add_child(bullet)
		bullet.position = $BulletSpawnpoint.global_position
		bullet.rotation = transform.get_rotation()

