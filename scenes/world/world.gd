extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rotate_to = 0
var rotate_pos = 0
var rotation_time = 0.7


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_equal_approx(rotation, rotate_to):
		var tween = get_node("Tween")

		if Input.is_action_just_pressed('rotate_left'):
			rotate_pos -= 1
			rotate_to = (PI / 2) * rotate_pos
			tween.interpolate_property(self, "rotation", rotation, rotate_to, rotation_time)
			tween.start()
		elif Input.is_action_just_pressed('rotate_right'):
			rotate_pos += 1
			rotate_to = (PI / 2) * rotate_pos 
			tween.interpolate_property(self, "rotation", rotation, rotate_to, rotation_time)
			tween.start()


func _physics_process(delta):
	pass
