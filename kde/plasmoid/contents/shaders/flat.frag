uniform sampler2D tex1;
in mediump vec2 qt_TexCoord0;
out vec4 out_Color;

void main()
{
    vec4 sample1= texture(tex1, vec2(qt_TexCoord0.x,0.5)) ;
    float h=qt_TexCoord0.y;
    vec3 rgb=getRGB(qt_TexCoord0.x);

    out_Color=vec4(0.001,0.001,0.001,0.001);
    float r=0.5;
    float a=1.;
    float max_=.5+sample1.r*r;
    float min_=.5-sample1.g*r;
    if(min_<=h && h <=max_)
        out_Color=vec4(rgb*a,a);
}