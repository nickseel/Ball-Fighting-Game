/// @desc 

for(var i = 0; i < 4; i++) { AddOrb(self) };
current_abilities = [Abilities.LAUNCH_ORB, Abilities.RETURN_ORB];

//Init AI variable list
AI_variables = array_create(5);

// Inherit the parent event
event_inherited();

