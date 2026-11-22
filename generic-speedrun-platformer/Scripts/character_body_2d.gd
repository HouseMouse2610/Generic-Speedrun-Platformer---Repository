class_name Player
extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

var direction : float = 0
var jump_count : int

@export var speed : float = 250
@export var aceleration : float = 500.0
@export var friction : float = 1000
@export var jump_velocity : float = -300.0
@export var wall_gravity : float = 32.0
@export var wall_impulse : float = 128.0
@export var gravity : float = 500.0
@export var fall_mult : float = 2.0

enum state{IDLE, RUN, JUMP, FALL, WALL_SLIDE, DEAD}
@export var current_state = state.IDLE

func _physics_process(_delta: float) -> void:
	direction = Input.get_axis("Left", "Right")
	change_state()
	run_state(_delta)
	sprite.update_sprite()
	
	move_and_slide()

func run_state(delta) -> void:
	match current_state:
		state.IDLE:
			move_player_x(delta)
			move_player_y(delta)
		state.RUN:
			move_player_x(delta)
			move_player_y(delta)
		state.JUMP:
			move_player_x(delta)
			move_player_y(delta)
		state.FALL:
			move_player_x(delta)
			move_player_y(delta)
		state.WALL_SLIDE:
			move_player_x(delta)
			move_player_y(delta)
		state.DEAD:
			velocity.x = 0
			velocity.y = 0

func change_state():
	if current_state != state.DEAD:
		if not is_on_floor() and is_on_wall() and velocity.y > 0:
			current_state = state.WALL_SLIDE
		elif velocity.x == 0 and is_on_floor():
			current_state = state.IDLE
		elif velocity.x != 0 and is_on_floor():
			current_state = state.RUN
		elif velocity.y < 0 and not is_on_floor():
			current_state = state.JUMP
		elif velocity.y > 0 and not is_on_floor():
			current_state = state.FALL

func move_player_x(delta):
	if direction != 0:
		if velocity.x * direction < 0:
			velocity.x = move_toward(velocity.x, 
			speed * direction, 
			friction * delta)
		else:
			velocity.x = move_toward(velocity.x, 
			speed * direction, 
			aceleration * delta)
	elif direction == 0:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

func move_player_y(delta):
	if is_on_floor() or is_on_wall():
		jump_count = 2
	if not is_on_floor() and jump_count == 2:
		jump_count = 1
	
	if current_state == state.WALL_SLIDE:
		if Input.is_action_just_pressed("Jump"):
			velocity.x = wall_impulse * -direction
			velocity.y += jump_velocity
		elif velocity.y > 0:
			velocity.y = wall_gravity
	
	else:
		if Input.is_action_just_pressed("Jump") and jump_count > 0:
			velocity.y = 0
			velocity.y += jump_velocity
			jump_count -= 1
	
	if not Input.is_action_pressed("Jump") and not is_on_floor() and velocity.y < 0:
		velocity.y = velocity.y / fall_mult
	
	if not is_on_floor():
		if velocity.y > 0:
			velocity.y += gravity * fall_mult * delta
		else:
			velocity.y += gravity * delta
