extends Node2D

var ROT_MAX_W
var ROT_MAX_S
var INIT_ROT

const SPEED = 5*PI #duas voltas por segundo

func _ready():
	ROT_MAX_W = rotation - PI
	ROT_MAX_S = rotation + PI
	INIT_ROT = rotation
	pass

func _process(delta):
	
	var increment = SPEED*delta
	
	var incremented_rotation_w = rotation - increment
	var incremented_rotation_s = rotation + increment
	
	if Input.is_key_pressed(KEY_W) && incremented_rotation_w > ROT_MAX_W:
		rotate(-increment)
	elif Input.is_key_pressed(KEY_W) && incremented_rotation_w <= ROT_MAX_W:
		rotation = ROT_MAX_W
	elif !Input.is_key_pressed(KEY_W) && !Input.is_key_pressed(KEY_S) && rotation < INIT_ROT:
		if rotation + (increment) > INIT_ROT:
			rotation = INIT_ROT
		else:
			rotate(increment)
	elif Input.is_key_pressed(KEY_S) && incremented_rotation_s < ROT_MAX_S:
		rotate(increment)
	elif Input.is_key_pressed(KEY_S) && incremented_rotation_s >= ROT_MAX_S:
		rotation = ROT_MAX_S
	elif !Input.is_key_pressed(KEY_W) && !Input.is_key_pressed(KEY_S) && rotation > INIT_ROT:
		if rotation - (increment) < INIT_ROT:
			rotation = INIT_ROT
		else:
			rotate(-increment)

	pass