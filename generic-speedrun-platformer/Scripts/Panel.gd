class_name UI
extends Panel

@onready var label : Label = $Label
@onready var timelabel : Label = $TimeLabel
@onready var level = $"../.."

func _process(delta: float) -> void:
	atualize_label()
	if GameState.started:
		GameState.time += delta * 1000

func atualize_label():
	label.text = str("x") + str(level.berry)
	timer()

func timer():
	var miliseconds = int(GameState.time) % 1000
	@warning_ignore("integer_division")
	var seconds = int(GameState.time) / 1000 % 60
	@warning_ignore("integer_division")
	var minutes = int(GameState.time) / 60000
	timelabel.text = str("%02d" % minutes) + str(":") + str("%02d" % seconds) + str(".") + str("%03d" % miliseconds)
	
