extends PinJoint2D

var rotation_delay = 0.0

func _on_player_rotated_to(new_rotation_val:float) -> void:
    var tween = get_tree().create_tween()
    rotation = new_rotation_val
    tween.tween_property($".", "rotation", 0, 0.3)
