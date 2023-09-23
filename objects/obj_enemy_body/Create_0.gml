/// @description Insert description here
// You can write your code in this editor


life = 5
dmg = 1
spd = 1
hspd = 0
vspd = 0
state = STATES.RUN

chase_min = 60
chase_max = 80
attack_range = 30

back_distance = 3

function knockback(_direction) {
	state = STATES.KNOCKBACK
	hspd = lengthdir_x(back_distance, _direction)
	vspd = lengthdir_y(back_distance, _direction)
	alarm[11] = game_get_speed(gamespeed_fps) / 8
}

target = noone
function search_target() {
	if (instance_exists(obj_player)) {
		var _near = instance_nearest(x,y,obj_player)
		if _near.state != STATES.DEATH {
			target = _near
		} else {
			target = noone
		}
	}
}


