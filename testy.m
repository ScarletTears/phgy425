function test_return = testy(neuron)
	spikes=get_spikes(neuron);
	[~,bursts,~]=spikeAnalysis(spikes);

	positions=neuron.pos(find(neuron.stime==bursts));
	histogram(positions,50);
end