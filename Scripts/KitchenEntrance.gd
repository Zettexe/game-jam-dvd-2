extends Node2D

@onready var kitchen_view = get_tree().get_first_node_in_group("KitchenView")
@onready var player = get_tree().get_first_node_in_group("Player")

func _interact():
	if kitchen_view.visible:
		kitchen_view._on_exit_button_pressed()
		return
	if not player.has_mopping_powerup:
		player.has_crate_powerup = false
		player.lock_movement()
		kitchen_view.visible = true
		await kitchen_view.exit
		player.unlock_movement()
