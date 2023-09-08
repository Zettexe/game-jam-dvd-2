extends StaticBody2D

const PUDDLE_REFERENCE = preload("res://Puddle.tscn")
const FLOATING_DIALOGUE_REFERENCE = preload("res://FloatingDialogue.tscn")

@export var spawn_chance_per_frame: float = 0.05

@onready var canvas_layer = get_tree().get_first_node_in_group("CanvasLayer")
@onready var spawn_area = $Area/CollisionShape
@onready var candle = $Candle
@onready var point_light = $PointLight2D

var npcs = []
var candle_lit = true:
	set(value):
		candle_lit = value
		candle.frame = int(value)
		point_light.enabled = value
		for npc in npcs:
			npc.has_light = value
			if value:
				npc.emit_signal("light_returned")

func _interact():
	candle_lit = true

func _ready():
	var t_npc = get_parent().get_children()
	for npc in t_npc:
		if npc.is_in_group("Characters"):
			npcs.append(npc)

func _process(delta):
	if randi() % 100000 < int(spawn_chance_per_frame * 1000):
		var puddle = PUDDLE_REFERENCE.instantiate()
		add_child(puddle)
		puddle.visible = false
		while not (puddle.has_overlapping_areas() or puddle.has_overlapping_bodies()):
			var random_point = spawn_area.get_random_point_inside_shape()
			puddle.position = random_point
			await get_tree().physics_frame
		puddle.visible = true
	
	var is_busy = false
	for npc in npcs:
		if npc.is_chattering or (npc.scripted_waiting and candle_lit):
			is_busy = true
			return
	
	if not is_busy and randi() % 100 < 10:
		for npc in npcs:
			npc.is_chattering = true
		var dialogue_node = FLOATING_DIALOGUE_REFERENCE.instantiate()
		dialogue_node.position = position
		canvas_layer.add_child(dialogue_node)
		var dialogue_content
		print(candle_lit)
		if candle_lit:
			dialogue_content = DialogueData.CHATTER[randi() % DialogueData.CHATTER.size()]
		else:
			dialogue_content = DialogueData.DARKNESS_CHATTER[randi() % DialogueData.DARKNESS_CHATTER.size()]
		print(dialogue_content)
		var selected_npc = npcs[randi() % npcs.size()]
		dialogue_node.show_dialogue(dialogue_content, selected_npc.dialogue_size, selected_npc.get_screen_transform().origin + selected_npc.dialogue_offset)
		await dialogue_node.done
		await get_tree().create_timer(1.5).timeout
		dialogue_node.hide_dialogue()
		await dialogue_node.deleted
		await get_tree().create_timer(randf_range(0, 2)).timeout
		for npc in npcs:
			npc.is_chattering = false
			if npc.scripted_waiting:
				npc.emit_signal("dialogue_ready")
	
	if randi() % 1000 < 10:
		candle_lit = false

