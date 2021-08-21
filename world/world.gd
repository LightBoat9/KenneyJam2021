extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rotate_to = 0
var increment = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released('rotate_left'):
		rotate_to = (PI / 2) + rotation
		increment = PI / 20
	elif Input.is_action_just_released('rotate_right'):
		rotate_to = (PI / -2) + rotation
		increment = PI / -20


func _physics_process(delta):
	if(abs(rotation - rotate_to) > 0.1):
		rotation += increment 