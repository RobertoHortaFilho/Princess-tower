/// @description Insert description here
// You can write your code in this editor

switch state {
	case STATES.IDLE:
		if instance_exists(obj_player) {
			var _near = instance_nearest(x,y,obj_player)
			dir = point_direction(x, y, _near.x, _near.y)
			instance_create_layer(x,y -6, "bullets", obj_arrow, { direction: dir })
		}
		state = STATES.ATTACK
		image_index = 0
		sprite_index = spr_goblin_archer_shooting_end
	break;
	case STATES.ATTACK:
		state = STATES.RUN
		alarm[0] = attack_speed
	break;
}






