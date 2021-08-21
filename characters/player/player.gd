extends KinematicBody2D

const GRAVITY = 9.0

var move_speed: float = 104.0
var jump_speed: float = 252.0

var velocity: Vector2 = Vector2()
var snap: Vector2 = Vector2(0, 14)

onready var sprite: Sprite = $Sprite
onready var camera: Camera2D = $Camera2D
onready var animation: AnimationPlayer = $AnimationPlayer
onready var audio_jump: AudioStreamPlayer = $AudioJump

func _process(delta: float) -> void:
	camera.align()

func _physics_process(delta: float) -> void:
	var hinput = int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left'))
	
	if hinput:
		sprite.flip_h = hinput == -1
	
	velocity.x = hinput * move_speed
	
	if not is_on_floor():
		velocity += Vector2(0, GRAVITY)
	
	if Input.is_action_just_pressed('ui_select') and is_on_floor():
		velocity.y = -jump_speed
		snap = Vector2()
		audio_jump.play()
		
	if velocity.y < -jump_speed / 2.0 and not Input.is_action_pressed('ui_select'):
		velocity.y = -jump_speed / 2.0
	
	var was_on_floor = is_on_floor()
	move_and_slide_with_snap(velocity, snap, Vector2.UP, true)
	snap = Vector2(0, 12)
	
	camera.align()
	
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		
		if not was_on_floor and collision.normal == Vector2.UP:
			sprite.frame = 0
			if velocity.x != 0:
				animation.play("walk")
				animation.seek(0.2)
				
		if is_on_floor() or is_on_ceiling():
			velocity.y = 0
		
	if not is_on_floor():
		animation.stop()
		sprite.frame = 1
	elif velocity.x != 0 and is_on_floor():
		animation.play("walk")
	else:
		animation.stop()
		sprite.frame = 0
