extends Area2D

@onready var s = $AnimatedSprite2D
@onready var saved : bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameState.checkpoint_position = global_position
		GameState.has_checkpoint = true
		if not saved:
			s.play("LashOut")
			await s.animation_finished
			s.play("Idle")
			saved = true
