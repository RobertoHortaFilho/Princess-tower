// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Gamepad() constructor {
	static _noone = -4
	self.g1 = _noone
	self.g2 = _noone
	self.socket1_in_use = false
	self.socket2_in_use = false
	self.deadzone = 0.25
	
	self.load_gamepad = function () {
		self.g1 = _noone
		self.g2 = _noone
		self.socket1_in_use = false
		self.socket2_in_use = false
		var _maxgamepad = gamepad_get_device_count()
		for (var _i = 0; _i < _maxgamepad; _i++) {
			if gamepad_is_connected(_i) {
				if self.g1 == noone { self.g1 = _i; self.socket1_in_use = true}
				else if self.g2 == noone { self.g2 = _i; self.socket2_in_use = true}
			}
		}
		self.set_deadzone()
	}
	
	self.set_deadzone = function () {
		if self.g1 != noone { gamepad_set_axis_deadzone(self.g1, self.deadzone) }
		if self.g2 != noone { gamepad_set_axis_deadzone(self.g2, self.deadzone) }
	}
	
	self.who_is_disconnected = function () {
		if !gamepad_is_connected(self.g1) and self.socket1_in_use {
			return 1
		} else if ! gamepad_is_connected(self.g2) and self.socket2_in_use {
			return 2
		}
		return 0
	}
	
	self.controllers_numbers = function () {
		if self.g2 != noone {
			return 2
		}
		if self.g1 != noone {
			return 1
		}
		return 0
	}
	
	//menu
	static click_confirm = function (_gp) {
		if _gp == noone return false;
		return gamepad_button_check_pressed(_gp, gp_face1)
	}
	static click_return = function (_gp) {
		if _gp == noone return false;
		return gamepad_button_check_pressed(_gp, gp_face2)
	}
	static click_up = function (_gp) {
		if _gp == noone return false;
		return ((gamepad_axis_value(_gp, gp_axislv) < -self.deadzone) || gamepad_button_check_pressed(_gp, gp_padu))
	}
	static click_down = function (_gp) {
		if _gp == noone return false;
		return  ((gamepad_axis_value(_gp, gp_axislv) > self.deadzone) || gamepad_button_check_pressed(_gp, gp_padd))
	}
	
	//player
	
	static on_press_up = function (_gp) {
		if _gp == noone return false;
		return (gamepad_axis_value(_gp, gp_axislv) < -self.deadzone)
	}
	static on_press_down = function (_gp) {
		if _gp == noone return false;
		return (gamepad_axis_value(_gp, gp_axislv) > self.deadzone)
	}
	static on_press_right = function (_gp) {
		if _gp == noone return false;
		return (gamepad_axis_value(_gp, gp_axislh) > self.deadzone)
	}
	static on_press_left = function (_gp) {
		if _gp == noone return false;
		return (gamepad_axis_value(_gp, gp_axislh) < -self.deadzone)
	}
	
	static aim_v = function(_gp) {
		if _gp == noone return false;
		return gamepad_axis_value(_gp, gp_axisrv)
	}
	static aim_h = function(_gp) {
		if _gp == noone return false;
		return gamepad_axis_value(_gp, gp_axisrh)
	}
	static shooting = function(_gp) {
		if _gp == noone return false;
		return gamepad_button_check(_gp, gp_shoulderrb)
	}
}

global.gamepad = new Gamepad()
global.gamepad.load_gamepad()
