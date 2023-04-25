extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	pass

func _on_area_2d_area_entered(area):
	print("Hit")
	if (area.is_in_group("bullet")):
		print("Hit")
