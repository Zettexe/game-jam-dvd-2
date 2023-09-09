extends Control

signal overlay_done_transition
signal intro_done_transition
signal loading_done_transition

const SPEED = 5
const NIGHT_REFERENCE = preload("res://Night.tscn")
const MAIN_MENU_REFERENCE = "res://MainMenu.tscn"

@onready var overlay = get_tree().get_first_node_in_group("Overlay")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")
@onready var oldman = get_tree().get_first_node_in_group("OldMan")
@onready var intro = get_tree().get_first_node_in_group("Intro")
@onready var game_over_node = get_tree().get_first_node_in_group("GameOver")
@onready var witch = get_tree().get_first_node_in_group("Witch")
@onready var loading = get_tree().get_first_node_in_group("Loading")
@onready var scripted1 = get_tree().get_first_node_in_group("Scripted1")
@onready var scripted2 = get_tree().get_first_node_in_group("Scripted2")
@onready var joms = get_tree().get_first_node_in_group("Joms")

var overlay_target = Color.TRANSPARENT
var intro_target = Color.WHITE
var loading_target = Color.TRANSPARENT
var should_move_witch = false
var game_over = false
var timeout = 60 * 5 # minutes
var timer = 0
var start_timer = false

func _ready():
	loading.modulate = Color.TRANSPARENT
	
	if DialogueData.is_day_2:
		if DialogueData.is_evil:
			oldman.visible = false
			oldman.get_parent().get_node("Table").disabled_old_man = true
			scripted1.scripted_dialogue = DialogueData.ScriptedDialogue.BATKNIFE2A
			scripted2.scripted_dialogue = DialogueData.ScriptedDialogue.BAKERY2A
		else:
			scripted1.scripted_dialogue = DialogueData.ScriptedDialogue.BATKNIFE2B
			scripted2.scripted_dialogue = DialogueData.ScriptedDialogue.BAKERY2B
		witch.visible = false
		intro.visible = false
		get_tree().paused = false
		start_timer = true
		while not get_tree().paused and timer < timeout:
			await get_tree().process_frame
		
		overlay_target = Color.WHITE
		
		await overlay_done_transition
		
		joms.visible = true
		overlay_target = Color.TRANSPARENT
		
		await overlay_done_transition
		
		await get_tree().create_timer(5).timeout
		
		overlay_target = Color.WHITE
		
		await overlay_done_transition
		
		loading_target = Color.WHITE
		await get_tree().create_timer(2).timeout
		loading_target = Color.TRANSPARENT
		await loading_done_transition
		get_tree().change_scene_to_file(MAIN_MENU_REFERENCE)
		
		print("Is day 2, no convo")
		return
			
	await overlay_done_transition
	
	for npc in DialogueData.SCRIPTED_DIALOGUE[DialogueData.ScriptedDialogue.INTRO]:
		dialogue.show_dialogue(DialogueData.CHARACTER_NAME[npc.character], npc.content)
		if npc.content == "..." and npc.character == DialogueData.Character.NARRATOR:
			overlay_target = Color.WHITE
			await overlay_done_transition
			intro.visible = false
		if npc.content == "Some months later...":
			overlay_target = Color.TRANSPARENT
			await overlay_done_transition
		if npc.content == "Toodles!":
			witch.flip_h = false
			should_move_witch = true
		await dialogue.done
	
	dialogue.hide_dialogue()
	
	print("End Dialogue")
	
	await overlay_done_transition
	
	overlay_target = Color.WHITE
	
	await overlay_done_transition
	
	witch.visible = false
	should_move_witch = false
	overlay_target = Color.TRANSPARENT
	get_tree().paused = false
	start_timer = true
	
	while not get_tree().paused and timer < timeout:
		await get_tree().process_frame
	
	start_timer = false
	
	overlay_target = Color.WHITE
	
	await overlay_done_transition
	
	if not game_over:
		loading_target = Color.WHITE
		await get_tree().create_timer(2).timeout
		loading_target = Color.TRANSPARENT
		await loading_done_transition
		get_tree().change_scene_to_packed(NIGHT_REFERENCE)
		return
		
	game_over_node.visible = true
	overlay_target = Color.TRANSPARENT
	
	await overlay_done_transition
	
	await get_tree().create_timer(5).timeout
	
	overlay_target = Color.WHITE
	await overlay_done_transition
	loading_target = Color.WHITE
	await get_tree().create_timer(2).timeout
	loading_target = Color.TRANSPARENT
	await loading_done_transition
	get_tree().change_scene_to_file(MAIN_MENU_REFERENCE)

func move_witch():
	witch.position.x += -2

func _process(delta):
	if start_timer:
		print(timer)
		timer += delta
	
	if should_move_witch:
		move_witch()
	
	if intro.modulate != intro_target:
		intro.modulate = intro.modulate.lerp(intro_target, delta * SPEED)
		if intro.modulate.a >= 0.99 or intro.modulate.a <= 0.01:
			intro.modulate = intro_target
	elif overlay.modulate == intro_target:
		emit_signal("intro_done_transition")
	
	if loading.modulate != loading_target:
		loading.modulate = loading.modulate.lerp(loading_target, delta * SPEED)
		if loading.modulate.a >= 0.99 or loading.modulate.a <= 0.01:
			loading.modulate = loading_target
	elif loading.modulate == loading_target:
		emit_signal("loading_done_transition")
	
	if overlay.modulate != overlay_target:
		overlay.modulate = overlay.modulate.lerp(overlay_target, delta * SPEED)
		if overlay.modulate.a >= 0.99 or overlay.modulate.a <= 0.01:
			overlay.modulate = overlay_target
	elif overlay.modulate == overlay_target:
		emit_signal("overlay_done_transition")
