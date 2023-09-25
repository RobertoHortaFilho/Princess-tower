/// @description Insert description here
// Inherit the parent event
event_inherited();

life = 2

dir = 0
spd = .2

chase_min = 80
chase_max = 90
attack_range = 40

attack_speed = game_get_speed(gamespeed_fps)
alarm[0] = attack_speed


function attack_tower() {
	if instance_exists(obj_tower) {
		obj_tower.take_damage()
		state = STATES.DEATH
	}
}