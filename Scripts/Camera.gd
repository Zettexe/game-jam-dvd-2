extends Camera2D

@onready var player = get_tree().get_first_node_in_group("KitchenPlayer")

func _ready():
	limit_left += get_parent().position.x
	limit_right += get_parent().position.x

func _process(delta):
	position.x = player.position.x
