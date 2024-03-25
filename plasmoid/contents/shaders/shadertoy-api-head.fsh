// vim: set ft=glsl:

layout(std140, binding = 0) uniform buf_head {
    vec3      iResolution;           // viewport resolution (in pixels)
    float     iTime;                 // shader playback time (in seconds)
    float     iTimeDelta;            // render time (in seconds)
    float     iBeat;                // Is this frame a beat? (provided by aubio)
    int       iFrame;                // shader playback frame
    //uniform float     iChannelTime[4];       // channel playback time (in seconds)
#define iChannelTime (float[4](iTime,iTime,iTime,iTime))
    vec3      iChannelResolution0; // channel resolution (in pixels)
    vec3      iChannelResolution1; // channel resolution (in pixels)
    vec3      iChannelResolution2; // channel resolution (in pixels)
    vec3      iChannelResolution3; // channel resolution (in pixels)
#define iChannelResolution (vec3[4](iChannelResolution0,iChannelResolution1,iChannelResolution2,iChannelResolution3))
    vec4      iMouse;                // mouse pixel coords. xy: current (if MLB down), zw: click
    //uniform vec4      iDate;                 // (year, month, day, time in seconds)
#define iDate vec4(0,0,0,0)
    //uniform float     iSampleRate;           // sound sample rate (i.e., 44100)
#define iSampleRate 44100
};
layout(set = 0, binding = 0) uniform sampler2D iChannel0;          // input channel. XX = 2D/Cube
layout(set = 0, binding = 1) uniform sampler2D iChannel1;          // input channel. XX = 2D/Cube
layout(set = 0, binding = 2) uniform sampler2D iChannel2;          // input channel. XX = 2D/Cube
layout(set = 0, binding = 3) uniform sampler2D iChannel3;          // input channel. XX = 2D/Cube



