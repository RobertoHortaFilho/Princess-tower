switch state {
	case STATES.RUN:
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
	
	if instance_exists(obj_player) {
		var _near = instance_nearest(x,y,obj_player)
		dir = point_direction(x, y, _near.x, _near.y)
		hspd = lengthdir_x(spd, dir)
		vspd = lengthdir_y(spd, dir)
		
		
		var _dis = point_distance(x,y, _near.x, _near.y)
		if _dis > chase_min {
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
		hspd = 0
		vspd = 0
		image_blend = c_yellow
		if alarm[0] == -1 { state = STATES.ATTACK; alarm[0] = game_get_speed(gamespeed_fps) / 4} 
	break;
	case STATES.ATTACK:
		hspd = 0
		vspd = 0
		image_blend = c_red
		if alarm[0] == -1 {
			state = STATES.RUN
			if instance_exists(obj_player) {
				var _near = instance_nearest(x,y,obj_player)
				dir = point_direction(x, y, _near.x, _near.y)
				instance_create_layer(x,y - 6, "bullets", obj_arrow, { direction: dir })
			}
		} 
	break;
}


// Inherit the parent event
event_inherited();

