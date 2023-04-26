extends RigidBody2D
@export var asteroid_small_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func destroy():
	spawnSmallAsteroid()
	spawnSmallAsteroid()
	queue_free()
	
func spawnSmallAsteroid():
	var smallAsteroid = asteroid_small_scene.instantiate()
	get_parent().add_child(smallAsteroid)
	smallAsteroid.position = position
	
	var direction = smallAsteroid.rotation + PI/2
	direction += randf_range(-PI/4, PI/4)
	smallAsteroid.rotation = direction
	
	var velocity = Vector2(randf_range(150.0,250.0),0.0)
	smallAsteroid.linear_velocity = velocity.rotated(direction)
