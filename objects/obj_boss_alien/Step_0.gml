/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(obj_boss_area.boss_battle){
var _player = instance_nearest(x, y, obj_player);
var _direction = point_direction(x, y, _player.x, _player.y-80);

if(x < obj_player.x){
	x++;
}

if(x > obj_player.x){
	x--;
}

if(place_meeting(x,y,obj_bullet)){
	life--;
	with(obj_bullet)instance_destroy();
}

if(life <= 0){
	instance_destroy(obj_boss_alien_attack);
	instance_destroy();
	obj_coin.coin +=50;
	obj_boss_area.boss_battle = false;
	room_goto(rm_02);
}

if(instance_exists(obj_boss_alien)){
	/*if(state == attack){
		var _obj_shoot = instance_create_depth(x,y+140,0,obj_boss_alien_attack);
		_obj_shoot.direction = _direction;
		_obj_shoot.speed = 8;
		state = choose(stopped,recoil);
	}*/if(state == attack){
    var _obj_shoot = instance_create_depth(x, y + 140, 0, obj_boss_alien_attack);
    
	if(first_attack_direction == noone){
		if(x < obj_player.x){
				first_attack_direction = pth_atk_boss_alien_dir;
			}else{
				first_attack_direction = pth_atk_boss_alien_lft;
			}
	}
 
    with (_obj_shoot) {
		path_start(other.first_attack_direction, 8, path_action_restart, false);
		}
  
    
		state = choose(stopped, recoil);
	}else if(state == stopped){
		show_debug_message("Parado");
	}else if(state == recoil){
	/*if(x < xstart){
		x+=4;
	}else if(x > xstart){
		x-=4;
	}
	
	if(y < ystart){
		y+=4;
	}else if(y > ystart){
		y-=4;
	}*/
	}
	}
}


