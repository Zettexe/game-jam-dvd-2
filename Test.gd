extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var longest_content = ""
	for s in DialogueData.SCRIPTED_DIALOGUE:
		print(s)
		if s == DialogueData.ScriptedDialogue.INTRO:
			continue
		
		for item in DialogueData.SCRIPTED_DIALOGUE[s]:
			print(item)
			if item.content.length() > longest_content.length():
				longest_content = item.content
	
	print(longest_content)
