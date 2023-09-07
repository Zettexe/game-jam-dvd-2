extends Control

signal exit

func _ready():
	visible = false

func _on_exit_button_pressed():
	visible = false
	emit_signal("exit")

func _on_cauldron_pressed():
	pass # Replace with function body.
