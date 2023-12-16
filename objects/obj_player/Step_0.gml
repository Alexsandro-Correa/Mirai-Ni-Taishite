/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//camera_set_view_pos(view_camera[0],x-view_wport[0]/2,y-view_hport[0]/2);
 
var _vx = camera_get_view_x(view_camera[1]);
var _vw = camera_get_view_width(view_camera[1]);
var _final_x = _vx + _vw;

if(keyboard_check_pressed(vk_escape)){
	global.game_paused = true;
	room_goto(rm_menu);
}

if(room = rm_01){

if(obj_boss_area.boss_battle){
	// view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_set_camera, -1, -1, 400, 250);
	view_set_camera(0,view_camera[1])
	if(x < _vx + 64){
		left = false;
	}
}else{
	view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player, -1, -1, 400, 250);
	
}

}

//Controllers



if(left && place_free(x-spd,y) && x > 36 && !place_meeting(x-4,y + spd_fall - 12,global.floor)){
	left = false;
	x-=spd;
	image_xscale = -1;
	stopped = false;
	image_speed = 2;
	if(up){
		up = false;
		if(immunity){
			sprite_index = spr_player_diag_damaged;
		}else{
			sprite_index = spr_player_diag;	
		}
	}else{
		if(immunity){
			sprite_index = spr_player_damaged;
		}else{
			sprite_index = spr_player;
		}
	}
}else if(right  && place_free(x+spd,y) && x < room_width-36 && !place_meeting(x+4,y + spd_fall -12,global.floor)){
	right = false;
	x+=spd;
	image_xscale = 1;
	stopped = false;
	image_speed = 2;
	if(up){
		up = false;
		if(immunity){
			sprite_index = spr_player_diag_damaged;
		}else{
			sprite_index = spr_player_diag;	
		}
	}else{
		if(immunity){
			sprite_index = spr_player_damaged;
		}else{
			sprite_index = spr_player;
		}
	}
}else{
	stopped = true;
}

if(shoot){
	shoot = false;
	audio_play_sound(snd_shoot1,1,false);
	var _obj = instance_create_depth(x,y,-10,obj_bullet);
	var _obj2 = instance_create_depth(x,y,-10,obj_splash_gun);
	_obj2.y = y-3;
	if(sprite_index = spr_player_diag || sprite_index == spr_player_diag_damaged){
		_obj.diag = true;
		_obj.y = y-20;
		if(image_xscale = 1){
			_obj.x = x+56;
			_obj.image_angle = 30;
		}else{
			_obj.x = x-56;
			_obj.image_angle = -30;
		}
		
		
	}
	_obj.dir = image_xscale;
	_obj.image_xscale = image_xscale;
	_obj2.dir = image_xscale;
	_obj2.image_xscale = image_xscale;
	
}

if(stopped){
	if(immunity && !up){
		image_speed = 2;
		sprite_index = spr_player_damaged;
		if(image_index > 1 ){
			image_index = 0;
		}
	}else if(immunity && up){
		up = false;
		image_speed = 2;
		sprite_index = spr_player_diag_damaged;
		if(image_index > 1 ){
			image_index = 0;
		}
	}else if(!immunity && up){
		up = false;
		image_speed = 0;
		sprite_index = spr_player_diag;
		image_index = 0;
	}else{
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_player;		
	}
}

if(jump){
	spd_fall = 2;
	image_index = 1;
	if(jump_frames < jump_height){
		if(!place_meeting(x,y+spd_fall - 12 ,global.floor)){
			jump_frames+=spd_jump;
			y-=spd_jump;
		}else{
			jump = false;
			jump_frames = 0;
		}
	}else{
		jump = false;
		jump_frames = 0;
	}
}

//Queda
if(jump == false){
	spd_fall += grvt;
    if(!place_meeting(x, y + max_spd_fall +5, global.floor)){
        image_index = 1;
        y += spd_fall;
    } else {
        while(!place_meeting(x, y + 1, global.floor)){
            y += 1;
        }
        spd_fall = 0;
    }
}



//--------------------------------

//Android
// No evento Step do objeto player
if(os_type == os_android){
    var _max_touches = 4; // Número máximo de toques simultâneos que você deseja detectar
    for (var _i = 0; _i < _max_touches; _i++) {
        var _mx = device_mouse_x_to_gui(_i);
        var _my = device_mouse_y_to_gui(_i);
        if (device_mouse_check_button(_i, mb_left)) {
            if (place_meeting(_mx, _my, obj_c_jump)) {
                if(!place_free(x,y+1)){
					jump = true;
				}
			}
        }
		if(device_mouse_check_button_pressed(_i,mb_left)){
			if(place_meeting(_mx, _my, obj_c_shoot)) {
                shoot = true;
            }
		}
    }
}

//------------


if(damage){
	//life--;
	immunity = true;
	spd_fall = 2;
	x = x-150;
	y = 100;
	if(x < 0){
		x = 50;
	}
	
	if(instance_exists(obj_boss_area)){
		if(obj_boss_area.boss_battle == true){
			x = _vx + 20;
		}
	}
	damage = false;
}

if(keyboard_check(vk_right)){
	right = true;
}
else if(keyboard_check(vk_left)){
	left = true;	
}
if(keyboard_check(vk_space)){
	if(place_meeting(x,y+1,global.floor)){
		jump = true;
	}
}
if(keyboard_check(vk_up)){
	up = true;
}
if(keyboard_check_pressed(ord("X"))){
	shoot = true;
}

if(immunity){
	if( alarm[0] < 0){
		alarm[0] = 60*5;
	}
}

if( y > room_height){
	damage = true;
}

if(place_meeting(x,y,obj_enemy_alien) || place_meeting(x,y,obj_boss_alien) || place_meeting(x,y,obj_boss_alien_attack) ){
	if(immunity == false){
		damage = true;
	}
}


if(life == 0){
		room_restart();
	}

//Sitema para salvar jogo
if(keyboard_check(ord("S"))){
	game_save("save1.dat");
}

if(keyboard_check(ord("C"))){
	game_load("save1.dat");
}

if(room == rm_02){
	if(!instance_exists(obj_enemy_alien)){
		room_goto(rm_01);
	}
}
