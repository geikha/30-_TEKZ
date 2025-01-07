(
~dirt.addModule('side', { |dirtEvent|
	dirtEvent.sendSynth('side' ++ 2)
}, { ~side.notNil });

SynthDef("side" ++ 2, { |out, side = 0, sustain|
	var signal = In.ar(out, 2);
	var ms = Balance2.ar(signal[0] + signal[1], signal[0] - signal[1], side);
	signal = [ms[0] + ms[1], ms[0] - ms[1]] * sqrt ( (side.max(0)+1)/2 );
	ReplaceOut.ar(out, signal);
}).add;
);