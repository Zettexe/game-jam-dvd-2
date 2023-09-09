extends Control

signal done

const SPEED = 8

var is_visible = false
var background_opacity = Color.TRANSPARENT
@onready var container_target = Vector2(0, get_viewport_rect().size.y)

@onready var background = $Background
@onready var container = $VBoxContainer
@onready var name_label = $VBoxContainer/Name/Label
@onready var content_node = $VBoxContainer/Panel/Content

func _input(event):
	if is_visible and event.is_action("interact", true) and event.pressed:
		if content_node.visible_characters < content_node.text.length():
			content_node.visible_characters = content_node.text.length()
			return
		
		emit_signal("done")

func _ready():
	background.self_modulate = Color.TRANSPARENT
	container.position = Vector2(0, get_viewport_rect().size.y)
	visible = true

# Change to more robust inputs later
func show_dialogue(npc_name: String, text: String):
	name_label.visible = not not npc_name
	await get_tree().process_frame
	name_label.text = npc_name
	content_node.text = text
	content_node.visible_characters = 0
	if not is_visible:
		background_opacity = Color.WHITE
		container_target = Vector2.ZERO
		await get_tree().create_timer(0.2).timeout
		is_visible = true
	
func hide_dialogue():
	is_visible = false
	background_opacity = Color.TRANSPARENT
	container_target = Vector2(0, get_viewport_rect().size.y)

func _process(delta):
	background.self_modulate = background.self_modulate.lerp(background_opacity, delta * SPEED)
	container.position = container.position.lerp(container_target, delta * SPEED)
	
	if is_visible and content_node.text.length() > content_node.visible_characters:
		content_node.visible_characters += 1
