extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const segmentX = 15
const segmentY = 14

signal rotatedTo(new_rotation: float)

@onready var current = $"."


func _physics_process(delta: float) -> void:

    var old_rotation = rotation
    # Handle jump.
    if Input.is_action_just_pressed("jump") && !(velocity.x == 0 && velocity.y == SPEED):
        velocity.x = 0
        velocity.y = 0 - SPEED
        if (rotation - Vector2.UP.angle()) != 0:
            rotation = Vector2.UP.angle()

        
    if Input.is_action_just_pressed("down") && !(velocity.x == 0 && velocity.y == 0 - SPEED):
        velocity.x = 0
        velocity.y = SPEED
        if rotation - Vector2.DOWN.angle() != 0:
            rotation = Vector2.DOWN.angle()

    if Input.is_action_just_pressed("left") && !(velocity.y == 0 && velocity.x == SPEED):
        velocity.y = 0
        velocity.x = 0 - SPEED
        if rotation - Vector2.LEFT.angle() != 0:
            rotation = Vector2.LEFT.angle()
        
    if Input.is_action_just_pressed('right') && !(velocity.y == 0 && velocity.x == 0 - SPEED) || (velocity.x == 0 and velocity.y == 0) :
        velocity.y = 0
        velocity.x = SPEED
        if rotation - Vector2.RIGHT.angle() != 0:
            rotation = Vector2.RIGHT.angle()

    if (old_rotation != rotation):
        var current = rotation
        print("v",velocity)
        print("old",old_rotation)
        print("current", current)
        print("calc",(old_rotation - rotation), "\n")
       
        if old_rotation - rotation < -(PI + (PI/2) - PI/8):
            rotatedTo.emit(PI/2)
        else:
            rotatedTo.emit(old_rotation - rotation)
    move_and_collide(velocity * delta)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    var screenSize = get_viewport().get_visible_rect().size

    # right
    if (velocity.x > 0):
        global_position = Vector2(0, global_position.y)
    # left
    elif velocity.x < 0:
        global_position = Vector2(screenSize.x, global_position.y)
    # down
    elif velocity.y > 0:
        global_position = Vector2(global_position.x, 0)
    # up
    elif velocity.y < 0:
        global_position = Vector2(global_position.x, screenSize.y)

func eat(direction: Vector2):
    return
    var collider: CollisionShape2D = current.get_node("Collider").duplicate()
    var sprite: AnimatedSprite2D = current.get_node("Sprite").duplicate()
    collider.name += "_segment"
    sprite.position = global_position + direction
    collider.position = global_position + direction


    current.add_child(sprite)
    current.add_child(collider)	




func _on_rotated_to(new_rotation:float) -> void:
    pass # Replace with function body.
