extends StaticBody2D

const PUDDLE_REFERENCE = preload("res://Puddle.tscn")

@export var spawn_chance_per_frame: float = 0.05

@onready var spawn_area = $Area/CollisionShape

func _process(delta):
	if randi() % 100000 < int(spawn_chance_per_frame * 1000):
		var puddle = PUDDLE_REFERENCE.instantiate()
		add_child(puddle)
		puddle.visible = false
		while not (puddle.has_overlapping_areas() or puddle.has_overlapping_bodies()):
			var random_point = spawn_area.get_random_point_inside_shape()
			puddle.position = random_point
			await get_tree().physics_frame
		puddle.visible = true

