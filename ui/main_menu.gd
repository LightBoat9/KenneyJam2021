extends Control

onready var level_buttons = $PanelContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/GridContainer


func _ready() -> void:
	for i in range(level_buttons.get_child_count()):
		level_buttons.get_child(i).connect('pressed', self, '_on_level_button_pressed', [i])


func _on_level_button_pressed(index: int) -> void:
	get_tree().change_scene(Options.LEVELS[index])


func _on_Button2_pressed() -> void:
	get_tree().quit()


func _on_Button_pressed() -> void:
	get_tree().change_scene(Options.LEVELS[0])
