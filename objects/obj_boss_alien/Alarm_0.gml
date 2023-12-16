/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(num_attack < max_attack){
	state = choose(attack);
	num_attack++;
	alarm[0] = 15;
}else{
	num_attack = 0;
	first_attack_direction = noone;
	alarm[0] = 180;
}






