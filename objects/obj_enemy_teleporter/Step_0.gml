
event_inherited();

if(dir == 1){
	if(!place_meeting(x+8,y-2,global.floor)){
		spd = spd*-1;
	}
}
	
if(dir == -1){
	if(!place_meeting(x-8,y-2,global.floor)){
		spd = spd*-1;
	}
}
