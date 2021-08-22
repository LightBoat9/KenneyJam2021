extends Node

const LEVELS: Array = [
	"res://scenes/levels/Level0.tscn",
	"res://scenes/levels/Level1.tscn",
	"res://scenes/levels/Level2.tscn",
	"res://scenes/levels/Level3.tscn",
	"res://scenes/levels/Level4.tscn",
	"res://scenes/levels/Level0.tscn",
	"res://scenes/levels/Level0.tscn",
]


const Resolutions = [
	Vector2(1280, 720),
	Vector2(1280, 1024),
	Vector2(1366, 768),
	Vector2(1440, 900),
	Vector2(1600, 900),
	Vector2(1680, 1050),
	Vector2(1920, 1080),
	Vector2(1920, 1200),
	Vector2(2560, 1440),
	Vector2(2560, 1080),
	Vector2(3440, 1440),
	Vector2(3840, 2160),
]


const BASE_REVOLUTION: Vector2 = Vector2(640, 360)


var current_resolution: int = 0 setget set_current_resolution


func _ready() -> void:
	set_current_resolution(current_resolution)


func set_current_resolution(i: int) -> void:
	current_resolution = i
	OS.window_size = Resolutions[current_resolution]
	get_tree().set_screen_stretch(
		SceneTree.STRETCH_MODE_2D, 
		SceneTree.STRETCH_ASPECT_KEEP, 
		_get_stretch(OS.window_size)
		)
		
	OS.center_window()
	
	
func _get_stretch(val: Vector2) -> Vector2:
	var scale = (val / BASE_REVOLUTION).floor()
	var max_xy = max(scale.x, scale.y)
	scale = Vector2(max_xy, max_xy)
	return (val / scale).floor()
