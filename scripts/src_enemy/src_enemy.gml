// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function src_enemy_damage_by_colision(){
	if instance_exists(obj_player) {
		var _colision_player = instance_place(x, y, obj_player)
		if _colision_player {
			with _colision_player {
				_colision_player.take_damage()
			}
		}
	}
}

function src_enemy_move_and_colider() {
	if !place_meeting( x + hspd, y ,obj_enemy_wall) {
		x += hspd
	}
	if !place_meeting( x, y + vspd, obj_enemy_wall) {
		y += vspd
	}
}