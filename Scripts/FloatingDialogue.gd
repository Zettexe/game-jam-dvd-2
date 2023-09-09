extends Control

signal done
signal deleted

const SPEED = 32

@onready var canvas_layer = get_tree().get_first_node_in_group("CanvasLayer")
@onready var camera: Camera2D = get_tree().get_first_node_in_group("Camera")
@onready var kitchen_camera: Camera2D = get_tree().get_first_node_in_group("KitchenCamera")
@onready var background = $Background
@onready var content_node = $Background/MarginContainer/Content

var dialogue_size = Vector2.ZERO
var dialogue_position = Vector2.ZERO
var camera_offset = Vector2.ZERO
var is_visible = false # should probably rename this

func show_dialogue(text: String, size: Vector2, position: Vector2):
	content_node.text = text
	content_node.visible_characters = 0
	dialogue_size = size
	dialogue_position = position
	
	print(camera.get_screen_center_position())
	print(kitchen_camera.get_screen_center_position())
	print(position)
	print(camera_offset)
	print(position + camera_offset)

func hide_dialogue():
	is_visible = false
	content_node.visible_characters = 0
	dialogue_size = Vector2.ZERO

func _process(delta):
	if not is_visible or not dialogue_size:
		var t = delta * SPEED;
		background.size = background.size.lerp(dialogue_size, t)
		background.position = background.position.lerp(-dialogue_size / 2, t)
	
	if camera.enabled:
		position = dialogue_position
	else:
		position = (dialogue_position + (kitchen_camera.get_target_position()) * kitchen_camera.zoom * Vector2(0, 1)) / kitchen_camera.zoom + Vector2(1920, 1080) / 3
	
	if dialogue_size and background.size >= (dialogue_size - Vector2.ONE) and not is_visible:
		background.size = dialogue_size
		background.position = -dialogue_size / 2
		is_visible = true
	
	if not dialogue_size and background.size <= Vector2.ONE * 10:
		emit_signal("deleted")
		canvas_layer.remove_child(self)
	
	if is_visible:
		if content_node.text.length() > content_node.visible_characters:
			content_node.visible_characters += 1
		else:
			emit_signal("done")
