extends KinematicBody2D

const GRAVITY = 50.0

var direction: int = 1 setget set_direction
var move_speed: float = 50.0
var velocity: Vector2

onready var sprite: Sprite = $Sprite
onready var cliff_raycast: RayCast2D = $CliffRayCast

func set_direction(dir: int):
	direction = dir
	cliff_raycast.position = Vector2(12, 0) * direction

func _physics_process(delta: float) -> void:
	sprite.flip_h = direction == -1

	velocity = Vector2(move_speed * direction, 0).rotated(global_rotation)
	velocity += (Vector2.DOWN * GRAVITY).rotated(global_rotation)

	move_and_slide(velocity, Vector2.UP)

	for i in (get_slide_count()):
		var collision = get_slide_collision(i)
	
		if collision.normal.rotated(-global_rotation).distance_to(Vector2.LEFT) < 0.01 or \
			collision.normal.rotated(-global_rotation).distance_to(Vector2.RIGHT) < 0.01:
			self.direction *= -1
			break
			
	if not cliff_raycast.is_colliding():
		self.direction *= -1
