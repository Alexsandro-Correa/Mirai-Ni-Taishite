/// STEP - obj_camera_controller

if (!instance_exists(target))
{
    target = instance_find(obj_player, 0);
    if (!instance_exists(target)) exit;
}

var cam = view_camera[0];
if (cam == noone) exit;

// ================= BASE ORIGINAL =================

var cam_w = camera_get_view_width(cam);
var cam_y = base_cam_y;
var target_x = target.x - cam_w / 2;

// Boss area
if (instance_exists(obj_boss_area))
{
    var area = instance_find(obj_boss_area, 0);
    if (area.boss_battle)
        target_x = room_width - cam_w;
}

target_x = clamp(target_x, 0, room_width - cam_w);

// ================= SHAKE =================

  if (instance_exists(obj_boss_area)){

var final_x = target_x;
var final_y = cam_y;

if (shake_time > 0)
{
    shake_time--;

    final_x += random_range(-shake_amount, shake_amount);
    final_y += random_range(-shake_amount, shake_amount);
}
// ================= APLICAR =================

camera_set_view_pos(cam, final_x, final_y);
  }