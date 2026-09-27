/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(spd < max_spd){
	spd = max_spd;
}

if(!place_meeting(x,y-1, global.floor)){
	y+=0.5;
}


if (dir == 1) {
    if (place_meeting(bbox_right + sprite_width/2, bbox_bottom , global.floor) 
	&& !place_meeting(x + 4,y-2,global.floor)) {
        x += self.spd;
    } else {
        dir = -1;
        image_xscale = -1;
    }
}

if (dir == -1) {
    if (place_meeting(bbox_left + sprite_width/2, bbox_bottom , global.floor)
	&& !place_meeting(x - 4,y-2,global.floor)) {
        x -= self.spd;
    } else {
        dir = 1;
        image_xscale = 1;
    }
}




var _collision = instance_place(x,y,obj_bullet)

if(_collision){
	with(_collision)instance_destroy();
	life--;
	if(life == 0){
		audio_play_sound(snd_alien,1,false);
		alarm[0] = 55;	
		
	}

}




