/// @description Insert description here
// You can write your code in this editor
src_enemy_damage_by_colision()

src_enemy_move_and_colider()

if (hspd != 0) {
	image_xscale = sign(hspd)
}

if state = STATES.KNOCKBACK {
	if alarm[11] < 0 {
		state = STATES.RUN
	}
}

depth = -y