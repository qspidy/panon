// vim: set ft=glsl:

layout(location=0) out vec4 out_Color;
layout(location=0) in mediump vec2 qt_TexCoord0;

vec2 getCoord() {
    return qt_TexCoord0;
}

void main() {
    mainImage( out_Color,floor(getCoord()*iResolution.xy) );
}
