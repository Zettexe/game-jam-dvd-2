extends Node

enum Character { MC, WITCH, NARRATOR, MCAT, BOSS, GUARD, ELDERLY, GRANDMA, HUNTRESS }

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
	"Ack! Almost spilled my drink...",
	"I'm so hungry, I could eat a horse!"
]

enum ScriptedDialogue { NONE, INTRO, BATKNIFE1, BATKNIFE2A, BATKNIFE2B, BAKERY1, BAKERY2A, BAKERY2B, NIGHT1, GOTCAT}

const DARKNESS_CHATTER = [
	"Hey! Who turned out the lights?",
	"Hello? The lights?",
	"Turn the lights back on! Immediately!",
	"It's so dark... I can't see anything!",
	"It's too dark! I'm scared!",
	"What's going on?!",
	"Turn the lights back on! Please!",
	"I don't know where my hands are anymore!",
	"Ugh... I lost my train of thought there...",
	"Hey! Bargirl! The lights!",
	"Why is everyone shouting?!"
]

const SCRIPTED_DIALOGUE = {
	ScriptedDialogue.INTRO: [ # Outside
		{ "character": Character.MC, "content": "(So... This is the Cauldron. Alright...)" },
		{ "character": Character.MC, "content": "(Now that mom's gone, I gotta work hard.)

(Can't live without money, after all...)

(And we sold the farm to pay for the meds. Can't live off that either...)" },
		{ "character": Character.MC, "content": "(Ah, come on, Nat. It's just some innwork. How hard could it be?)" },
		{ "character": Character.MC, "content": "(Here goes nothing.)" },
		{ "character": Character.NARRATOR, "content": "..." }, #Fade to black
		{ "character": Character.NARRATOR, "content": "Some months later..." }, # Inside
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
	ScriptedDialogue.BATKNIFE2A: [
		{ "character": Character.GUARD, "content": "Huh..." },
		{ "character": Character.GUARD, "content": "Weird, he's not here yet." },
		{ "character": Character.GUARD, "content": "Wonder if he's sick or something." },
		{ "character": Character.GUARD, "content": "Must have been yesternight's rain." },
		{ "character": Character.GUARD, "content": "Old geezer has been sitting his arse on that chair since I joined the guards, ten years ago." },
		{ "character": Character.GUARD, "content": "Well, at least ten years." },
		{ "character": Character.GUARD, "content": "No way he just got bored of coming here!" },
		{ "character": Character.GUARD, "content": "Nah, he's probably just in bed. Good ol' Genevieve must have made him a nice soup." },
		{ "character": Character.GUARD, "content": "I should pass by his house later." },
		{ "character": Character.GUARD, "content": "...After my turn. Which I'm spending here anyway! Gotta love being paid for doing nothing!" }
	],
	ScriptedDialogue.BATKNIFE2B: [
		{ "character": Character.GUARD, "content": "Oi, gramps." },
		{ "character": Character.ELDERLY, "content": "Yes?" },
		{ "character": Character.GUARD, "content": "You seem chipper today. What's up?" },
		{ "character": Character.ELDERLY, "content": "Haha! Nothing much, young boy!" },
		{ "character": Character.GUARD, "content": "Really?" },
		{ "character": Character.ELDERLY, "content": "Quite!" },
		{ "character": Character.GUARD, "content": "Nah, something's happened. Spit it up, old man." },
		{ "character": Character.ELDERLY, "content": "Old man? Haha! I feel quite young right now!" },
		{ "character": Character.GUARD, "content": "Alright, so something did happen." },
		{ "character": Character.ELDERLY, "content": "Yes, yes, alright. I don't know why, but yesternight...
													Wife made my favorite! She hadn't in years... So many, I lost count!" },
		{ "character": Character.GUARD, "content": "Your favorite?" },
		{ "character": Character.ELDERLY, "content": "" },
		{ "character": Character.GUARD, "content": "Huh uh. What was the occasion?" },
		{ "character": Character.ELDERLY, "content": "I don't know, truly. She looked a bit weird, though..." },
		{ "character": Character.GUARD, "content": "Weird how?" },
		{ "character": Character.ELDERLY, "content": "She was staring at me! Like the time she tried to stab me! Hahaha!" },
		{ "character": Character.GUARD, "content": "Huh. So...?" },
		{ "character": Character.ELDERLY, "content": "Ah, right. When I was done eating, I felt... Like I was young again!" },
		{ "character": Character.ELDERLY, "content": "I think I just had forgotten how much I loved my dear Genevieve." },
		{ "character": Character.GUARD, "content": "Hah. So you'll stop wasting your time here?" },
		{ "character": Character.ELDERLY, "content": "Oh, hells no. We need our spaces." },
		{ "character": Character.GUARD, "content": "Your spaces?" },
		{ "character": Character.ELDERLY, "content": "We'll be tight once we'll be buried at the graveyard, so we better have some space now! Hahaha!" },
		{ "character": Character.GUARD, "content": "Gramps..." },
		{ "character": Character.ELDERLY, "content": "But! I will leave earlier. I feel like seeing her again!" },
		{ "character": Character.GUARD, "content": "Well. It's never too late to love, huh?" },
		{ "character": Character.ELDERLY, "content": "Sure isn't! I'll even go get her some roses today! But for now, we feast!" },
		{ "character": Character.GUARD, "content": "Alright, alright.
													Now that you feel young again, though, maybe you'll be able to answer me." },
		{ "character": Character.GUARD, "content": "What do you think is the better weapon?
													A bat or a knife?" }
	],
	ScriptedDialogue.BAKERY1: [
		{ "character": Character.GRANDMA, "content": "Ah, sweetie... Did you remember to order the bread?"},
		{ "character": Character.HUNTRESS, "content": "'Ma, we've been goin' to the same bakery for years now.
													They know your order by heart."},
		{ "character": Character.GRANDMA, "content": "Do they, now... I still would like for you to place the order, though..."},
		{ "character": Character.HUNTRESS, "content": "Why? It's always the same. A whole loaf. It's not even hard to remember."},
		{ "character": Character.GRANDMA, "content": "Because, sweetie. That way they make it especially for us, and we know it will always be there."},
		{ "character": Character.HUNTRESS, "content": "Guess so. Don't think there's 'nough people in the town to buy out the bakery anyway, is there?"},
		{ "character": Character.GRANDMA, "content": "Take it from me, sweetie. You never know when famine strikes."},
		{ "character": Character.HUNTRESS, "content": "Wouldn't that just mean no bread for anyone? Doesn't matter if we order it."},
		{ "character": Character.GRANDMA, "content": "Ah, you would think that... But the left over wheat will be gone fast, and people will buy more than they need...
													And that leaves us with no bread."},
		{ "character": Character.HUNTRESS, "content": "...Guess so. Wait, 'ma, you lived through that?"},
		{ "character": Character.GRANDMA, "content": "Well, I'm alive, am I not?"},
		{ "character": Character.HUNTRESS, "content": "Hah. I meant. You had that happen to you?"},
		{ "character": Character.GRANDMA, "content": "Many things happened to me, sweetie... But yes, yes. It was a very cold winter..."},
		{ "character": Character.HUNTRESS, "content": "Oh, story time. Nice. Can finish my soup."},
		{ "character": Character.GRANDMA, "content": "Ahem! It was a very cold winter..."},
		{ "character": Character.HUNTRESS, "content": "Wait, 'ma. Can you pass me the water?"},
		{ "character": Character.GRANDMA, "content": "Do you want to hear it or no?"},
		{ "character": Character.HUNTRESS, "content": "Aye. I just wanted to drink."},
		{ "character": Character.GRANDMA, "content": "Fine, there. Now, where was I?"},
		{ "character": Character.HUNTRESS, "content": "It was a very cold winter."},
		{ "character": Character.GRANDMA, "content": "Ah, yes! It was a very cold winter..."},
		{ "character": Character.GRANDMA, "content": "We were getting ready to harvest that season's wheat...
													When all of a sudden..."},
		{ "character": Character.GRANDMA, "content": "Famine struck!"},
		{ "character": Character.HUNTRESS, "content": "...Just like that?"},
		{ "character": Character.GRANDMA, "content": "Well, I told you. It was a very cold winter."},
		{ "character": Character.GRANDMA, "content": "If it's too cold, the harvest suffers."},
		{ "character": Character.HUNTRESS, "content": "...Yeah I guess I could have seen it coming, huh."},
		{ "character": Character.GRANDMA, "content": "Thankfully, we weren't many. We mostly lost money from selling it, but we had enough to eat."},
		{ "character": Character.HUNTRESS, "content": "Ah, wasn't too bad, then."},
		{ "character": Character.GRANDMA, "content": "No, no... Except when the well froze over. That was fun."},
		{ "character": Character.HUNTRESS, "content": "The... Well froze?"},
		{ "character": Character.GRANDMA, "content": "Yes it did. It was a very—"},
		{ "character": Character.HUNTRESS, "content": "Cold winter, yes, yes, I get it."},
		{ "character": Character.GRANDMA, "content": "Now, now, sweetie! Why so grumpy?"},
		{ "character": Character.HUNTRESS, "content": "I'm not grumpy!"},
		{ "character": Character.GRANDMA, "content": "Yes you are. Was the baker girl not there?"},
		{ "character": Character.HUNTRESS, "content": "Huh?! What's she got to do with anything?"},
		{ "character": Character.GRANDMA, "content": "I might be old, but I'm not blind yet."},
		{ "character": Character.HUNTRESS, "content": "..."},
		{ "character": Character.GRANDMA, "content": "Sweetie, sweetie. Grandma has more surprises than you might think."},
		{ "character": Character.HUNTRESS, "content": "...'ma? Whatcha mean?"},
		{ "character": Character.GRANDMA, "content": "I have a fine eye for good lasses like that. You see..."},
		{ "character": Character.HUNTRESS, "content": "Oh, nope, nope. I know you. You're going to overshare and I will be traumatized for life."},
		{ "character": Character.GRANDMA, "content": "Haha! No, sweetie! You see, during that very cold winter..."},
		{ "character": Character.HUNTRESS, "content": "Oh Goddess above."},
		{ "character": Character.GRANDMA, "content": "Yes, why, she said exactly the same!"},
		{ "character": Character.HUNTRESS, "content": "..."}
	],
	ScriptedDialogue.BAKERY2A: [
		{ "character": Character.GRANDMA, "content": "What's that frown, sweetie?"},
		{ "character": Character.HUNTRESS, "content": "Hm..."},
		{ "character": Character.GRANDMA, "content": "Dear?"},
		{ "character": Character.HUNTRESS, "content": "It's just... That girl."},
		{ "character": Character.GRANDMA, "content": "Ah? Was she not there today?"},
		{ "character": Character.HUNTRESS, "content": "Nope. Well, don't think so. Didn't go."},
		{ "character": Character.GRANDMA, "content": "You didn't?"},
		{ "character": Character.HUNTRESS, "content": "Yesterday, I told her I wanted to talk.
													She told me to wait up, so I did."},
		{ "character": Character.HUNTRESS, "content": "Swung by after the bakery was closed. But before I could talk to her, she's up on a horse and out of town."},
		{ "character": Character.GRANDMA, "content": "Ah? She eloped? How dreadful..."},
		{ "character": Character.HUNTRESS, "content": "Guess it wasn't meant to be."},
		{ "character": Character.GRANDMA, "content": "Now, now, dear. To love is to know when to let theme go. I'm sure she's found a fine man."},
		{ "character": Character.HUNTRESS, "content": "Wasn't a man."},
		{ "character": Character.GRANDMA, "content": "Really? Well... She'll still be happy."},
		{ "character": Character.HUNTRESS, "content": "Yeah, hope so."},
		{ "character": Character.GRANDMA, "content": "...Did you recognize her?"},
		{ "character": Character.HUNTRESS, "content": "...Yeah. Think so, at least."},
		{ "character": Character.HUNTRESS, "content": "Think 'twas Pauline."},
		{ "character": Character.GRANDMA, "content": "Pauline? The smith's wife?"},
		{ "character": Character.HUNTRESS, "content": "Not anymore, it seems."},
		{ "character": Character.GRANDMA, "content": "Ah... Now it makes sense..."},
		{ "character": Character.HUNTRESS, "content": "What does?"},
		{ "character": Character.GRANDMA, "content": "I heard someone saying she had gone mad..."},
		{ "character": Character.GRANDMA, "content": "Now I know what they meant!
													She was shouting about true love, you see."},
		{ "character": Character.GRANDMA, "content": "Ah, dearie me. To be young again..."},
		{ "character": Character.HUNTRESS, "content": "True love, huh..."},
		{ "character": Character.GRANDMA, "content": "Yes, yes. About remembering what love was, or something of the sort!"},
		{ "character": Character.HUNTRESS, "content": "Hm. Didn't know she had a thing going on with Melissa."},
		{ "character": Character.GRANDMA, "content": "Goes to show you never fully know someone! Unless you marry them, haha!"},
		{ "character": Character.HUNTRESS, "content": "...Guess so."},
		{ "character": Character.GRANDMA, "content": "Ah, sweetie, sweetie. Stop with the moping. Grandma will make you your favorite apple pie.
													It won't mend a broken heart, but it's better than an empty belly!"},
		{ "character": Character.HUNTRESS, "content": "...Yeah... 
													Thanks, 'ma."},
		
	],
	ScriptedDialogue.BAKERY2B: [],
	ScriptedDialogue.NIGHT1: [],
	ScriptedDialogue.GOTCAT: []
}
