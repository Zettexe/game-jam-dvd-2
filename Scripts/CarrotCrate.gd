extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var sprite = $Sprite

func _interact():
	player.has_crate_powerup = true

func _on_area_player_entered(body):
	sprite.modulate = Color.RED

func _on_area_body_exited(body):
	sprite.modulate = Color.WHITE
