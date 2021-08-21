extends Area2D

onready var sprite: Sprite = $Sprite
export(String, MULTILINE) var next_scene: String = 'res://scenes/level_base/LevelBase.tscn'


func _on_body_entered(body: Node) -> void:
	sprite.frame = 1
	yield(get_tree().create_timer(0.5), "timeout")
	goto_next_scene()
	
	
func _on_body_exited(body: Node) -> void:
	sprite.frame = 0
	
	
func goto_next_scene() -> void:
	if next_scene:
		get_tree().change_scene(next_scene)
