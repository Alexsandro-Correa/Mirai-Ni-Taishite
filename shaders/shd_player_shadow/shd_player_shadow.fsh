varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 _tex = texture2D(gm_BaseTexture, v_vTexcoord);

    gl_FragColor = vec4(
        0.0,
        0.0,
        0.0,
        _tex.a * 0.35
    );
}