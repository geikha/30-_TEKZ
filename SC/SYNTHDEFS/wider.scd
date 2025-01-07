(
~dirt.addModule('wider', { |dirtEvent|
	dirtEvent.sendSynth('wider' ++ 2)
}, { ~wider.notNil });

SynthDef("wider" ++ 2, { |out, wider = 0, sustain|
	var signalL = In.ar(out, 1);
	var signalR = In.ar(out+1, 1);
	var maxdt = 1/44100*32; var mindt = 1/44100*24;
	var dt = wider * (mindt-maxdt) + maxdt;
	var left =  (signalL + DelayL.ar(signalL,dt,dt,wider));
	var right = (signalR - DelayL.ar(signalR,dt,dt,wider));
	ReplaceOut.ar(out, [left,right]);
}).add;
);