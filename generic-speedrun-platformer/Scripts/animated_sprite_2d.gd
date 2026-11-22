extends AnimatedSprite2D

@onready var p = $".."

func update_sprite():
	if p.current_state == p.state.WALL_SLIDE:
		play("Wall Slide")
	if p.current_state == p.state.IDLE:
		play("Idle")
	elif p.current_state == p.state.RUN:
		play("Run")
	elif p.current_state == p.state.JUMP:
		if p.jump_count == 0:
			play("Double Jump")
		else:
			play("Jump")
	elif p.current_state == p.state.FALL:
		play("Fall")
	elif p.current_state == p.state.DEAD:
		play("Hit")
	if p.direction != 0:
		flip_h = (p.direction < 0) 


func _on_animation_finished() -> void:
	if p.current_state == p.state.DEAD:
		get_tree().reload_current_scene()
