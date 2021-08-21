tool
extends TextureRect

enum State {
	NONE, HALF, FULL
}

export var state: int = State.FULL setget set_state


func set_state(s: int) -> void:
	state = s
	texture.region = Rect2(36 - (18 * s), 0, 18, 18)
