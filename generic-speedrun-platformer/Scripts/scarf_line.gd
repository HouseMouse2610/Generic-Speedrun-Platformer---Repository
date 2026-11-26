extends Line2D

@export var max_points : int = 8

@onready var anchor : Marker2D = $"../Scarf1Marker"
@onready var p : CharacterBody2D = $".."

func _ready() -> void:
	top_level = true
	global_position = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	add_point(anchor.global_position.round(), 0)
	
	if get_point_count() > max_points:
		remove_point(get_point_count() - 1)
	
	if p.current_state == p.state.DEAD:
		reset_trail()

func reset_trail() -> void:
	clear_points()
