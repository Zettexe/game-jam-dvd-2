extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var mop = $Mop

func _interact():
	player.has_mopping_powerup = !player.has_mopping_powerup
	mop.visible = !player.has_mopping_powerup
