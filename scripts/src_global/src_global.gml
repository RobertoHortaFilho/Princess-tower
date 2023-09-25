randomize()

enum STATES {
	IDLE,
	RUN,
	ATTACK,
	DEATH,
	CHASE,
	INDAMAGE,
	KNOCKBACK,
	ATTACK_TOWER
}

enum ENEMY {
	GOBLIN,
	GOBLINBOW,
	WOLF,
	TOTAL,
}

global.enemys = ds_map_create()

global.enemys[? ENEMY.GOBLIN] = obj_enemy_goblin
global.enemys[? ENEMY.GOBLINBOW] = obj_enemy_goblin_bow
global.enemys[? ENEMY.WOLF] = obj_enemy_wolf



global.p1 = noone
global.p2 = noone

global.coins = 0

function src_reset_player_status(){

}

function src_cam_shake(_val) {
	if instance_exists(obj_cam) {
		obj_cam.shake(_val)
	}
}

function src_gameover() {
	game_restart()
}