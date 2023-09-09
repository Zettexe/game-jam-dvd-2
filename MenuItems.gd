extends VBoxContainer

@onready var children = self.get_children()
@onready var container_rotation = get_parent().rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in children:
		child.pivot_offset = child.size / 2
		child.rotation = -container_rotation
