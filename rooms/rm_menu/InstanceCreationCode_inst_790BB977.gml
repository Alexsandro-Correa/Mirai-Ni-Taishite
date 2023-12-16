action = function(){
	global.game_paused = false;
	room_goto(rm_01);
	
	if(global.game_paused == false){
		text = "Continuar";
	}else{
		text = "Início";
}

	
}

