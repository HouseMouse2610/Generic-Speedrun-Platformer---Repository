extends Area2D

@onready var s = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	body.velocity.y += -600
	s.play("Jump")
