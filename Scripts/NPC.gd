extends StaticBody2D

@export var npc_name: String
@export var npc_content: String

@export var npc: DialogueData.Character
@export var dialogue_size = Vector2(200, 85)
@export var dialogue_offset = Vector2(0, -100)

@export var scripted_dialogue: DialogueData.ScriptedDialogue

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")

func _interact():
	player.lock_movement()
	player.lock_interaction()
	for npc in DialogueData.SCRIPTED_DIALOGUE[scripted_dialogue]:
		dialogue.show_dialogue(DialogueData.CHARACTER_NAME[npc.character], npc.content)
		await dialogue.done
	player.unlock_movement()
	player.unlock_interaction()
	dialogue.hide_dialogue()
