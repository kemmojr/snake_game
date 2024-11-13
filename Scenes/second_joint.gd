extends PinJoint2D


var tween_len = 0.3
signal rotatedTo(new_rotation: float)

func _on_pin_joint_2d_rotated_to(new_rotation_val: float) -> void:
    var tween = get_tree().create_tween()
    rotation = new_rotation_val
    tween.tween_property($".", "rotation", 0, tween_len)
    tween.tween_callback(emit.bind(new_rotation_val))
    
func emit(new_rotation_val: float):
    rotatedTo.emit(new_rotation_val)
