extends Node

const FLOATING_DIALOGUE_REFERENCE = preload("res://FloatingDialogue.tscn")

@export var scripted_dialogue: DialogueData.ScriptedDialogue
@export var start_at_seconds = 60

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
	if scripted_dialogue == DialogueData.ScriptedDialogue.NONE:
		return
	
	await get_tree().create_timer(start_at_seconds).timeout
	
	for npc in DialogueData.SCRIPTED_DIALOGUE[scripted_dialogue]:
		var npc_node = get_character(npc.character)
		if npc_node.is_chattering:
			npc_node.scripted_waiting = true
	
	for npc in DialogueData.SCRIPTED_DIALOGUE[scripted_dialogue]:
		var npc_node = get_character(npc.character)
		if not npc_node.has_light:
			await npc_node.light_returned
		if npc_node.is_chattering:
			await npc_node.dialogue_ready
		var current_dialogue_node = FLOATING_DIALOGUE_REFERENCE.instantiate()
		canvas_layer.add_child(current_dialogue_node)
		current_dialogue_node.show_dialogue(npc.content, npc_node.dialogue_size, npc_node.get_screen_transform().origin + npc_node.dialogue_offset)
		await current_dialogue_node.done
		await get_tree().create_timer(1.5).timeout
		current_dialogue_node.hide_dialogue()
		await current_dialogue_node.deleted
	
	await get_tree().create_timer(randf_range(0, 2)).timeout
	
	for npc in DialogueData.SCRIPTED_DIALOGUE[scripted_dialogue]:
		get_character(npc.character).scripted_waiting = false
