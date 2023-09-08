@tool
extends Node2D

func _ready():
	if Engine.is_editor_hint():
		$ParallaxBackground.offset = position
