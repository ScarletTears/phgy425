function sample = upSampler(neuron)
	sample=interp1(neuron.stime,neuron.pos,neuron.vtime);
end