// Movimento horizontal

x += 8 * dir;


// Checa colisão com o chão (ou uma superfície onde o projétil deve ser destruído)
if (place_meeting(x, y, global.floor)) {
    instance_destroy();
}


