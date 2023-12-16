/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
dir = 1;
diag = false;

if(obj_player.sprite_index == spr_player || obj_player.sprite_index == spr_player_damaged){
y = obj_player.y-2;

if(obj_player.image_xscale == -1){
	x = x -70;
}else{
x = x +70;
}
}

if(obj_player.sprite_index == spr_player_diag){
	y = obj_player.y+4;
	
if(obj_player.image_xscale == -1){
	x = x -70;
}else{
x = x +70;
}
	
}

alarm[0] = 120;

