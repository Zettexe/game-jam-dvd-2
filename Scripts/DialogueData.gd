extends Node

enum Character { MC, WITCH, NARRATOR, MCAT, BOSS, GUARD, ELDERLY, GRANDMA, HUNTRESS } # Rename this to the characters name

const CHARACTER_NAME = {
	Character.MC: "Natalia",
	Character.WITCH: "Eliza",
	Character.MCAT: "Cat",
	Character.NARRATOR: "",
	Character.BOSS: "Hailey",
	Character.GUARD: "Guard",
	Character.ELDERLY: "Elderly",
	Character.GRANDMA: "Grandma",
	Character.HUNTRESS: "Huntress"
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

enum ScriptedDialogue { NONE, INTRO, BATKNIFE1, BAKERY1 }
const DARKNESS_CHATTER = [
	"Hey! Who turned out the lights?",
	"Why is it so dark all of a sudden...",
    "This is surreal... from light to nothingness.",
    "This darkness feels oppressive, like it's invading my soul.",
    "How can it be this dark, I can't even see my hand?",
    "What happened? It's suddenly pitch black!",
    "Can anyone see? It feels like we've been swallowed by darkness.",
    "So strange, from light to darkness just like that.",
    "I wasn't ready for this sudden plunge into night.",
    "We need light fast; it's too dark to see.",
    "Let's stay calm and figure out this sudden darkness."
]

enum ScriptedDialogue { NONE, SCRIPTED_DIALOGUE_NAME, SCRIPTED_DIALOGUE_2_NAME }

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
		{ "character": Character.GUARD, "content": "Okay gramps, hear me out." },
		{ "character": Character.ELDERLY, "content": "Yeah?" },
		{ "character": Character.GUARD, "content": "What do you think is the better weapon?
													A bat or a knife?" },
		{ "character": Character.ELDERLY, "content": "Huh... Depends. Who's fighting? With my bad back I would lose either way, hahaha!" },
		{ "character": Character.GUARD, "content": "No, it... It doesn't matter... Okay, suppose it's a clone of you—" },
		{ "character": Character.ELDERLY, "content": "Who made the clone?" },
		{ "character": Character.GUARD, "content": "Who made...? What. No, that doesn't matter. Focus on the weapon!" },
		{ "character": Character.ELDERLY, "content": "Why? If it was that witch from before, the clone might be drunk! Hahaha!" },
		{ "character": Character.GUARD, "content": "It's just a clone of you! As you are right now!" },
		{ "character": Character.ELDERLY, "content": "Ahhh... Then... I suppose the knife would win." },
		{ "character": Character.GUARD, "content": "You think? Why?" },
		{ "character": Character.ELDERLY, "content": "I can't swing a bat! My back would crack! Hahaha!" },
		{ "character": Character.GUARD, "content": "..." },
		{ "character": Character.ELDERLY, "content": "I'm not sure I could hold a knife either! You know my wife Genevieve? She tried to stab me the other day!" },
		{ "character": Character.GUARD, "content": "She what?" },
		{ "character": Character.ELDERLY, "content": "I think so, at least! That's what it looked like, hahaha!" },
		{ "character": Character.GUARD, "content": "Why are you laughing about it..." },
		{ "character": Character.ELDERLY, "content": "Ahh! I jest, I jest! My dear would never, she's a good wife! That's why I'm here talking to you instead of being home, hahaha!" },
		{ "character": Character.GUARD, "content": "...Right." },
		{ "character": Character.GUARD, "content": "As I was saying..." },
		{ "character": Character.GUARD, "content": "...Actually, nevermind." },
		{ "character": Character.ELDERLY, "content": "No, no, continue! I like brainteasers such as these! Young folks like you need to keep that stuff healthy!" },
		{ "character": Character.GUARD, "content": "...Okay." },
		{ "character": Character.GUARD, "content": "Suppose it was you... uh... Fifty years ago. Sixty." },
		{ "character": Character.GUARD, "content": "However long ago you were twenty." },
		{ "character": Character.ELDERLY, "content": "Haha! You know that the best wine is the aged one!" },
		{ "character": Character.GUARD, "content": "Yeah—" },
		{ "character": Character.ELDERLY, "content": "And cheese!" },
		{ "character": Character.GUARD, "content": "So. Bat or knife?" },
		{ "character": Character.ELDERLY, "content": "And I'm twenty?" },
		{ "character": Character.GUARD, "content": "Yes." },
		{ "character": Character.ELDERLY, "content": "Who am I fighting?" },
		{ "character": Character.GUARD, "content": "A clone of yourself!" },
		{ "character": Character.ELDERLY, "content": "Ahh! Right! Hmmm..." },
		{ "character": Character.ELDERLY, "content": "Bat, for sure." },
		{ "character": Character.GUARD, "content": "Alright. Why?" },
		{ "character": Character.ELDERLY, "content": "Looks better with the ladies! Knives are for thieves and scoundrels! No good woman would be the wife of someone like that!" },
		{ "character": Character.GUARD, "content": "...Okay, forget the women." },
		{ "character": Character.ELDERLY, "content": "I've been trying! Why do you think I'm here? Hahaha!" },
		{ "character": Character.GUARD, "content": "Gramps! It's a fight to the death! You don't care about impressing women, you just want to get out of there alive!" },
		{ "character": Character.ELDERLY, "content": "Ahhh, okay... Then... Hmmm..." },
		{ "character": Character.GUARD, "content": "Yeah?" },
		{ "character": Character.ELDERLY, "content": "Which one would you choose?" },
		{ "character": Character.GUARD, "content": "Me?
													I don't want to influence your answer. I'll tell you after you tell me." },
		{ "character": Character.ELDERLY, "content": "Hahaha! It's a tough one!" },
		{ "character": Character.GUARD, "content": "Sure is. Whole barracks was talking about it. Almost made a riot." },
		{ "character": Character.ELDERLY, "content": "Is that what you young folks get to today? Argue all time?" },
		{ "character": Character.GUARD, "content": "...Sorta. Why, didn't you say it was good for the brain?" },
		{ "character": Character.ELDERLY, "content": "When did I say that? Men should use their muscles! Not their brain!" },
		{ "character": Character.GUARD, "content": "But you said—" },
		{ "character": Character.ELDERLY, "content": "Back in my day, they would have grabbed a bat and a knife and started fighting!" },
		{ "character": Character.GUARD, "content": "They almost did, but... That's not the point." },
		{ "character": Character.ELDERLY, "content": "And then they'd go get a beer together!" },
		{ "character": Character.GUARD, "content": "..." },
		{ "character": Character.GUARD, "content": "Let's get back on track." },
		{ "character": Character.ELDERLY, "content": "What track? I'm not moving from here, I'm still finishing my meal!" },
		{ "character": Character.GUARD, "content": "..." },
		{ "character": Character.GUARD, "content": "Can you give me an answer?" },
		{ "character": Character.ELDERLY, "content": "To what?" },
		{ "character": Character.GUARD, "content": "..." },
		{ "character": Character.GUARD, "content": "Forget it." },
	],
	ScriptedDialogue.BAKERY1: [
		{ "character": Character.HUNTRESS, "content": ""},
		{ "character": Character.GRANDMA, "content": ""},
	]
}
