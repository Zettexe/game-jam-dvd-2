extends Node

enum Character { CHARACTER_1, CHARACTER_2 } # Rename this to the characters name

const CHARACTER_NAME = {
	Character.CHARACTER_1: "Character 1",
	Character.CHARACTER_2: "Character 2",
}

const CHATTER = [
	"Hello I am chatter",
	"Chatter chatter",
	"Talking makes me dizzy",
	"Running makes me dizzy",
	"I like trains",
	"Jandy my beloved",
	"Pickle Nagito is best boy"
]

enum ScriptedDialogue { SCRIPTED_DIALOGUE_NAME, SCRIPTED_DIALOGUE_2_NAME }

const SCRIPTED_DIALOGUE = {
	ScriptedDialogue.SCRIPTED_DIALOGUE_NAME: [
		{ "character": Character.CHARACTER_1, "content": "I am saying this line of dialogue" },
		{ "character": Character.CHARACTER_1, "content": "and this line" },
		{ "character": Character.CHARACTER_2, "content": "I am responding with this line" }
	],
	ScriptedDialogue.SCRIPTED_DIALOGUE_2_NAME: [
		{ "character": Character.CHARACTER_1, "content": "This is a different scripted dialogue" },
		{ "character": Character.CHARACTER_2, "content": "Yay data orginization" },
		{ "character": Character.CHARACTER_2, "content": "I cant spell for shit bro" }
	]
}
