extends Node
@export var asteroidScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_asteroid_spawn_timer_timeout():
	var asteroid = asteroidScene.instantiate()
	
	var asteroidSpawnLocation = get_node("ObjectSpawnPath/ObjectSpawnLocation")
	asteroidSpawnLocation.progress_ratio = randf()
	
	var direction = asteroidSpawnLocation.rotation + PI/2
	asteroid.position = asteroidSpawnLocation.position
	
	direction += randf_range(-PI/4, PI/4)
	asteroid.rotation = direction
	
	var velocity = Vector2(randf_range(150.0,250.0),0.0)
	
	asteroid.linear_velocity = velocity.rotated(direction)
	
	add_child(asteroid)
	

func _on_top_border_area_2d_body_entered(body):
	if (body.is_in_group("player")):
		print(body.name)
		print(body.position.x)
		var position = body.position
		body.position = position + Vector2(0,720)

func _on_bottom_border_area_2d_body_entered(body):
	if (body.is_in_group("player")):
		print(body.name)
		print(body.position.x)
		var position = body.position
		body.position = position + Vector2(0,-720)

func _on_left_border_area_2d_body_entered(body):
	if (body.is_in_group("player")):
		var position = body.position
		body.position = position + Vector2(1280,0)

func _on_right_border_area_2d_body_entered(body):
	if (body.is_in_group("player")):
		var position = body.position
		body.position = position + Vector2(-1280,0)
