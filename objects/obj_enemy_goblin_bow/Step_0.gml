switch state {
	case STATES.RUN:
	sprite_index = spr_goblin_archer
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
	sprite_index = spr_goblin_archer
	if instance_exists(obj_player) {
		var _near = instance_nearest(x,y,obj_player)
		dir = point_direction(x, y, _near.x, _near.y)
		hspd = lengthdir_x(spd, dir)
		vspd = lengthdir_y(spd, dir)
		
		
		var _dis = point_distance(x,y, _near.x, _near.y)
		if _dis > chase_min {
			state = STATES.RUN
		}
		if _dis < attack_range and alarm[0] <= 0 {
			state = STATES.IDLE
			image_index = 0
			}
		  
		} else { // se o player n existir
			state = STATES.RUN
		}
	break;
	case STATES.IDLE:
	sprite_index = spr_goblin_archer_shooting
		hspd = 0
		vspd = 0
	break;
	case STATES.ATTACK:
		hspd = 0
		vspd = 0
	break;
}


// Inherit the parent event
event_inherited();

