/// @description Insert description here
// You can write your code in this editor
src_enemy_damage_by_colision()
search_target()
src_enemy_move_and_colider()

if (hspd != 0) {
	image_xscale = sign(hspd)
}

if state = STATES.KNOCKBACK {
	if alarm[11] < 0 {
		state = STATES.RUN
	}
} else if state = STATES.DEATH {
	instance_destroy()
}

if life <= 0 { state = STATES.DEATH }


depth = -y