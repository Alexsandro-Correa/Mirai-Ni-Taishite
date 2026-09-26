/// STEP - obj_player

#region INPUT Controles

key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
key_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

shoot = keyboard_check_pressed(ord("X"));

left  = key_left;
right = key_right;
aim_up = key_up;
down  = key_down;

#endregion

if (global.game_paused) exit;

#region PAUSE

if (keyboard_check_pressed(vk_escape) && !global.game_paused)
{
    global.game_paused = true;
    instance_create_layer(0, 0, "Instances", obj_menu);
}

#endregion



#region CAMERA E BOSS

var cam = view_camera[0];

if (cam != noone)
{
    var cam_w = camera_get_view_width(cam);
    var cam_y = camera_get_view_y(cam);
    var target_x = x - cam_w / 2;

    if (instance_exists(obj_boss_area))
    {
        var area = instance_find(obj_boss_area, 0);
        if (area.boss_battle)
            target_x = room_width - cam_w;
    }

    target_x = clamp(target_x, 0, room_width - cam_w);
    camera_set_view_pos(cam, target_x, cam_y);
}

#endregion



#region MOVIMENTO TILEMAP

// ================= VERTICAL (chão primeiro pra usar no lying) =================

var on_ground =
    tilemap_get_at_pixel(global.floor, bbox_left + 4, bbox_bottom + 1) != 0 ||
    tilemap_get_at_pixel(global.floor, bbox_right - 4, bbox_bottom + 1) != 0;

var want_lie = down && on_ground;

if (want_lie && !lying)
{
    lying = true;
}
else if (!want_lie && lying)
{
    lying = false;
}



// ================= HORIZONTAL =================

var move = 0;

if (!lying)
{
    move = right - left;
}

var hsp = move * spd;

if (hsp != 0)
{
    var side = sign(hsp);
    var check_x = (side > 0) ? bbox_right + hsp : bbox_left + hsp;

    var top_check =
        tilemap_get_at_pixel(global.floor, check_x, bbox_top + 4);

    var bottom_check =
        tilemap_get_at_pixel(global.floor, check_x, bbox_bottom - 4);

    if (top_check == 0 && bottom_check == 0)
    {
        x += hsp;
    }
    else
    {
        while (
            tilemap_get_at_pixel(global.floor,
                (side > 0 ? bbox_right + side : bbox_left + side),
                bbox_top + 4) == 0 &&
            tilemap_get_at_pixel(global.floor,
                (side > 0 ? bbox_right + side : bbox_left + side),
                bbox_bottom - 4) == 0
        )
        {
            x += side;
        }
    }
}



// ================= VERTICAL =================

if (keyboard_check_pressed(vk_space) && on_ground && !lying)
{
    spd_fall = -8;
}

spd_fall += grvt;

if (spd_fall > max_spd_fall)
    spd_fall = max_spd_fall;

if (spd_fall != 0)
{
    var dir = sign(spd_fall);

   if (spd_fall > 0) // caindo
{
    var left_check =
        tilemap_get_at_pixel(global.floor, bbox_left + 4, bbox_bottom + spd_fall);

    var right_check =
        tilemap_get_at_pixel(global.floor, bbox_right - 4, bbox_bottom + spd_fall);
}
else // subindo (batendo cabeça)
{
    var left_check =
        tilemap_get_at_pixel(global.floor, bbox_left + 4, bbox_top + spd_fall);

    var right_check =
        tilemap_get_at_pixel(global.floor, bbox_right - 4, bbox_top + spd_fall);
}

    if (left_check == 0 && right_check == 0)
    {
        y += spd_fall;
    }
    else
    {
        while (
            tilemap_get_at_pixel(global.floor, bbox_left + 4, bbox_bottom + dir) == 0 &&
            tilemap_get_at_pixel(global.floor, bbox_right - 4, bbox_bottom + dir) == 0 &&
			 tilemap_get_at_pixel(global.floor, bbox_left + 4, bbox_top + dir) == 0 &&
            tilemap_get_at_pixel(global.floor, bbox_right - 4, bbox_top + dir) == 0
        )
        {
            y += dir;
        }

        spd_fall = 0;
    }
}

#endregion



#region SPRITES

if (move != 0)
{
    image_xscale = sign(move);
    stopped = false;
}
else
{
    stopped = true;
}

var diag = (aim_up && (right || left));

// ================= PRIORIDADE =================

// 1️⃣ DEITADO
if (lying)
{
    image_speed = 0;
    image_index = 0;
    sprite_index = spr_player_fall;
}

// 2️⃣ RESTANTE DO SISTEMA
else
{
    if (stopped)
    {
        if (immunity)
        {
            image_speed = 2;

            if (diag)
                sprite_index = spr_player_diag_damaged;
            else
                sprite_index = spr_player_damaged;

            if (image_index > 1)
                image_index = 0;
        }
        else
        {
            image_speed = 0;
            image_index = 0;

            if (diag)
                sprite_index = spr_player_diag;
            else if (aim_up)
                sprite_index = spr_player_up;
            else
                sprite_index = spr_player;
        }
    }
    else
    {
        image_speed = 2;

        if (immunity)
        {
            if (diag)
                sprite_index = spr_player_diag_damaged;
            else
                sprite_index = spr_player_damaged;
        }
        else
        {
            if (diag)
                sprite_index = spr_player_diag;
            else
                sprite_index = spr_player;
        }
    }
}

#endregion



#region TIRO

if (shoot)
{
    audio_play_sound(snd_shoot1,1,false);
	
	var _dir_bullet = 0;
	

		if(image_xscale == -1){
			_dir_bullet = -45;
			show_debug_message("Right")
		}else{
			_dir_bullet = 45;
			show_debug_message("Left")
		}


    var _obj  = instance_create_depth(x + _dir_bullet,y - 43,-10,obj_bullet);
    var _obj2 = instance_create_depth(x,y + 43,-10,obj_splash_gun);

	
	if(instance_exists(obj_splash_gun)){
			if(image_xscale == -1){
				obj_bullet.image_xscale = -1;
			}else{
				obj_bullet.image_xscale = 1;
			}
	}
	

    if (lying)
    {
        _obj.diag = false;
        _obj.up = false;
        _obj.dir = image_xscale;
    }
    else if (diag)
    {
        _obj.diag = true;
        _obj.up = false;
        _obj.dir = image_xscale;
    }
    else if (aim_up)
    {
        _obj.diag = false;
        _obj.up = true;
        _obj.dir = 1;
    }
    else
    {
        _obj.diag = false;
        _obj.up = false;
        _obj.dir = image_xscale;
    }

    _obj2.dir = _obj.dir;
    _obj2.image_xscale = image_xscale;
}

#endregion



#region DANO

if (y > room_height)
    damage = true;

if (
    place_meeting(x,y,obj_enemy_alien) ||
    place_meeting(x,y,obj_boss_alien) ||
    place_meeting(x,y,obj_boss_alien_attack) ||
    place_meeting(x,y,obj_enemy_bullet) ||
    place_meeting(x,y,obj_father_base)
)
{
    if (!immunity)
        damage = true;
}

if (damage)
{
    life--;
    immunity = true;
    spd_fall = 2;
	camera_shake(8, 30); // treme a câmera quando toma dano

    x -= 150;
    y = 100;

    if (x < 0)
        x = 50;

    damage = false;
}

if (immunity && alarm[0] < 0)
{
    alarm[0] = room_speed * 3;
}

#endregion



if (life <= 0)
{
    room_restart();
}
