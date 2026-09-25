/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region Criação de Objetos ao Iniciar

if(!instance_exists(obj_player)){
	instance_create_depth(120,120,1,obj_player);
}

if(!instance_exists(obj_coin)){
	instance_create_depth(96,96,1,obj_coin);
}

if(!instance_exists(obj_c_shoot)){
	instance_create_depth(971,499,1,obj_c_shoot);
}

if(!instance_exists(obj_c_jump)){
	instance_create_depth(1177,654,1,obj_c_jump);
}

if(!instance_exists(obj_joystick)){
	instance_create_depth(170,556,1,obj_joystick);
}

#endregion

#region Controles

if(keyboard_check(vk_right) || keyboard_check(ord("D")) ){
	obj_player.right = true;
}
else if(keyboard_check(vk_left) || keyboard_check(ord("A"))){
	obj_player.left = true;	
}
if(keyboard_check(vk_space)){
	if(place_meeting(obj_player.x,obj_player.y+1,global.floor)){
		obj_player.jump = true;
	}
}
if(keyboard_check(vk_up) || keyboard_check(ord("W")) ){
	obj_player.up = true;
}

if(keyboard_check(vk_up) && keyboard_check(vk_right)){
	obj_player.diag_up = true;
}

if(keyboard_check(vk_up) && keyboard_check(vk_left)){
	obj_player.diag_up = true;
}

if(keyboard_check_pressed(ord("X"))){
	obj_player.shoot = true;
}

#endregion

#region Controles para Android

if(os_type == os_android){
    var _max_touches = 4; // Número máximo de toques simultâneos que você deseja detectar
    for (var _i = 0; _i < _max_touches; _i++) {
        var _mx = device_mouse_x_to_gui(_i);
        var _my = device_mouse_y_to_gui(_i);
        if (device_mouse_check_button(_i, mb_left)) {
            if (place_meeting(_mx, _my, obj_c_jump)) {
               if(place_meeting(obj_player.x,obj_player.y+1,global.floor)){
					obj_player.jump = true;
	}
			}
        }
		if(device_mouse_check_button_pressed(_i,mb_left)){
			if(place_meeting(_mx, _my, obj_c_shoot)) {
                obj_player.shoot = true;
            }
		}
    }
}if(os_type == os_android){
    var _max_touches = 4; // Número máximo de toques simultâneos que você deseja detectar
    for (var _i = 0; _i < _max_touches; _i++) {
        var _mx = device_mouse_x_to_gui(_i);
        var _my = device_mouse_y_to_gui(_i);
        if (device_mouse_check_button(_i, mb_left)) {
            if (place_meeting(_mx, _my, obj_c_jump)) {
               if(place_meeting(obj_player.x,obj_player.y+1,global.floor)){
					obj_player.jump = true;
	}
			}
        }
		if(device_mouse_check_button_pressed(_i,mb_left)){
			if(place_meeting(_mx, _my, obj_c_shoot)) {
                obj_player.shoot = true;
            }
		}
    }
}

#endregion

#endregion