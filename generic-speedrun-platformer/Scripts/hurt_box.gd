extends Area2D

@onready var p = $".."

func _on_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	p.current_state = p.state.DEAD
