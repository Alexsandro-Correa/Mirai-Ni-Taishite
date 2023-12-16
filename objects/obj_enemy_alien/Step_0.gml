/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(floating == false && !place_meeting(x,y-1, global.floor)){
	y+=0.5;
}

if(place_meeting(x,y-1, global.floor)){
	floating = true;
}

if(floating){
	fl+=0.2;
	y-=0.5;
	if(fl >= max_fl){
		floating = false;
		fl = 0;
	}
}

if(dir == 1){
	if(!place_meeting(x+1,y-2,global.floor) && place_meeting(x+32,y+30,global.floor)){
		x+=2;
	}else{
		dir=-1;
		image_xscale = -1;
	}
}


if(dir == -1){
	if(!place_meeting(x-1,y-2,global.floor) && place_meeting(x-32,y+30,global.floor)){
		x-=2;
	}else{
		dir=1;
		image_xscale = 1;
	}
}

var _collision = instance_place(x,y,obj_bullet)

if(_collision){
	with(_collision)instance_destroy();
	life--;
	if(life == 0){
		audio_play_sound(snd_alien,1,false);
		instance_destroy();
		instance_create_layer(x, y-36, 1, obj_explosion);
		obj_coin.coin +=5;
		
		
	}

}




