

// Mudando de opção
// Descendo pelo menu

if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) ){
	current ++;
	//Zerando a margem
	margin = 0;
}

if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) ){
	current --;
	//Zerando a margem
	margin = 0;
}

// Verificando toques na tela
if (device_mouse_check_button_pressed(0, mb_left)) {
    var _touch_x = device_mouse_x(0);
    var _touch_y = device_mouse_y(0);

    for (var _i = 0; _i < array_length(menu); _i++) {
        var _option_y = 40 + 40 * _i;
        if (_touch_y > _option_y && _touch_y < _option_y + 40) {
            current = _i;
            menu[current].action(id);
            break;
        }
    }
}

// Limitando o menu
current = clamp(current, 0 , array_length(menu)-1);

// Executar opção

if(keyboard_check_pressed(vk_enter)){
	menu[current].action(id);
}

// fazendo o valor da margem aumentar

margin = lerp(margin, 20, .2);