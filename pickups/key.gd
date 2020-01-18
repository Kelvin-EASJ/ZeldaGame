extends "res://pickups/pickup.gd"

func body_entered(body):
	print("test")
	if body.name == "Player" && body.get("keys") < 9:
		body.keys += 1
		queue_free()





