extends Area2D

@onready var player = get_node("/root/main/Player")
@onready var food_collider = $CollisionShape2D
func _on_body_entered(body: Node2D) -> void:
    var screenSize = get_viewport().get_visible_rect().size
    var food_radius = food_collider.shape.radius
    if body == player and player.has_method("eat"):
        var direct_to_player = global_position.direction_to(player.global_position)
        player.eat(direct_to_player)
        var x = randi_range(0, screenSize.x - food_radius)
        var y = randi_range(0, screenSize.y - food_radius)
        
        global_position = Vector2(x, y)
