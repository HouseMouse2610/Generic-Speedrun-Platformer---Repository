class_name Level
extends Node2D

@onready var colectables : TileMapLayer = $Tilemap/Scenes

var berry : int = 0

func _ready() -> void:
	call_deferred("connect_signals")

func connect_signals():
	for child in colectables.get_children():
		if child is Berry:
			child.is_collected.connect(berry_colected)

func berry_colected() -> void:
	berry += 1
