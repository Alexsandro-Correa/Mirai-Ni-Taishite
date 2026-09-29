/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();
spd = 5;

if(life == 0){
	biker_death = true;
	exit;
}

if(biker_death == true){
	sprite_index = spr_biker_death;
	if (image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
}

}else{
	if(instance_exists(obj_player)){
	player_detected_y = abs(obj_player.y - y);
	player_detected_x = abs(obj_player.x - x);
	//show_debug_message("Alien Y" + string(y));
	//show_debug_message("Player y" + string(obj_player.y));
}

if(player_detected_x < 128 && player_detected_y < 60){
	sprite_index = spr_biker_atk;
	//show_debug_message("Parou")
}else {
	if(dir == 1){
		image_xscale = 1
	}else{
		image_xscale = -1;
	}
	sprite_index = spr_biker_walk;
	//show_debug_message("Andou")
	}
}