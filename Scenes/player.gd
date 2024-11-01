extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var player = $"."
@onready var camera = get_node("../Camera2D")

func _physics_process(_delta: float) -> void:
	
	var viewPortSize = camera.get_viewport().get_size()
	var boundary = viewPortSize.x / 2
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.x = 0
		velocity.y = 0 - SPEED
		
	if Input.is_action_just_pressed("down"):
		velocity.x = 0
		velocity.y = SPEED

	if Input.is_action_just_pressed("left"):
		velocity.y = 0
		velocity.x = 0 - SPEED
		
	if Input.is_action_just_pressed('right'):
		velocity.y = 0
		velocity.x = SPEED
	
	move_and_slide()
