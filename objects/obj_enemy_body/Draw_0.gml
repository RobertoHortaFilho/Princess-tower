/// @description Insert description here
// You can write your code in this editor



if state = STATES.ATTACK_TOWER {
	if (damage_tower_timer >= damage_tower_timer_total) {
		attack_tower()
		damage_tower_timer = 0;
	}
	draw_sprite(spr_loading_damage, damage_tower_timer, x, y - 20)
	damage_tower_timer += damage_tower_timer_speed
}




if state = STATES.KNOCKBACK {
	gpu_set_fog(true, c_white, 0, 0)
	draw_self()
	gpu_set_fog(false, c_white, 0, 0)
} else {
	draw_self()
}




