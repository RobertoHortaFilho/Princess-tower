/// @description Insert description here
// You can write your code in this editor


image_xscale = lerp(image_xscale, 1, .4)
image_yscale = lerp(image_yscale, 1, .4)


if x < 0 or x > room_width or y < 0 or y > room_height {
	instance_destroy()
}
