@tool
extends StaticBody2D

signal dialogue_ready
signal light_returned

@export var npc_name: String
@export var npc_content: String

@export var npc: DialogueData.Character = DialogueData.Character.MC
@export var dialogue_size = Vector2(300, 140)
@export var dialogue_offset = Vector2(0, -200)

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

@export var sprite_position: Vector2 = Vector2(-4, -110):
	set(new_sprite_position):
		sprite_position = new_sprite_position
		if sprite_node:
			sprite_node.position = new_sprite_position

@onready var sprite_node = $Sprite
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")

var is_chattering = false
var scripted_waiting = false
var has_light = true

func _ready():
	sprite_node.position = sprite_position
	sprite_node.texture = texture
	sprite_node.flip_h = flip_h

func _interact():
	if scripted_dialogue == DialogueData.ScriptedDialogue.NONE:
		return
	player.lock_movement()
	player.lock_interaction()
	for npc in DialogueData.SCRIPTED_DIALOGUE[scripted_dialogue]:
		dialogue.show_dialogue(DialogueData.CHARACTER_NAME[npc.character], npc.content)
		await dialogue.done
	player.unlock_movement()
	player.unlock_interaction()
	dialogue.hide_dialogue()
