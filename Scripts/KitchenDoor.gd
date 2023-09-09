extends Node2D

@onready var kitchen = get_tree().get_first_node_in_group("Kitchen")
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var kitchen_player = get_tree().get_first_node_in_group("KitchenPlayer")
@onready var camera = get_tree().get_first_node_in_group("Camera")
@onready var kitchen_camera = get_tree().get_first_node_in_group("KitchenCamera")
@onready var cauldron = get_tree().get_first_node_in_group("CauldronSprite")

func _player_entered():
	_interact()

func _interact():
	if player.has_mopping_powerup:
		return
	kitchen_player.lock_movement()
	kitchen_player.disable_interaction()
	player.enable_interaction()
	player.unlock_movement()
	
	camera.enabled = true
	kitchen_camera.enabled = false
	DialogueData.is_in_kitchen = false
