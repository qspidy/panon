// vim: set ft=glsl:
// gravity property: North (1), West (4), East (3), South (2)

layout(location=0) out vec4 out_Color;
layout(location=0) in mediump vec2 qt_TexCoord0;
layout(std140, binding = 0) uniform buf_foot {
    // vim: set ft=glsl:
    // gravity property: North (1), West (4), East (3), South (2)
    int coord_gravity;
    float qt_Opacity;
    bool coord_inversion;
};

vec2 getCoord() {
    switch(coord_gravity) {
    case 1:
        return vec2(coord_inversion?(1-qt_TexCoord0.x): qt_TexCoord0.x,1-qt_TexCoord0.y);
    case 2:
        return vec2(coord_inversion?(1-qt_TexCoord0.x):qt_TexCoord0.x,qt_TexCoord0.y);
    case 3:
        return vec2(coord_inversion?qt_TexCoord0.y:(1-qt_TexCoord0.y),1-qt_TexCoord0.x);
    case 4:
        return vec2(coord_inversion?qt_TexCoord0.y:(1-qt_TexCoord0.y),qt_TexCoord0.x);
    }
}

void main() {
    mainImage( out_Color,floor(getCoord()*iResolution.xy) );
}
