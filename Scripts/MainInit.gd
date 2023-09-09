extends Control

signal overlay_done_transition
signal intro_done_transition

const SPEED = 5

@onready var overlay = get_tree().get_first_node_in_group("Overlay")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")
@onready var oldman = get_tree().get_first_node_in_group("OldMan")
@onready var intro = get_tree().get_first_node_in_group("Intro")
@onready var witch = get_tree().get_first_node_in_group("Witch")

var overlay_target = Color.TRANSPARENT
var intro_target = Color.WHITE
var should_move_witch = false

func _ready():
	if DialogueData.is_evil:
		oldman.visible = false
		oldman.get_parent().disabled_old_man = true
	
	if DialogueData.is_day_2:
		witch.visible = false
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
	witch.visible = false
	should_move_witch = false
	
	await overlay_done_transition
	
	overlay_target = Color.TRANSPARENT
	get_tree().paused = false

func move_witch():
	witch.position.x += -2

func _process(delta):
	if should_move_witch:
		move_witch()
	
	if intro.modulate != intro_target:
		intro.modulate = intro.modulate.lerp(intro_target, delta * SPEED)
		if intro.modulate.a >= 0.99 or intro.modulate.a <= 0.01:
			intro.modulate = intro_target
	elif overlay.modulate == overlay_target:
		emit_signal("intro_done_transition")
	
	if overlay.modulate != overlay_target:
		overlay.modulate = overlay.modulate.lerp(overlay_target, delta * SPEED)
		if overlay.modulate.a >= 0.99 or overlay.modulate.a <= 0.01:
			overlay.modulate = overlay_target
	elif overlay.modulate == overlay_target:
		emit_signal("overlay_done_transition")


