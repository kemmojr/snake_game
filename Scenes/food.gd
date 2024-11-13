extends Area2D

@onready var player = get_node("/root/main/Player")
func _on_body_entered(body: Node2D) -> void:
    if body == player and player.has_method("eat"):
        var direct_to_player = global_position.direction_to(player.global_position)
        player.eat(direct_to_player)
        queue_free()
