"Fetch Quest" by "Bart Massey and the students of PSU Interactive Fiction Spring 2025"

When play begins, say "(Thanks to DeepSeek with help selecting spell components.)"

The Deepening Glade is a room. "The forest stretches up into the hills around you. The setting sun filters through, lighting the small grassy glade in which you stand. A very small [stream] flows from north to south along the eastern edge. In the center of the glade, large and prominent, is a massive and ancient [Stone Table]."

The stream is fixed in place in the Glade. The description is "The [water]s of the crystal stream glide gently by. Its shallow blue-green shadows absorb your attention for a moment."  Instead of entering the stream, say "The stream is too small to swim in."

The blue-green water is part of the stream. Instead of doing anything with the blue-green water: say "The water seems so peaceful. You leave it to travel on its way."

The Stone Table is fixed in place and undescribed in the Glade. The description is "The table's massive legs are rooted in the earth. Its huge round top is inscribed with many [arcane runes]."

The arcane runes are part of the Stone Table. The description is "[first time]You are new to magic, but… [only]The runes seem to outline a spell for creating a [quotation mark]fetch[quotation mark]. [first time]What that is you are not sure, but you know one way to find out: make one![line break][only]The spell appears to require consuming five components: [some mustard seed], [some Dragon Tree sap], [some quicksilver], [a wax effigy], and [a Mandrake root]." Understand "top" as the arcane runes.

A spell component is a kind of thing. A spell component is always edible. After examining a spell component: say "[The noun] glows with an almost tangible mystic energy."

Section 1 - Down The Winding Path

The Winding Path is east of the Glade.

The wax effigy is a spell component.

Section 2 - Down The Rising Path

The Rising Path is west of the Glade. "The path meanders west over a steep hill. You can see that the hill flattens out further to the west."

There is a blanket in the Rising path.

The merchant is a man on the blanket.

A ware is a kind of thing. A ware has a number called the price.

The coin pouch is a thing. The coin pouch has a number called the balance. The balance of the coin pouch is usually 0.

After printing the name of the coin pouch:
	say " ([the balance of the coin pouch])".

A hoe is a ware on the blanket. The price of a hoe is 40.

Instead of taking a ware (called the ware):
	say "You can't steal [the ware], the merchant is looking right at you."

