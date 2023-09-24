// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Spawner(_qtd, _max = 10) constructor {
		self.qtd = _qtd
		self.max_enemys = _max
		self.in_game = 0
		self.delay = 20
		
		self.reload_in_game = function() {
			self.in_game = instance_number(obj_enemy_body)
			if (self.qtd <= 0 and self.in_game == 0) {
				//show_message("passou")
			}
		}
		
		self.create_enemy = function(_obj) {
			// 1 = right 2 = top 3 = left 4 = botton 
			var _choice = choose(1,2,3,4)
			if _choice == 1 or _choice == 3 {
				//side 
				var _yy = irandom_range(0, room_height)
				var _xx = _choice == 1 ? room_width + 40 : -40
			} else {
				//top / botton
				var _xx = irandom_range(0, room_width)
				var _yy = _choice == 4 ? room_height + 40 : -40 
			
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