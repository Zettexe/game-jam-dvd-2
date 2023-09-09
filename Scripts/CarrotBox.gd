extends Node2D

@onready var player = get_tree().get_nodes_in_group("Player")
@onready var progress_bar = $Carrotfull
@onready var origin_rect: Rect2 = progress_bar.region_rect
@onready var origin_pos_y = progress_bar.position.y

var progress = 0:
	set(value):
		progress = clamp(value, 0, origin_rect.position.y)

func _interact():
	if player[0].has_crate_powerup:
		progress += origin_rect.position.y / 3
		for p in player:
			p.has_crate_powerup = false

func _process(delta):
	progress_bar.region_rect.position.y = origin_rect.position.y - progress
	progress_bar.region_rect.size.y = origin_rect.size.y + progress
	progress_bar.position.y = origin_pos_y + origin_rect.position.y / 2 - progress / 2
