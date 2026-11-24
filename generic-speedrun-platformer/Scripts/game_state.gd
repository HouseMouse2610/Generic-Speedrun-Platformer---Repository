extends Node

var checkpoint_position : Vector2 = Vector2.ZERO
var has_checkpoint : bool = false
var time : float = 0.0
var started : bool = false


func start():
	if not started:
		started = true
