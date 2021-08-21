extends Area2D

onready var sprite: Sprite = $Sprite
onready var audio_click: AudioStreamPlayer = $AudioClick
export(String, MULTILINE) var next_scene: String = 'res://scenes/level_base/LevelBase.tscn:Map'


func _on_body_entered(body: Node) -> void:
	if sprite.frame == 0:
		sprite.frame = 1
		audio_click.play()
		yield(get_tree().create_timer(0.5), "timeout")
		goto_next_scene()
	
	
func goto_next_scene() -> void:
	if next_scene:
		get_tree().change_scene(next_scene)
