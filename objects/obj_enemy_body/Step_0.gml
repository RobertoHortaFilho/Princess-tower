/// @description Insert description here
// You can write your code in this editor
src_enemy_damage_by_colision()
search_target()
src_enemy_move_and_colider()
attack_tower_verify()

if (hspd != 0) {
	image_xscale = sign(hspd)
}
image_blend = c_white

switch state {
	case STATES.KNOCKBACK:
		if alarm[11] < 0 { state = STATES.RUN }
		break;
	case STATES.DEATH:
		instance_destroy()
		break;
	case STATES.ATTACK_TOWER:
		image_blend = c_red
		hspd = 0;
		vspd = 0;
		break;
}

if life <= 0 { state = STATES.DEATH }


depth = -y