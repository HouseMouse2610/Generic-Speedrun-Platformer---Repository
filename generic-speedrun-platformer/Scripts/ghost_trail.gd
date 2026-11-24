extends Sprite2D

var ghost_speed := 3.0

func _ready():
	var shader_material = ShaderMaterial.new()
	shader_material.shader = load("res://Resourses/ghost_trail_shader.gdshader")
	shader_material.set_shader_parameter("color", Color(1.0, 0.0, 0.0, 0.75))
	material = shader_material

func _process(delta):
	modulate.a -= ghost_speed * delta
	if modulate.a <= 0:
		queue_free()
