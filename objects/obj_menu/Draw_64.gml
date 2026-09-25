
// ================= FUNDO =================

draw_sprite_stretched(
    spr_bkg_winter,
    0,
    0,
    0,
    display_get_gui_width(),
    display_get_gui_height()
);

// ================= MENU =================

for (var _i = 0; _i < array_length(menu); _i++)
{
    var _color = c_black;
    var _margin = 0;

    if (_i == current)
    {
        _color = c_red;
        _margin = margin;
    }

    draw_set_color(_color);
    draw_set_font(fnt_1);
    draw_text(20 + _margin, 40 + 40 * _i, menu[_i].text);

    draw_set_color(c_white);
    draw_set_font(-1);
}
