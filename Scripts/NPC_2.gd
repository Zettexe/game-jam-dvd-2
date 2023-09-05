extends StaticBody2D

const FLOATING_DIALOGUE_REFERENCE = preload("res://FloatingDialogue.tscn")



@onready var canvas_layer = get_tree().get_first_node_in_group("CanvasLayer")

var floating_dialogue_node = null

func _interact():
	if not floating_dialogue_node:
		floating_dialogue_node = FLOATING_DIALOGUE_REFERENCE.instantiate()
		floating_dialogue_node.position = position
		canvas_layer.add_child(floating_dialogue_node)
		randomize()
		var dialogue_content = DialogueData.CHATTER[randi() % DialogueData.CHATTER.size()]
		floating_dialogue_node.show_dialogue(dialogue_content, dialogue_size, get_screen_transform().origin + dialogue_offset)
		await floating_dialogue_node.deleted
		floating_dialogue_node = null

func _on_area_player_exited(body):
	if floating_dialogue_node:
		floating_dialogue_node.hide_dialogue()
