/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

image_speed = 1;



if(!instance_exists(obj_chandelier) && spawn_chest == false){
	instance_create_layer(2100,640,"Instances",obj_chest);
	spawn_chest = true;
	audio_play_sound(snd_itemfind,1,false);
}




