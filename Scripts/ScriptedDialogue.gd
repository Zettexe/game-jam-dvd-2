extends Node

const FLOATING_DIALOGUE_REFERENCE = preload("res://FloatingDialogue.tscn")

@export var scripted_dialogue: DialogueData.ScriptedDialogue

@onready var characters = get_tree().get_nodes_in_group("Characters")
@onready var canvas_layer = get_tree().get_first_node_in_group("CanvasLayer")

func get_character(find_character: DialogueData.Character):
	for character in characters:
		if not "npc" in character:
			printerr("NPC %s does not contain field npc" % character.name)
			continue
		if character.npc == find_character:
			return character
	push_error("Character %s was not found in the Scene Tree." % find_character)
	assert(false)

func _ready():
	await get_tree().create_timer(5).timeout
	for npc in DialogueData.SCRIPTED_DIALOGUE[scripted_dialogue]:
		var npc_node = get_character(npc.character)
		var current_dialogue_node = FLOATING_DIALOGUE_REFERENCE.instantiate()
		canvas_layer.add_child(current_dialogue_node)
		current_dialogue_node.show_dialogue(npc.content, npc_node.dialogue_size, npc_node.get_screen_transform().origin + npc_node.dialogue_offset)
		await current_dialogue_node.done
		await get_tree().create_timer(1.5).timeout
		current_dialogue_node.hide_dialogue()
		await current_dialogue_node.deleted
