(
~dirt.addModule('invst', { |dirtEvent|
	dirtEvent.sendSynth('invst' ++ 2)
}, { ~invst.notNil });

SynthDef("invst" ++ 2, { |out, sustain|
	var signal = In.ar(out, 2);
	var outsignal = [signal[1],signal[0]];
	ReplaceOut.ar(out, outsignal);
}).add;
);