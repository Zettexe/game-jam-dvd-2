extends Node

enum Character { MC, WITCH, NARRATOR, MCAT, BOSS, GUARD, ELDERLY, GRANDMA } # Rename this to the characters name

const CHARACTER_NAME = {
	Character.MC: "Natalia",
	Character.WITCH: "Eliza",
	Character.MCAT: "Cat",
	Character.NARRATOR: "",
	Character.BOSS: "Hailey",
	Character.GUARD: "Guard",
	Character.ELDERLY: "Elderly",
	Character.GRANDMA: "Grandma"
}

const CHATTER = [
	"Scrumptious!",
	"[Unintelligible]",
	"Ah...",
	"Hmhm...",
	"[Loud eating noises]",
	"There's a nice smell coming from the kitchen!",
	"Ack! Almost spilled my drink..."
]

enum ScriptedDialogue { NONE, INTRO, BATKNIFE1 }

const SCRIPTED_DIALOGUE = {
	ScriptedDialogue.INTRO: [
		{ "character": Character.MC, "content": "(So... This is the Cauldron. Alright...)" },
		{ "character": Character.MC, "content": "(Now that mom's gone, I gotta work hard.)
												(Can't live without money, after all...)
												(And we sold the farm to pay for the meds. Can't live off that either...)" },
		{ "character": Character.MC, "content": "(Ah, come on, Nat. It's just some innwork. How hard could it be?)" },
		{ "character": Character.MC, "content": "(Here goes nothing.)" },
		{ "character": Character.NARRATOR, "content": "..." },
		{ "character": Character.NARRATOR, "content": "Some months later..." },
		{ "character": Character.MC, "content": "(Sigh. Another day of work. Another day of mopping the floor, and stirring that damn pot, and... Ugh.)
												(Dealing with customers.)" },
		{ "character": Character.WITCH, "content": "Heyyyyy! Girlie! [Hic] Bring me 'nother round! ...And make it frothy, and fast!" },
		{ "character": Character.MC, "content": "...Ma'am. It's ten in the morning. That's the twelfth—" },
		{ "character": Character.WITCH, "content": "Silence! Howww dare you? You think you're better than me, don't you? Well I'll show you! No one gets to tell me when to shtop! If I want a damn beer I will get it myshelf!" },
		{ "character": Character.MC, "content": "(Why do I bother...) Right, ma'am. I'll get you—" },
		{ "character": Character.WITCH, "content": "Toooo late! I said, huh, I'll get it myself! BEGONE!" },
		{ "character": Character.NARRATOR, "content": "The witch slams her cane into the wooden floor. A sudden gust of wind blows from its tip, the ground shaking beneath Natalia's feet. The commotion grabs the attention of the few patrons that hadn't already turned for the witch's yelling.
													It all happens in an instant. The air feels electrified, while a purple glyph of arcane origin makes for a new backdrop for the drunk, albeit now imposing, witch.
													There's a sudden blinding light emanating from the top of her staff, followed by an eerie ringing sound. The light focuses on a single point on the staff's tip, before turning into a beam, aimed straight at Natalia." },
		{ "character": Character.MC, "content": "(I can't breathe...)" },
		{ "character": Character.MC, "content": "(My chest...!)
												(It hurts...)" },
		{ "character": Character.NARRATOR, "content": "The patrons gasp, as the girl behind the counter had disappearead.
													No one dared move — not even the few guards present. Who would oppose the town's witch Eliza, after all? Especially as she had no qualms about doing any of this in broad daylight.
													Mostly because of the alcohol, for sure." },
		{ "character": Character.NARRATOR, "content": "The horrored murmurs changed into confused bewilderments when a small cat jumped on top of the counter. Did they always have pets in here?" },
		{ "character": Character.MCAT, "content": "Meow?" },
		{ "character": Character.WITCH, "content": "...Huh?" },
		{ "character": Character.WITCH, "content": "I... Huh. [Hic] Why are youuuu... a..." },
		{ "character": Character.MCAT, "content": "Meow." },
		{ "character": Character.WITCH, "content": "..." },
		{ "character": Character.NARRATOR, "content": "A puff of smoke covered the kitten, and before long, there the girl was, sitting on the countertop. Confused and shaken, but none the worse for wear." },
		{ "character": Character.WITCH, "content": "...Hhhah! Yeah! I... I meant to do exactly that!" },
		{ "character": Character.MC, "content": "Ah... Meow head..." },
		{ "character": Character.MC, "content": "...My head." },
		{ "character": Character.WITCH, "content": "Never had a hungover? Hehehehe" },
		{ "character": Character.MC, "content": "No, I don't... I don't drink." },
		{ "character": Character.WITCH, "content": "Tsk! So you do think you're better than me!" },
		{ "character": Character.MC, "content": "No ma'am... 
												(She just tried to murder me, and I still have to deal with all this?)" },
		{ "character": Character.WITCH, "content": "I was right to [hic] curse you! Hehehehe" },
		{ "character": Character.MC, "content": "Curse?" },
		{ "character": Character.WITCH, "content": "Yesh! Hehehehe Every night for the rest of your pitiful short life! You'll do my bidding! Ohohohoho!" },
		{ "character": Character.MC, "content": "What did... What did you do?" },
		{ "character": Character.WITCH, "content": "What? You thought I just turned you into a cat for fun? I needed a new delivery girl! You'll do just fine!" },
		{ "character": Character.MC, "content": "Wait, hold on—" },
		{ "character": Character.WITCH, "content": "Ohohohoho!
													See you tonight, pet!" },
		{ "character": Character.MC, "content": "You! Come back here—" },
		{ "character": Character.WITCH, "content": "Toodles!" },
		{ "character": Character.MC, "content": "..." },
		{ "character": Character.MC, "content": "...She's gone." },
		{ "character": Character.MC, "content": "(Fuck. What the hell did she mean?)" },
		{ "character": Character.MC, "content": "(I... I hope I'm fine. I feel decent right now. Chances are she did nothing...)" },
		{ "character": Character.MC, "content": "(Ugh. Stuff to do is piling up already. I better get back to work, I don't want to be yelled at.)" }
	],
	ScriptedDialogue.BATKNIFE1: [
		{ "character": Character.GUARD, "content": "" },
		{ "character": Character.ELDERLY, "content": "" },
		{ "character": Character.GUARD, "content": "" }
	]
}
