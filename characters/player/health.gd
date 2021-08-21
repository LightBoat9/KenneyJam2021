tool
extends HBoxContainer


var health: int = 0 setget set_health

func set_health(h: int) -> void:
	health = h
	
	for c in range(get_child_count()):
		get_child(c).visible = c < health
