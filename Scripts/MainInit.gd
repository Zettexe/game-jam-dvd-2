extends Control

const SPEED = 5

@onready var overlay = get_tree().get_first_node_in_group("Overlay")
@onready var dialogue = get_tree().get_first_node_in_group("Dialogue")
@onready var oldman = get_tree().get_first_node_in_group("OldMan")

var overlay_target = Color.TRANSPARENT
var second_round = false
var waiting = false

func _ready():
	if DialogueData.is_evil:
		oldman.visible = false
		oldman.get_parent().disabled_old_man = true

func _process(delta):
	if overlay.modulate != overlay_target:
		overlay.modulate = overlay.modulate.lerp(overlay_target, delta * SPEED)
		if overlay.modulate.a >= 0.99 or overlay.modulate.a <= 0.01:
			overlay.modulate = overlay_target
	elif overlay.modulate == Color.TRANSPARENT and not waiting:
		if DialogueData.is_day_2 or second_round:
			print("Is either day 2 or second round")
			return
		
		waiting = true
		
		await get_tree().create_timer(0.5).timeout
		
		print("Start Dialogue")
		
		for npc in DialogueData.SCRIPTED_DIALOGUE[DialogueData.ScriptedDialogue.INTRO]:
			dialogue.show_dialogue(DialogueData.CHARACTER_NAME[npc.character], npc.content)
			await dialogue.done
		
		dialogue.hide_dialogue()
		
		print("End Dialogue")
		
		await get_tree().create_timer(0.5).timeout
		overlay_target = Color.WHITE
		second_round = true
		waiting = false
	elif overlay.modulate == Color.WHITE and not waiting:
		waiting = true
		await get_tree().create_timer(0.5).timeout
		overlay_target = Color.TRANSPARENT
		get_tree().paused = false
