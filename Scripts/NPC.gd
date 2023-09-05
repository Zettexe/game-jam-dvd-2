extends StaticBody2D

@export var npc_name: String
@export var npc_content: String
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")

func _interact():
	player.lock_movement()
	player.lock_interaction()
	dialogue.show_dialogue(npc_name, npc_content)
	await dialogue.done
	player.unlock_movement()
	player.unlock_interaction()
	dialogue.hide_dialogue()
