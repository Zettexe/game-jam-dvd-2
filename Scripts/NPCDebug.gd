extends Sprite2D

func _on_area_player_entered(body):
	self_modulate = Color.RED

func _on_area_player_exited(body):
	self_modulate = Color.WHITE
