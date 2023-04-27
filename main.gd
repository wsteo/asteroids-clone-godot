extends Node
@export var asteroidScene: PackedScene

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

var MAX_HEIGHT = 750
var MAX_WIDTH = 1300
func _on_play_area_2d_body_exited(body):
	if (body.is_in_group("player")):
		var position = body.position
		if (body.position.x > 1280):
			body.position = position + Vector2(-MAX_WIDTH, 0)
		elif (body.position.x < 0):
			body.position = position + Vector2(MAX_WIDTH, 0)
		elif (body.position.y > 720):
			body.position = position + Vector2(0, -MAX_HEIGHT)
		elif (body.position.y < 0):
			body.position = position + Vector2(0, MAX_HEIGHT)
