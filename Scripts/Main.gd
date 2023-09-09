extends Node2D

func _ready():
	if not DialogueData.is_day_2:
		await get_tree().process_frame
		get_tree().paused = true
