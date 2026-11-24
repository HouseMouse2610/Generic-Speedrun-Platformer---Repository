class_name Level
extends Node2D

@onready var colectables : TileMapLayer = $Tilemap/Scenes
@onready var start_marker : Marker2D = $PlayerStart

var berry : int = 0

const PLAYER_SCENE = preload("res://Scenes/character_body_2d.tscn")

func _ready() -> void:
	var new_player = PLAYER_SCENE.instantiate()
	add_child(new_player)

	if GameState.has_checkpoint:
		new_player.global_position = GameState.checkpoint_position
	else:
		new_player.global_position = start_marker.global_position
	call_deferred("connect_signals")
	GameState.started = false

func connect_signals():
	for child in colectables.get_children():
		if child is Berry:
			child.is_collected.connect(berry_colected)

func berry_colected() -> void:
	berry += 1
