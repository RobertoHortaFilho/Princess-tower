/// @description Insert description here
// You can write your code in this editor

qtd_players = variable_global_exists("qtd_players") ? global.qtd_players : 1
global.p1 = noone
global.p2 = noone


if qtd_players == 1 {
	global.p1 = instance_create_depth(room_width / 2, room_height/4 * 3, 0,obj_player)
	if global.gamepad.g1 != noone { global.p1.gp = global.gamepad.g1 }
} else if qtd_players == 2 {
	global.p1 = instance_create_depth(room_width / 3, room_height/4, 0,obj_player)
	global.p2 = instance_create_depth((room_width / 3) * 2, room_height/4, 0,obj_player)
	if global.gamepad.controllers_numbers() == 2 {
	global.p1.gp = global.gamepad.g1
	global.p2.gp = global.gamepad.g2
	} else {
	global.p2.gp = global.gamepad.g1
	}
	
}


//global.spawner = new Spawner(15, 5)
//alarm[0] = 1





