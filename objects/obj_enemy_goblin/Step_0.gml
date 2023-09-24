/// @description

switch state {
	case STATES.RUN:
	sprite_index = spr_goblin
	if instance_exists(obj_tower) {
		dir = point_direction(x,y, obj_tower.x, obj_tower.y)
	}

	hspd = lengthdir_x(spd, dir)
	vspd = lengthdir_y(spd, dir)
	
	if target != noone {
		var _dis = point_distance(x,y, target.x, target.y)
		if _dis < chase_min { state = STATES.CHASE }
	}  
	
	break;
	case STATES.CHASE:
	sprite_index = spr_goblin
	if target != noone {
		dir = point_direction(x, y, target.x, target.y)
		hspd = lengthdir_x(spd, dir)
		vspd = lengthdir_y(spd, dir)

		var _dis = point_distance(x,y, target.x, target.y)
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
	case STATES.ATTACK_TOWER:
		sprite_index = spr_goblin_tower
		break;
}







// Inherit the parent event
event_inherited();

