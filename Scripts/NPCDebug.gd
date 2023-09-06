extends Sprite2D

func _on_area_player_entered(body):
	modulate = Color.RED

func _on_area_player_exited(body):
	modulate = Color.WHITE
