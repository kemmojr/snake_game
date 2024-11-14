extends PinJoint2D

var tween_len = 0.3
signal rotatedTo(new_rotation: float)
signal finished()

func _on_player_rotated_to(new_rotation_val:float) -> void:
    var tween = get_tree().create_tween()
    rotation = new_rotation_val
    rotatedTo.emit(new_rotation_val)
    tween.tween_property($".", "rotation", 0, tween_len)
    tween.tween_callback(emit_finished)
    
func emit_finished():
    finished.emit()
