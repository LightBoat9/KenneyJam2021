extends Area2D

func _on_Spike_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()
