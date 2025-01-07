(
~dirt.addModule('air', { |dirtEvent|
	dirtEvent.sendSynth('air' ++ 2)
}, { ~air.notNil });

SynthDef("air" ++ 2, { |out, air = 0, sustain|
	var signal, process, outsignal;
	signal = In.ar(out, 2);
	process = RHPF.ar(signal,11000,1.0);
	process = Compander.ar(process,process,0.3,1,3,0.02,0.1,2).softclip;
	outsignal = signal + (process*air);
	ReplaceOut.ar(out, outsignal);
}).add;
);