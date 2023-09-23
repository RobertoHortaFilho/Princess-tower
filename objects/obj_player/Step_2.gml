/// @description Collision

function move() {
	// horizontal
	while (place_meeting(x + hspd, y, obj_wall)) {
		if (!place_meeting( x + sign(hspd), y, obj_wall)) {
			x += sign(hspd)
		} else {
			hspd = 0
		}
	}
	x += hspd
	// vertical
	while (place_meeting(x, y + vspd, obj_wall)) {
		if (!place_meeting( x, y + sign(vspd), obj_wall)) {
			y += sign(vspd)
		} else {
			vspd = 0
		}
	}
	y += vspd

}

if state == STATES.RUN {
	move()
}




