extends Camera2D

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready():
	# Ugly hack so I don't have to manually position the camera to the starting position
	await get_tree().create_timer(0.1).timeout
	position_smoothing_enabled = true
	position_smoothing_speed = 8

func _process(delta):
	position = player.position
