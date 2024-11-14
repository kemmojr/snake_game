extends PinJoint2D


var tween_len = 0.3
signal rotatedTo(new_rotation: float)
signal finished()

func _on_pin_joint_2d_rotated_to(new_rotation_val: float) -> void:
    rotation = new_rotation_val
    rotatedTo.emit(new_rotation_val)
    


func _on_pin_joint_2d_finished() -> void:
    var tween = get_tree().create_tween()
    tween.tween_property($".", "rotation", 0, tween_len)
    tween.tween_callback(emit_finished)
    
func emit_finished():
    finished.emit()
