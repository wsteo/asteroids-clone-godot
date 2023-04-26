extends RigidBody2D
@export var asteroid_medium_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func destroy():
	var mediumAsteroid = asteroid_medium_scene.instantiate()
	spawnMediumAsteroid()
	spawnMediumAsteroid()
	queue_free()
	

func spawnMediumAsteroid():
	var mediumAsteroid = asteroid_medium_scene.instantiate()
	get_parent().add_child(mediumAsteroid)
	
	mediumAsteroid.position = position
	
	var direction = mediumAsteroid.rotation + PI/2
	direction += randf_range(-PI/4, PI/4)
	mediumAsteroid.rotation = direction
	
	var velocity = Vector2(randf_range(150.0,250.0),0.0)
	mediumAsteroid.linear_velocity = velocity.rotated(direction)
