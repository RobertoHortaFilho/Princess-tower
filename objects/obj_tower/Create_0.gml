/// @description Insert description here
// You can write your code in this editor
depth = -y

life = 2
state = STATES.IDLE
angle = 0
angle_variance = 0


function take_damage(_val = 1) {
	if life >= 0 {
		life -= _val
		src_cam_shake(4)
		angle_variance = 10
		if life <= 0 { state = STATES.DEATH; alarm[0] = 60}
	}
}