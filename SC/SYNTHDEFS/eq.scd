(
~dirt.addModule('eq', { |dirtEvent|
	dirtEvent.sendSynth('eq' ++ 2)
}, { ~eqa.notNil });

SynthDef("eq" ++ 2, { |out, eqf = 2000, eqq = 1.0, eqa = 0.0, sustain|
	var signal, outsignal;
	signal = In.ar(out, 2);
	outsignal = BPeakEQ.ar(signal,eqf,eqq,eqa);
	ReplaceOut.ar(out, outsignal);
}).add;
);
// 2
(
~dirt.addModule('eq2', { |dirtEvent|
	dirtEvent.sendSynth('eq2' ++ 2)
}, { ~eqa2.notNil });
SynthDef("eq2" ++ 2, { |out, eqf2 = 2000, eqq2 = 1.0, eqa2 = 0.0, sustain|
	var signal, outsignal;
	signal = In.ar(out, 2);
	outsignal = BPeakEQ.ar(signal,eqf2,eqq2,eqa2);
	ReplaceOut.ar(out, outsignal);
}).add;
);
// 3
(
~dirt.addModule('eq3', { |dirtEvent|
	dirtEvent.sendSynth('eq3' ++ 2)
}, { ~eqa3.notNil });
SynthDef("eq3" ++ 2, { |out, eqf3 = 2000, eqq3 = 1.0, eqa3 = 0.0, sustain|
	var signal, outsignal;
	signal = In.ar(out, 2);
	outsignal = BPeakEQ.ar(signal,eqf3,eqq3,eqa3);
	ReplaceOut.ar(out, outsignal);
}).add;
);