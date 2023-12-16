/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


x+=8*dir;

if(place_meeting(x,y,global.floor)){
	instance_destroy();
}

if(diag){
	y-=3;
}