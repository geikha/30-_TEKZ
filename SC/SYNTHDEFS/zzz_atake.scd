(
~dirt.addModule('atake', { |dirtEvent|
	dirtEvent.sendSynth('atake' ++ 2)
}, { ~atake.notNil });

SynthDef("atake" ++ 2, { |out, atake = 0, ataket = 30, sustain|
	var signal = In.ar(out, 2);
	var trans = Line.ar(1+atake,1,ataket/1000);
	signal = signal * trans;
	ReplaceOut.ar(out, signal);
}).add;
);