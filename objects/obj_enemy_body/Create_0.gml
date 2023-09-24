/// @description Insert description here
// You can write your code in this editor


life = 5
dmg = 1
spd = 1
hspd = 0
vspd = 0
state = STATES.RUN

tower_attack_range = 10
chase_min = 60
chase_max = 80
attack_range = 30

back_distance = 3

damage_tower_timer_total = sprite_get_number(spr_loading_damage)
damage_tower_timer = 0
damage_tower_timer_speed = sprite_get_speed(spr_loading_damage) / 60

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

function attack_tower_verify() {
	if instance_exists(obj_tower) and state == STATES.RUN {
		if (distance_to_point(obj_tower.x, obj_tower.y) < tower_attack_range) {
			state = STATES.ATTACK_TOWER
			damage_tower_timer = 0
		}
	}
}

function attack_tower() {
	
}
