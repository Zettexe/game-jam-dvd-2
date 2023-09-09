extends Node2D

func _ready():
	if not DialogueData.is_day_2:
		get_tree().paused = true
