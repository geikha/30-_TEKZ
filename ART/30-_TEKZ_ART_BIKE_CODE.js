// 30*_TEKZ_ART
// GEIKHA
// CC BY-NC-SA 4.0

await loadScript("https://hyper-hydra.glitch.me/hydra-canvas.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-outputs.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-src.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-arithmetics.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-colorspaces.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-convolutions.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-arrays.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-fractals.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-wrap.js")
await loadScript("https://hyper-hydra.glitch.me/hydra-text.js")
await loadScript("https://cdn.statically.io/gl/metagrowing/extra-shaders-for-hydra/main/lib/lib-noise.js")
await loadScript("https://cdn.statically.io/gl/metagrowing/extra-shaders-for-hydra/main/lib/lib-screen.js")

basePath = "http://localhost:2357/Projects/MOTO/"
s0.initImage(basePath+"color.png",{mag:'linear',min:'linear'})
s1.initImage(basePath+"depth0.png",{mag:'linear',min:'linear'})
s2.initImage(basePath+"code1.png",{mag:'linear',min:'linear'})

setResolution(3000,3000)
canvas.setRelativeSize(.333333333)
canvas.setAlign("right")

oS.setLinear()

setFunction({
    name: "rotate3D",
      type: "coord",
      inputs: [{ name: "angleX", type: "float", default: 0.0 },
             { name: "angleY", type: "float", default: 0.0 },
             { name: "angleZ", type: "float", default: 0.0 }
            ],
      glsl: `
        vec2 st = _st - 0.5;
        float z = 0.0;
        st.x *= resolution.x / resolution.y;
        vec3 uv = vec3(st, z);
        // apply X-axis rotation
        uv.yz = vec2(
            uv.y*cos(angleX) - uv.z*sin(angleX),
            uv.y*sin(angleX) + uv.z*cos(angleX)
        );
        // apply Y-axis rotation
        uv.xz = vec2(
            uv.x*cos(angleY) + uv.z*sin(angleY),
            uv.x*sin(angleY) - uv.z*cos(angleY)
        );
        // apply Z-axis rotation
        uv.xy = vec2(
            uv.x*cos(angleZ) - uv.y*sin(angleZ),
            uv.x*sin(angleZ) + uv.y*cos(angleZ)
        );
        // apply perspective projection
        vec2 stPersp = uv.xy / (uv.z + 1.0);
        // map frag coords to new coordinates
        vec2 result = vec2(stPersp.x, stPersp.y);
        result.x /= resolution.x / resolution.y;
        return result + 0.5;
`
})

ct = ()=> sharpen(s2,0,1).correctScaleRel(s2).contrast(1.1)
  			.scale(2.2,1,1,0).scroll(-.178,.3).rotate3D(-.2,-.35,.2)
  			.modulateScale(src(s1),-1.5)
solid(1.2,.1,.25).hsv.vOffset(-.1)
	.mult(uturb(2,0,5).scrollX(),.2)
	.add(blur(o0).scale(.99).hue(.3333),.25).mult(3.08)
	.layer(ct().mult(src(s0).thresh(.06,.05).r(),.9))
	.mult(src(s0).rgb.a())
  	.out()
src(o0)
	.out(o1)
render(o1)
