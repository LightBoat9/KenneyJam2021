extends KinematicBody2D

const GRAVITY = 9.0

var move_speed: float = 104.0
var jump_speed: float = 252.0

var velocity: Vector2 = Vector2()

onready var sprite: Sprite = $Sprite
onready var camera: Camera2D = $Camera2D
onready var animation: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	var hinput = int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left'))
	
	if hinput:
		sprite.flip_h = hinput == -1
	
	velocity.x = hinput * move_speed
	
	velocity += Vector2(0, GRAVITY)
	
	if Input.is_action_just_pressed('ui_select') and is_on_floor():
		velocity.y = -jump_speed
		
	if velocity.y < -jump_speed / 2.0 and not Input.is_action_pressed('ui_select'):
		velocity.y = -jump_speed / 2.0
		
	if not is_on_floor():
		animation.stop()
		sprite.frame = 1
	elif velocity.x != 0 and is_on_floor():
		animation.play("walk")
	else:
		animation.stop()
		sprite.frame = 0
	
	move_and_slide(velocity, Vector2.UP)
	
	camera.align()
	
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		
		if collision.normal == Vector2.UP or collision.normal == Vector2.DOWN:
			velocity.y = 0
