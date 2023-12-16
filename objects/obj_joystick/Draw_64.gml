/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if(os_type == os_android){
	var _x1 = 130;
var _y1 = 640;
var _scale = 1;

var _sprite_size = sprite_get_width(spr_analog_circle);



var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);
var _mouse_in = point_in_circle(_mouse_x,_mouse_y,_x1,_y1,_sprite_size/2* _scale);
var _mouse_click = mouse_check_button(mb_left);
var _x2 = lengthdir_x(vel,dir);
var _y2 = lengthdir_y(vel,dir);


if(_mouse_in){
	if(_mouse_click){
		make = true;
		vel = point_distance(_x1,_y1,_mouse_x,_mouse_y);
		dir = point_direction(_x1,_y1,_mouse_x,_mouse_y);
		
		show_debug_message(vel);
		show_debug_message(dir);
	}
}

if(!_mouse_click){
	make = false;
	vel = lerp(vel,0,.1);
	dir = 0;
}

draw_sprite_ext(spr_analog_circle,0,_x1,_y1,_scale,_scale,0,c_white,.2);
draw_sprite_ext(spr_analog_stick,0,_x1 + _x2,_y1 + _y2,_scale,_scale,0,c_white,.8);

if(dir < 30 && dir > 0 ||  dir > 330){
	obj_player.right = true;
}else if(dir >= 30 && dir <= 60 ){
	obj_player.right = true;
	obj_player.up = true;
}else if(dir >= 60 && dir < 120){
	//Configurar sprite pra cima quando tiver
	obj_player.up = true;
}else if(dir >= 120 && dir < 150){
	obj_player.left = true;
	obj_player.up = true;
}else if(dir >= 150 && dir < 210){
	obj_player.left = true;
}
	
}

















