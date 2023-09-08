extends Node2D

@onready var background = $Background
@onready var main = $Main
@onready var foreground = $Foreground

@onready var camera = get_tree().get_first_node_in_group("KitchenCamera")

@onready var background_x = background.position.x
@onready var foreground_x = foreground.position.x + get_parent().position.x / 2

func _process(delta):
	background.position.x = background_x - camera.get_screen_center_position().x / 16
	foreground.position.x = foreground_x - camera.get_screen_center_position().x / 2
