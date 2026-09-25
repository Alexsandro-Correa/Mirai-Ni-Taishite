// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function camera_shake(power, duration)
{
    if (instance_exists(obj_camera_controller))
    {
        with (obj_camera_controller)
        {
            shake_amount = power;
            shake_time = duration;
        }
    }
}