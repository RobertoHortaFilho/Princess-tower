/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


dir = 0
spd = .3

chase_min = 60
chase_max = 70
attack_range = 10

back_distance = 2

function attack_tower() {
	if instance_exists(obj_tower) {
		obj_tower.take_damage();
		state = STATES.DEATH
	}
}