key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);
   
move = key_left + key_right;
hsp += move * movespeed;
hsp = clamp(hsp, -maxspeed, maxspeed);
if (vsp < 10) {
	currentgrav += 0.1;
	currentgrav = clamp(currentgrav, 0, maxgrav);
	vsp += currentgrav;	
}


if (place_meeting(x, y+1, obj_collidable))
{	
	currentgrav = 0;
	vsp = key_jump * -jumpspeed;
}
	
	
if (place_meeting(x + hsp, y, obj_collidable)) {
	while(!place_meeting(x+sign(hsp), y, obj_collidable))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
	
if (place_meeting(x, y + vsp, obj_collidable)) {
	while(!place_meeting(x, y + sign(vsp), obj_collidable))
	{
		y += sign(vsp);
	}
	vsp = 0;
}	

if (hsp > 0 && key_right == 0)
	hsp -= movespeed;
if (hsp < 0 && key_left == 0)
	hsp += movespeed;
	
show_debug_message(vsp);
x += hsp;
y += vsp;

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], x - halfViewWidth, y - halfViewHeight);