[Buying is a built-in action, but it's "blocked" in all scenes by default; this unblocks it globally.]
The block buying rule is not listed in the check buying rulebook.

Check buying a thing (called the thing):
	if the thing is not a ware:
		say "[The thing] is not for sale." instead;
	if the player does not carry a coin pouch:
		say "You don't even have a coin pouch." instead;
	if the balance of the coin pouch is less than the price of the thing:
		say "You don't have enough coins in your pouch." instead.

Carry out buying a thing (called the ware):
	now the ware is carried by the player.

Report buying a thing (called the ware):
	say "You buy [the ware].";
	now the balance of the coin pouch is the balance of the coin pouch minus the price of the ware. 

Instead of asking the merchant about "wares", say "I have wares if you have coin."

The Farm is west of the Rising Path. "The farm is small yet diverse with different crops and animals all around. There is much work for the sole farmer. A forest sprouts up to the south."

The farmer is a man in the farm.

Working is an action applying to nothing. Understand "work" as working.

A person can be injured.

Check working:
	if the player is not in the farm:
		say "There is no work to do." instead;
	if the player does not carry the coin pouch:
		say "The farmer notices you don't have a coin pouch and gives you one.";
		now the player carries the coin pouch;
	if the player is injured:
		say "You are injured and cannot work.[first time] (do something else for a few turns to heal)[only]";
		now the time of day is 1 minute before the time of day instead;
	if a random chance of 1 in 20 succeeds:
		say "You injure yourself while working. You cannot continue working until you heal.";
		now the player is injured;
		the injury heals in 5 minutes from now instead.
		
At the time when the injury heals:
	say "Your injury heals and you can work again.";
	now the player is not injured.

Carry out working:
	now the balance of the coin pouch is the balance of the coin pouch plus one.

Report working:
	say "You work hard and earn one coin."
	
After examining the farmer for the first time:
	say "'Hey there! I could use some help around the farm if you'd like to work. Of course I will pay you,' says the farmer, continuing 'By the way, you wouldn't happen to have seen a hoe, have you? Mine broke and I really need another.'"

The hoe quest is a scene.

The hoe quest begins when asking the farmer about "hoe". The hoe quest ends when giving the hoe to the farmer.

Report asking the farmer about "hoe":
	say "'I can give you some gold to go buy it for me. Here.' He gives you some gold.";
	increase the balance of the coin pouch by the price of the hoe;
	rule succeeds. [without this it prints "There is no reply."]

When the hoe quest begins:
	if the player does not carry the coin pouch:
		say "The farmer notices you don't have a coin pouch and gives you one.";
		now the player carries the coin pouch.

When the hoe quest ends:
	increase the balance of the coin pouch by 20.

The block giving rule is not listed in the check giving it to rules.

Check giving something (called the thing) to the farmer:
	if the thing is not the hoe:
		follow the block giving rule instead.
	
Report giving the hoe to the farmer:
	say "You give the farmer the hoe. He thanks you and gives you 20 coins. 'I really owe you one,' he says."
	
Some fertilizer is a thing.

Carry out asking the farmer about "fertilizer" when the hoe quest is not happening:
	now the player carries some fertilizer.

Report asking the farmer about "fertilizer" when the hoe quest is not happening:
	say "The farmer gives you some fertilizer. 'You've helped me out plenty. I'm happy to return the favor.'";
	rule succeeds.

The Forest is  south of the farm. "The forest is sparse, with just enough cover to escape the hot sun. The Dragon Tree is alone in a larger clearing in the forest."

A Dragon Tree is in the forest. The description of the tree is "The Dragon Tree looks like it has seen better days. Shriveled leaves hang limply from its withered branches."

The Dragon Tree Spirit is a person.

After examining the Dragon Tree for the first time:
	say "A spirit emerges from the tree as you stand before it. 'Please... help...'";
	now the Dragon Tree Spirit is in the forest.

The fertilizer quest is a scene. The fertilizer quest begins when asking the spirit about "tree". The fertilizer quest ends when giving the fertilizer to the spirit.
	
Report asking the spirit about "tree" when the fertilizer quest is not happening:
	say "'The tree needs food. The soil has been sapped of its nutrients. We have little to offer, but we can do our best to give you whatever you seek if you help us.'";
	rule succeeds.

Check giving something (called the thing) to the spirit:
	if the thing is not fertilizer:
		follow the block giving rule instead.
		
Report giving the fertilizer to the spirit:
	say "You give the spirit the fertilizer. 'Thank you. This will help the tree thrive. Is there anything I give to you?'".

Some Dragon Tree sap is a spell component.
	
Carry out asking the spirit about "sap" when the fertilizer quest has ended:
	now the player carries the sap.

Report asking the player about "sap" when the fertilizer quest has ended:
	say "'Very well. Take some of the Dragon Tree's sap.'";
	rule succeeds.

Section 3 - Down The Upstream Path

The Upstream Path is north of the Glade.

A Mandrake root is a spell component.

Section 4 - Down The Downstream Path

The Downstream Path is south of the Glade.

Some mustard seed is a spell component.

Section 5 - Down The Widdershins Path

The Widdershins Path is northwest of the glade.

Some quicksilver is a spell component.

Section 6 - Fetched

Every turn when the player is in the Glade: if all spell components are off-stage, say "You have consumed the spell components and are ready to cast! The place is here, the time is now. You realize that laying upon the table will complete the spell, so you step on up."; now the player is on the Stone Table; say "You feel a dark energy surge through you. You see a shadowy form floating above you. You realize that this apparition is you — or rather, your 'fetch'.[paragraph break]You can feel the contents of your stomach roiling in agony; you slowly lose consciousness."; end the story.