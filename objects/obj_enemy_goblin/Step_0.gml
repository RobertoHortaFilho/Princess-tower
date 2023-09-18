/// @description Insert description here
// You can write your code in this editor


switch state {
	case STATES.RUN:
	sprite_index = spr_goblin
	if instance_exists(obj_tower) {
		dir = point_direction(x,y, obj_tower.x, obj_tower.y)
	}

	hspd = lengthdir_x(spd, dir)
	vspd = lengthdir_y(spd, dir)
	
	if instance_exists(obj_player) {
		var _near = instance_nearest(x,y,obj_player)
		var _dis = point_distance(x,y, _near.x, _near.y)
		if _dis < chase_min {
			state = STATES.CHASE
		}
	}  
	
	break;
	case STATES.CHASE:
	sprite_index = spr_goblin
	if instance_exists(obj_player) {
		var _near = instance_nearest(x,y,obj_player)
		dir = point_direction(x, y, _near.x, _near.y)
		hspd = lengthdir_x(spd, dir)
		vspd = lengthdir_y(spd, dir)
		
		
		var _dis = point_distance(x,y, _near.x, _near.y)
		if _dis > chase_max {
			state = STATES.RUN
		}
		if _dis < attack_range {
			state = STATES.IDLE
			alarm[0] = game_get_speed(gamespeed_fps) / 2
		}
		  
	} else {
		state = STATES.RUN
	}
	break;
	case STATES.IDLE:
		sprite_index = spr_goblin_pre
		hspd = 0
		vspd = 0
		if alarm[0] == -1 { state = STATES.ATTACK image_index = 0 } 
	break;
	case STATES.ATTACK:
		sprite_index = spr_goblin_attack
		hspd = 0
		vspd = 0
	break;
}







// Inherit the parent event
event_inherited();

