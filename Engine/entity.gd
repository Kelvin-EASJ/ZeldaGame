extends KinematicBody2D

const SPEED = 40

var movedir = Vector2(0,0)
var spritedir = "Down"

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))

func spritedir_loop():
	match movedir:
		dir.left:
			spritedir = "left"
		dir.right:
			spritedir = "right"
		dir.up:
			spritedir = "up"
		dir.down:
			spritedir = "down"

func anim_switch(animation):
	var newanim = str(animation, spritedir)
	if $Anim.current_animation != newanim:
		$Anim.play(newanim)