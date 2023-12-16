/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


life = 3;
damage = false;
immunity = false;
stopped = false;

left = false;
right = false;
up = false;
shoot = false;

spd = 4;
spd_jump = 6;
grvt = 0.2;
spd_fall = 2;
max_spd_fall = 8;

jump = false;

jump_height = 192;
jump_frames = 0;

test = 10;

spawn_boss = 0;

global.game_paused = false;

global.floor = [layer_tilemap_get_id("tile_floor")];

//show_debug_log(true);

//var _jump = ref_create(id,"jump_height");

//dbg_slider(_jump,0,192,"Altura");

//Exemplo uso debug
// variable_instance_set obj_player variável_pulo