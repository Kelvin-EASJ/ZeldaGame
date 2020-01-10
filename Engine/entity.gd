extends KinematicBody2D

const TYPE = "ENEMY"
const SPEED = 40

var movedir = Vector2(0,0)
var knockdir = Vector2(0,0)
var spritedir = "Down"

var hitstun = 0
var health = 1

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

func damage_loop():
	if hitstun > 0:
		histun -= 1
	for body in $hitbox.get_overlapping_bodies():
		if histun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE: