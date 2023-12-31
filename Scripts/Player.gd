extends CharacterBody2D

const SPEED = 600
const STOPPING_FACTOR = 6400

@export var sidescroll_mode = false
@export var lock_velocity = false
@export var disable_input = false

var velocity_modifier = Vector2.ONE

var has_mopping_powerup = false:
	set(new_value):
		if not has_crate_powerup:
			has_mopping_powerup = new_value
			mop_sprites.visible = new_value
			normal_sprites.visible = !new_value

var has_crate_powerup = false:
	set(new_value):
		if not has_mopping_powerup:
			has_crate_powerup = new_value
			crate_sprites.visible = new_value
			normal_sprites.visible = !new_value

@onready var sprites = $Sprites
@onready var crate_sprites = $Sprites/Crate
@onready var crate_idle_sprite = $Sprites/Crate/IdleSprite
@onready var crate_run_sprite = $Sprites/Crate/RunSprite
@onready var normal_sprites = $Sprites/Normal
@onready var idle_sprite = $Sprites/Normal/IdleSprite
@onready var run_sprite = $Sprites/Normal/RunSprite
@onready var mop_sprites = $Sprites/Mop
@onready var mop_idle_sprite = $Sprites/Mop/IdleSprite
@onready var mop_run_sprite = $Sprites/Mop/RunSprite

func _ready():
	crate_sprites.visible = has_crate_powerup
	mop_sprites.visible = has_mopping_powerup
	normal_sprites.visible = not has_mopping_powerup and not has_crate_powerup
	run_sprite.play()
	mop_run_sprite.play()
	crate_run_sprite.play()
	if disable_input:
		disable_interaction()

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
		
	if sidescroll_mode:
		direction = Input.get_vector("move_left", "move_right", "none", "none") * Vector2(1, 0.75)
	
	for area in overlapping_areas:
		if area.is_in_group("Puddle"):
			if has_mopping_powerup:
				area.get_parent().remove_child(area)
				break
			direction *= 0.5
			break
	if direction and not lock_velocity:
		idle_sprite.visible = false
		run_sprite.visible = true
		mop_idle_sprite.visible = false
		mop_run_sprite.visible = true
		crate_idle_sprite.visible = false
		crate_run_sprite.visible = true
		velocity = direction * velocity_modifier * SPEED
	else:
		idle_sprite.visible = true
		run_sprite.visible = false
		mop_idle_sprite.visible = true
		mop_run_sprite.visible = false
		velocity = velocity.move_toward(Vector2.ZERO, delta * STOPPING_FACTOR)
	
	if direction.x:
		var flip_direction = (direction * Vector2(1, 0)).normalized().x
		sprites.scale.x = flip_direction
	
	move_and_slide()

func _on_interactable_area_entered(area):
	overlapping_areas.append(area)
	var node = area.get_parent()
	if node.has_method("_player_entered"):
		node._player_entered()

func _on_interactable_area_exited(area):
	overlapping_areas.erase(area)
	var node = area.get_parent()
	if node.has_method("_player_exited"):
		node._player_exited()

# Utility functions for the interactable object
func disable_interaction():
	set_process_input(false)

func enable_interaction():
	set_process_input(true)

func lock_movement():
	lock_velocity = true

func unlock_movement():
	lock_velocity = false
