/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(obj_boss_alien.state == obj_boss_alien.attack){
	mp_potential_step(obj_player.x,obj_player.y,0,false);
}

image_angle = _direction;

if(instance_place(x,y,obj_player)){
	if(obj_player.immunity == false){
		obj_player.damage = true;
	}
}

if(instance_place(x,y,all) && !instance_place(x,y,obj_boss_area) && !instance_place(x,y,obj_enemy_alien)){
	instance_destroy();
}

if(place_meeting(x,y,global.floor)){
	instance_destroy();
}