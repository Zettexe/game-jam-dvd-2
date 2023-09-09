extends VBoxContainer

signal overlay_done_transition

const SPEED = 5
const MAIN_REFERENCE = preload("res://test_scene.tscn")

@onready var children = self.get_children()
@onready var container_rotation = get_parent().rotation
@onready var overlay = get_tree().get_first_node_in_group("Overlay")
@onready var loading = get_tree().get_first_node_in_group("Loading")

var overlay_target = Color.TRANSPARENT
var loading_target = Color.TRANSPARENT

func _ready():
	get_tree().paused = false
	overlay_target = Color.TRANSPARENT
	
	DialogueData.is_evil = false
	DialogueData.is_day_2 = false
	
	await get_tree().process_frame
	
	await overlay_done_transition
	
	loading_target = Color.WHITE
	await get_tree().create_timer(2).timeout
	loading_target = Color.TRANSPARENT
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(MAIN_REFERENCE)

func _process(delta):
	for child in children:
		child.pivot_offset = child.size / 2
		child.rotation = -container_rotation
	
	if loading.modulate != loading_target:
		loading.modulate = loading.modulate.lerp(loading_target, delta * SPEED)
	
	if overlay.modulate != overlay_target:
		overlay.modulate = overlay.modulate.lerp(overlay_target, delta * SPEED)
		if overlay.modulate.a >= 0.99:
			overlay.modulate = overlay_target
	elif overlay.modulate == overlay_target:
		emit_signal("overlay_done_transition")

func _on_play_pressed():
	overlay_target = Color.WHITE
	overlay.mouse_filter = MOUSE_FILTER_STOP

func _on_exit_pressed():
	get_tree().quit()
