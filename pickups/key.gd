extends Area2D

func _ready():
	connect("body_entered",self,"body_entered")

func body_entered(body):
	print("test")
	if body.name == "Player" && body.get("keys") < 9:
		body.keys += 1
		queue_free()





