extends Panel

@onready var label : Label = $Label
@onready var timelabel : Label = $TimeLabel
@onready var level = $"../.."
var started : bool = false
var time : float = 0.0

func _physics_process(delta: float) -> void:
	atualize_label()
	if started:
		time += delta

func atualize_label():
	label.text = str("Strawberry: ") + str(level.berry)
	@warning_ignore("integer_division")
	var minutes = int(time) / 60
	var seconds = int(time) % 60
	timelabel.text = str(minutes) + str(":") + str(seconds)
	
	if not started:
		if Input.is_action_just_pressed("Right"):
			started = true
