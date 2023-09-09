extends Control

signal overlay_done_transition
signal loading_done_transition
signal decision_made

const SPEED = 5
const MAIN_REFERENCE = preload("res://test_scene.tscn")

@onready var decide = get_tree().get_first_node_in_group("Decide")
@onready var overlay = get_tree().get_first_node_in_group("Overlay")
@onready var loading = get_tree().get_first_node_in_group("Loading")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")

var overlay_target = Color.TRANSPARENT
var loading_target = Color.TRANSPARENT

func _ready():
	loading.modulate = Color.TRANSPARENT
	
	await overlay_done_transition
	await get_tree().create_timer(0.5).timeout
	
	for npc in DialogueData.SCRIPTED_DIALOGUE[DialogueData.ScriptedDialogue.NIGHT1]:
		dialogue.show_dialogue(DialogueData.CHARACTER_NAME[npc.character], npc.content)
		await dialogue.done
	
	dialogue.hide_dialogue()
	
	await get_tree().create_timer(0.5).timeout
	
	decide.visible = true
	
	await decision_made
	
	decide.visible = false
	DialogueData.is_day_2 = true
	
	await get_tree().create_timer(0.5).timeout
	
	overlay_target = Color.WHITE
	
	await overlay_done_transition
	
	loading_target = Color.WHITE
	await get_tree().create_timer(2).timeout
	loading_target = Color.TRANSPARENT
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(MAIN_REFERENCE)

func _process(delta):
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

func _on_decide_1_pressed():
	DialogueData.is_evil = true
	emit_signal("decision_made")

func _on_decide_2_pressed():
	emit_signal("decision_made")
