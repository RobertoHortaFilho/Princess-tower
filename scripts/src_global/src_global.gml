enum STATES {
	IDLE,
	RUN,
	ATTACK,
	DEATH,
	CHASE,
	INDAMAGE,
	KNOCKBACK,
}

global.p1 = noone
global.p2 = noone

function src_reset_player_status(){

}

function src_cam_shake(_val) {
	if instance_exists(obj_cam) {
		obj_cam.shake(_val)
	}
}