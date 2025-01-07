(
~gaterModule = DirtModule('gater', { |dirtEvent|
	dirtEvent.sendSynth('gater' ++ 2)},
{ ~gater.notNil });
~dirt.modules.insert(1, ~gaterModule);

SynthDef("gater" ++ 2, { |out, gater = 0, sustain|
	var signal = In.ar(out, 2);
	var outsignal = Compander.ar(
		in: signal,
		control: signal,
		thresh: gater / 4.5,
		slopeBelow: 8,
		slopeAbove: 1,
		clampTime: 2/1000,
		relaxTime: 120/1000
	);
	ReplaceOut.ar(out, outsignal);
}).add;
);