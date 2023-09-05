extends CharacterBody2D

const SPEED = 100
const STOPPING_FACTOR = 800
var lock_velocity = false

var overlapping_areas = []

func _input(event):
	if event.is_action("interact", true) and event.pressed and overlapping_areas.size() > 0:
		# Find interactable object with the shortest distance to the player
		var shortest_distance_area = overlapping_areas[0]
		for area in overlapping_areas:
			if area == shortest_distance_area:
				continue
			if global_position.distance_squared_to(area.global_position) < \
			global_position.distance_squared_to(shortest_distance_area.global_position):
				shortest_distance_area = area
		var node = shortest_distance_area.get_parent()
		
		# Interact with the object if it has a _interact function
		if node.has_method("_interact"):
			node._interact()
		else:
			printerr("%s does not contain a definition for _interact" % node.name)

func cartesian_to_isometric(cartesian: Vector2) -> Vector2:
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") * Vector2(1, 0.75)
	if direction and not lock_velocity:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * STOPPING_FACTOR)
	
	move_and_slide()

func _on_interactable_area_entered(area):
	overlapping_areas.append(area)

func _on_interactable_area_exited(area):
	overlapping_areas.erase(area)

# Utility functions for the interactable object
func lock_interaction():
	set_process_input(false)

func unlock_interaction():
	set_process_input(true)

func lock_movement():
	lock_velocity = true

func unlock_movement():
	lock_velocity = false
