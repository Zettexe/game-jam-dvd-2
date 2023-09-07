extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var bucket_with_mop = $BucketWithMop

func _interact():
	player.has_mopping_powerup = !player.has_mopping_powerup
	bucket_with_mop.visible = !player.has_mopping_powerup
