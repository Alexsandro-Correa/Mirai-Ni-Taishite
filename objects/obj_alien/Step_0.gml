/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event

if(instance_exists(obj_player)){
	player_detected_y = abs(obj_player.y - y);
	player_detected_x = abs(obj_player.x - x);
}

if(player_detected_x < 400 && player_detected_y < 60){
	if(instance_exists(obj_player)){
		if(x < obj_player.x){
			image_xscale = 1;
		}else{
			image_xscale = -1;
		}
	}
	sprite_index = spr_alien_shot;
	show_debug_message("Parou")
}else {
	if(dir = 1){
		image_xscale = 1
	}else{
		image_xscale = -1;
	}
	event_inherited();
	sprite_index = spr_alien_walk;
	show_debug_message("Andou")
}

