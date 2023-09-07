extends Node2D

@onready var kitchen_view = get_tree().get_first_node_in_group("KitchenView")
@onready var player = get_tree().get_first_node_in_group("Player")

func _interact():
	player.disable_interaction()
	player.lock_movement()
	kitchen_view.visible = true
	await kitchen_view.exit
	player.enable_interaction()
	player.unlock_movement()
