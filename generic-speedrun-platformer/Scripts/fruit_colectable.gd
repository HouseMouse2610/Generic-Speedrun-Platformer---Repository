class_name Berry
extends Area2D

@onready var s = $AnimatedSprite2D

signal is_collected

var collected : bool = false

func _on_body_entered(_body: Node2D) -> void:
	if collected : return
	collected = true
	
	is_collected.emit()
	s.play("Colected")
	await s.animation_finished
	queue_free()
