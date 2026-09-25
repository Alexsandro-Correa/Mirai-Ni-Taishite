/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

instance_deactivate_all(true);
instance_activate_object(obj_menu);

if (!variable_global_exists("game_paused"))
{
    global.game_paused = false;
}

is_pause = global.game_paused;

// Estruturas do Menu

if (is_pause)
{
    option1 = {
    text: "Continuar",
    action : function(_self){
	global.game_paused = false;
	instance_activate_all(); // reativa tudo
	instance_destroy(_self); // fecha menu
       
        instance_destroy(_self);
    }
	
}
}
else
{
    option1 = {
        text: "Jogar",
        action : function(){
            room_goto(rm_01);
        }
    }
}

option2 = {
	text: "Controles",
	action : function(){
		show_message("Falta Criar");
	}
}

option3 = {
	text: "Configurações",
	action : function(){
		show_message("Falta Criar");
	}
}

option4 = {
	text: "Créditos",
	action : function(){
		show_message("Falta Criar");
	}
}

option5 = {
	text: "Sair",
	action : function(){
		game_end();
	}
}



// Menu
menu = [option1,option2,option3,option4,option5];


//  Variável para saber o índice atual

current = 0;


// Margem do menu

margin = 0;















