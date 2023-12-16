/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(obj_player.sprite_index == spr_player || obj_player.sprite_index == spr_player_damaged){
	y = obj_player.y -3; 
	if(dir == 1){
		x = obj_player.x +45;
	}else if(dir == -1){
		x = obj_player.x - 45;
	}
}else if(obj_player.sprite_index == spr_player_diag || obj_player.sprite_index == spr_player_diag_damaged){
	y = obj_player.y -18; 
	if(dir == 1){
		x = obj_player.x +45
		image_angle = +30;
	}else if(dir == -1){
		x = obj_player.x - 45;
		image_angle = -30;
	}
}




