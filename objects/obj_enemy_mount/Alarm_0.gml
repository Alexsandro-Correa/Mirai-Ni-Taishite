/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _bullet_x;

if (self.image_xscale == 1) {
    _bullet_x = x + 35;
} else {
    _bullet_x = x - 35;
}

// Cria o projétil e passa a direção correta
var _bullet = instance_create_depth(_bullet_x, y-16, 0, obj_enemy_bullet);
_bullet.dir = self.image_xscale; // Passa a direção baseada no xscale do inimigor _obj = instance_create_depth(x+100,y,0,obj_enemy_bullet);


alarm[0] = 120;