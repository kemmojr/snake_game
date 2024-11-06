extends PinJoint2D

var rotation_delay = 0.0

func _on_player_rotated_to(new_rotation_val:float) -> void:
    print("rotation", rotation, "new_rotation", new_rotation_val)
    rotation = new_rotation_val
    rotation_delay = 1.0

func _physics_process(delta: float) -> void:
    if rotation_delay <= 0:
        rotation = 0
        return 
    
    rotation_delay -= delta
    print("rotation_delay", rotation_delay)