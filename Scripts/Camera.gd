extends Camera2D

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready():
	# Hack so I don't have to manually position the camera to the starting position
	for i in range(0, 3):
		await get_tree().process_frame
	position_smoothing_enabled = true
	position_smoothing_speed = 8

func _process(delta):
	position = player.position
