extends Panel
# arrumar um jeito de fazer um contador de mortes
@onready var d_label : Label = $DeathCounterLabel
@onready var level : Node2D = $"../.."
#GameState.died.connect(died_one_time)

func _ready() -> void:
	GameState.died.connect(died_one_time)

func _process(_delta: float) -> void:
	atualize_label()

func died_one_time():
	GameState.deaths += 1

func atualize_label():
	d_label.text = str("x") + str(GameState.deaths)
