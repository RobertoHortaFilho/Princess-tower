// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Spawner(_qtd, _max = 10) constructor {
		self.qtd = _qtd
		self.max_enemys = _max
		self.in_game = 0
		self.delay = 20
		self.pass = false
		
		self.reload_in_game = function() {
			self.in_game = instance_number(obj_enemy_body)
			if (self.qtd <= 0 and self.in_game == 0) {
				self.pass = true
			}
		}
		
		self.create_enemy = function(_obj) {
			// 1 = right 2 = top 3 = left 4 = botton 
			var _choice = choose(1,2,3,4)
			var _xx, _yy
			if _choice == 1 or _choice == 3 {
				//side 
				_yy = irandom_range(0, room_height)
				_xx = _choice == 1 ? room_width + 40 : -40
			} else {
				//top / botton
				_xx = irandom_range(0, room_width)
				_yy = _choice == 4 ? room_height + 40 : -40 
			
			}
			instance_create_layer(_xx, _yy, "enemys", _obj)
			instance_create_layer(_xx, _yy, "effects", obj_effect_danger)
			self.qtd --;
		}
		
		self.spawn_new_enemys = function() {
			self.reload_in_game()
			if self.in_game < self.max_enemys and self.qtd > 0 {
				self.create_enemy(obj_enemy_goblin_bow)
			}
		}	
}
	

function src_get_all_maps () {
	return [
	[1, 10],
	[2, 10],
	[10, 4],
	[3, 10],
	[2, 10],
	]
}