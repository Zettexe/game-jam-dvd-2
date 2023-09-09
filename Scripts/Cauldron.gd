extends Node2D

@onready var carrot_box = get_tree().get_first_node_in_group("CarrotBox")
@onready var progress_bar = $CauldronProgressBar2

@onready var origin_rect: Rect2 = progress_bar.region_rect
@onready var origin_pos_y = progress_bar.position.y

var progress = 0:
	set(value):
		progress = clamp(value, 0, origin_rect.position.y)

var decrease_amount = 0.5

func _interact():
	if carrot_box.progress >= decrease_amount and progress >= decrease_amount:
		carrot_box.progress -= decrease_amount
		progress -= decrease_amount

func _process(delta):
	progress += delta * 2
	
	progress_bar.region_rect.position.y = origin_rect.position.y - progress
	progress_bar.region_rect.size.y = origin_rect.size.y + progress
	progress_bar.position.y = origin_pos_y + origin_rect.position.y / 2 - progress / 2
