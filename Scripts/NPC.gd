@tool
extends StaticBody2D

const FLOATING_DIALOGUE_REFERENCE = preload("res://FloatingDialogue.tscn")

@export var npc_name: String
@export var npc_content: String

@export var npc: DialogueData.Character
@export var dialogue_size = Vector2(200, 85)
@export var dialogue_offset = Vector2(0, -175)

@export var scripted_dialogue: DialogueData.ScriptedDialogue

@export var flip_h = false:
	set(new_flip_h):
		flip_h = new_flip_h
		if sprite_node:
			sprite_node.flip_h = new_flip_h

@export var texture: Texture2D:
	set(new_texture):
		texture = new_texture
		if sprite_node:
			sprite_node.texture = new_texture

@export var sprite_position: Vector2:
	set(new_sprite_position):
		sprite_position = new_sprite_position
		if sprite_node:
			sprite_node.position = new_sprite_position

@onready var sprite_node = $Sprite
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")

var is_chattering = false

func _ready():
	sprite_node.position = sprite_position
	sprite_node.texture = texture
	sprite_node.flip_h = flip_h

func _interact():
	player.lock_movement()
	player.lock_interaction()
	for npc in DialogueData.SCRIPTED_DIALOGUE[scripted_dialogue]:
		dialogue.show_dialogue(DialogueData.CHARACTER_NAME[npc.character], npc.content)
		await dialogue.done
	player.unlock_movement()
	player.unlock_interaction()
	dialogue.hide_dialogue()

#func _process():
#	if not is_chattering and randi() % 100 < 10:
#		var dialogue_node = FLOATING_DIALOGUE_REFERENCE.instantiate()
#		dialogue_node.position = position
#		canvas_layer.add_child(dialogue_node)
