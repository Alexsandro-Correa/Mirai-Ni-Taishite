/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

half_h = sprite_height / 2;

scr_collisions();

lying = false;



#region Status do Player

life = 3;
damage = false;
immunity = false;
stopped = false;

#endregion

#region Comandos

left = false;
right = false;
up = false;
down = false;
diag_up = false;
diag_down = false;
shoot = false;

#endregion

#region Velocidade e Pulo

spd = 4;
spd_jump = 6;
grvt = 0.2;
spd_fall = 2;
max_spd_fall = 8;

jump = false;


#endregion

#region Spawn Boss

spawn_boss = 0;

#endregion



//show_debug_log(true);

//var _jump = ref_create(id,"jump_height");

//dbg_slider(_jump,0,192,"Altura");

//Exemplo uso debug
// variable_instance_set obj_player variável_pulo