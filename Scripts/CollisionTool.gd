@tool
extends CollisionPolygon2D

@export var radius_x = 16:
	set(new_radius_x):
		radius_x = new_radius_x
		generate_shape()
@export var radius_y = 8:
	set(new_radius_y):
		radius_y = new_radius_y
		generate_shape()

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_shape()

func generate_shape():
	var points = PackedVector2Array()
	var turn_step = TAU / 24.0
	
	for i in range(24):
		points.append(Vector2(cos(i * turn_step) * radius_x, sin(i * turn_step) * radius_y))
	
	polygon = points

func get_random_point_inside_shape() -> Vector2:
	var theta = randf_range(0, TAU)
	var r = sqrt(randf())
	return Vector2(r * radius_x * cos(theta), r * radius_y * sin(theta))
