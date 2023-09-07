extends CharacterBody2D

const SPEED = 200
const STOPPING_FACTOR = 1600
var lock_velocity = false
var velocity_modifier = Vector2.ONE
var has_mopping_powerup = false:
	set(new_value):
		has_mopping_powerup = new_value
		mop_sprite.visible = new_value

@onready var mop_sprite = $Mop

func _ready():
	mop_sprite.visible = has_mopping_powerup

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
	for area in overlapping_areas:
		if area.is_in_group("Puddle"):
			if has_mopping_powerup:
				area.get_parent().remove_child(area)
				break
			direction *= 0.5
			break
	if direction and not lock_velocity:
		velocity = direction * velocity_modifier * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * STOPPING_FACTOR)
	
	move_and_slide()

func _on_interactable_area_entered(area):
	overlapping_areas.append(area)

func _on_interactable_area_exited(area):
	overlapping_areas.erase(area)

# Utility functions for the interactable object
func disable_interaction():
	set_process_input(false)

func enable_interaction():
	set_process_input(true)

func lock_movement():
	lock_velocity = true

func unlock_movement():
	lock_velocity = false
