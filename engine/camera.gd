extends Camera2D

func _process(delta):
	var DAMAGE = null
	var pos = get_node("../Player").global_position - Vector2(0,16)
	var x = floor(pos.x / 160) * 160
	var y = floor(pos.y / 128) * 128
	global_position = Vector2(x,y)