extends KinematicBody2D

const TYPE = "ENEMY"
const SPEED = 40

var movedir = Vector2(0,0)
var knockdir = Vector2(0,0)
var spritedir = "down"

var hitstun = 0
var health = 1

func movement_loop():
	var motion
	if hitstun > 0:
		motion = knockdir.normalized() * SPEED * 2 
	else:
		motion = movedir.normalized() * SPEED
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
		hitstun -= 1
	for body in $hitbox.get_overlapping_bodies():
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			health -= body.get("DAMAGE")
			hitstun = 10
			knockdir = transform.origin - body.transform.origin