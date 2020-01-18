extends "res://pickups/pickup.gd"

func body_entered(body):
	if body.name == "Player":
		body.health += 1
		queue_free()