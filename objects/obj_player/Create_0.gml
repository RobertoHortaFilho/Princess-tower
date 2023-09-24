/// @description 

keys = {
	up: vk_up,
	down: vk_down,
	left: vk_left,
	right: vk_right,
	shoot: mb_left
}

sprites = {
	idle: spr_p1_idle,
	walk: spr_p1_walk,
	damage: spr_p1_damage,
	dead: spr_p1_dead,
}

number = 1
state = STATES.IDLE


life = 10
spd = 1
hspd = 0
vspd = 0
atkspd = 30
dmg = 1

imunity_timer = 0
life_animation = false
y_scale = 1
x_scale = 1
side = 1

gun_position = {
	x: x, 
	y: y,
	angle: 0,
	side: 1,
}

gun_recoil = {
	position: 0,
	scale: 1,
}

function move_gun_mouse() {
	var _distance = 6
	var _point_x = mouse_x
	var _point_y = mouse_y
	var _point_x_start = x
	var _point_y_start = y
	var _direction = point_direction(_point_x_start, _point_y_start, _point_x, _point_y)
	gun_position.x = x + lengthdir_x(_distance, _direction)
	gun_position.y = y - 5 + lengthdir_y(_distance, _direction)
	gun_position.angle = _direction
	if _direction < 90 or _direction > 270 {
		gun_position.side = 1
	} else {
		gun_position.side = -1
	}
}

function shoot() {
	if alarm[0] == -1 {
		alarm[0] = atkspd
		// create shoot
		var _bullet = instance_create_layer(gun_position.x, gun_position.y + gun_recoil.position, "bullets", obj_player_bullete, {
			direction: gun_position.angle,
			dmg: dmg,
		})
		gun_recoil.position = -3
		gun_recoil.scale = 1.3
		src_cam_shake(1)
	}
}

function levar_dano() {
	if (imunity_timer <= 0 and state != STATES.DEATH) {
		life -= 1
		// visual
		life_animation = true
		imunity_timer = game_get_speed(gamespeed_fps)
		x_scale = 1.5
		y_scale = .7
		src_cam_shake(3)
	}
}


take_damage = levar_dano
