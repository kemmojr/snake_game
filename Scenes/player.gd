extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(_delta: float) -> void:
	
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
		
	if Input.is_action_just_pressed('right') or (velocity.x == 0 and velocity.y == 0):
		velocity.y = 0
		velocity.x = SPEED
	
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if (velocity.x > 0):
		global_position = Vector2(0, velocity.y)
	else:
		global_position = Vector2(velocity.x, 0)
