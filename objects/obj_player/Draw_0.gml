/*

// SOMBRA NO CHÃO

shader_set(shd_player_shadow);

draw_sprite_ext(
    sprite_index,
    image_index,
    x + global.shadow_x,
    y + global.shadow_y,
    image_xscale * global.shadow_scale_x,
    image_yscale * global.shadow_scale_y,
    0,
    c_white,
    1
);

shader_reset();
*/


// PLAYER

draw_self();


// TILE SECRET

shader_set(shd_secret_alpha);

var _alpha = shader_get_uniform(shd_secret_alpha, "u_alpha");

shader_set_uniform_f(
    _alpha,
    global.secret_alpha
);

draw_tilemap(
    global.secret_tilemap,
    tilemap_get_x(global.secret_tilemap),
    tilemap_get_y(global.secret_tilemap)
);

shader_reset();